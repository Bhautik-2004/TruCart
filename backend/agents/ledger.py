"""Autopilot Ledger — decision capture.

Every time an agent auto-executes or escalates a decision it calls
``record_action(...)``. That writes one ``agent_action`` row carrying:

  * the decision parameters,
  * a **counterfactual baseline** (what the "do nothing" outcome would be),
    computed now from data the agent already has, and
  * ``verify_after`` — when ``verification.py`` should measure what actually
    happened and grade the decision.

Best-effort: any failure here is swallowed so it can never break an agent run.
"""

import logging
from datetime import datetime, timedelta, timezone
from typing import Any
from uuid import UUID

from ..db import get_supabase
from .base import get_store_config

logger = logging.getLogger("trucart.ledger")

# Rough monthly holding cost as a fraction of a PO's value (storage, capital).
_HOLDING_RATE_PER_MONTH = 0.02

# Set once if the agent_action table is missing (migration 016 not applied), so a
# pre-016 deployment logs it a single time instead of once per decision.
_ledger_unavailable = False


def _settle_days(action_type: str) -> int:
    return {
        "price_change": int(get_store_config("ledger_settle_days_price", 14)),
        "purchase_order": int(get_store_config("ledger_settle_days_po", 7)),
        "campaign": int(get_store_config("ledger_settle_days_campaign", 14)),
        "refund": int(get_store_config("ledger_settle_days_refund", 30)),
        "order_confirm": 7,
        "shipment_exception": 7,
    }.get(action_type, 14)


# --- baseline models --------------------------------------------------------
# Each returns (baseline_dict, measurability, projected_delta_inr).
# baseline_dict = {"formula": str, "inputs": {...}, "projected_delta_inr": float}
# baseline_delta_inr is the "do nothing" outcome; projected_delta_inr is the
# agent's own expectation of its action's outcome.

def _baseline_price_change(decision: dict, ctx: dict) -> tuple[dict, str, float]:
    velocity = float(ctx.get("daily_velocity") or 0.0)
    settle = _settle_days("price_change")
    old_price = float(decision.get("old_price") or 0.0)
    new_price = float(decision.get("new_price") or 0.0)
    cost = float(decision.get("effective_cost") or 0.0)
    do_nothing = velocity * settle * (old_price - cost)
    projected = velocity * settle * (new_price - cost)
    return (
        {
            "formula": "daily_velocity * settle_days * (old_price - effective_cost)",
            "inputs": {"daily_velocity": round(velocity, 3), "settle_days": settle,
                       "old_price": old_price, "new_price": new_price, "effective_cost": cost},
            "baseline_delta_inr": round(do_nothing, 2),
            "projected_delta_inr": round(projected, 2),
        },
        "measured",
        round(projected, 2),
    )


def _baseline_purchase_order(decision: dict, ctx: dict) -> tuple[dict, str, float]:
    velocity = float(ctx.get("daily_velocity") or 0.0)
    available = float(ctx.get("available") or 0.0)
    lead_days = float(ctx.get("lead_time_days") or 7)
    margin_unit = float(ctx.get("margin_per_unit") or 0.0)
    total_cost = float(decision.get("total_cost") or 0.0)
    lost_units = max(0.0, velocity * lead_days - available)
    do_nothing = -(lost_units * margin_unit)  # lost margin if we don't restock
    holding = total_cost * _HOLDING_RATE_PER_MONTH * (_settle_days("purchase_order") / 30.0)
    projected = (lost_units * margin_unit) - holding  # sales rescued, minus carrying
    return (
        {
            "formula": "-(max(0, velocity*lead_days - available) * margin_per_unit)",
            "inputs": {"daily_velocity": round(velocity, 3), "available": available,
                       "lead_time_days": lead_days, "margin_per_unit": round(margin_unit, 2),
                       "holding_cost": round(holding, 2)},
            "baseline_delta_inr": round(do_nothing, 2),
            "projected_delta_inr": round(projected, 2),
        },
        "measured",
        round(projected, 2),
    )


def _baseline_campaign(decision: dict, ctx: dict) -> tuple[dict, str, float]:
    budget = float(decision.get("budget") or 0.0)
    return (
        {
            "formula": "no campaign => 0",
            "inputs": {"budget": budget},
            "baseline_delta_inr": 0.0,
            "projected_delta_inr": round(budget * 0.5, 2),  # optimistic 1.5x ROAS, net of spend
        },
        "estimated",  # campaign_metrics are not real; realized value is synthesised
        round(budget * 0.5, 2),
    )


def _baseline_refund(decision: dict, ctx: dict) -> tuple[dict, str, float]:
    handle_cost = float(get_store_config("support_handle_cost_inr", 120))
    return (
        {
            "formula": "escalate instead => -support_handle_cost_inr",
            "inputs": {"support_handle_cost_inr": handle_cost,
                       "refund_amount": float(decision.get("refund_amount") or 0.0)},
            "baseline_delta_inr": round(-handle_cost, 2),
            "projected_delta_inr": round(handle_cost, 2),  # labour saved if it stays resolved
        },
        "estimated",
        round(handle_cost, 2),
    )


def _baseline_generic(decision: dict, ctx: dict) -> tuple[dict, str, float]:
    return ({"formula": "not modelled", "inputs": {}, "baseline_delta_inr": 0.0,
             "projected_delta_inr": 0.0}, "unmeasurable", 0.0)


_BASELINES = {
    "price_change": _baseline_price_change,
    "purchase_order": _baseline_purchase_order,
    "campaign": _baseline_campaign,
    "refund": _baseline_refund,
}


def record_action(
    *,
    action_type: str,
    agent_name: str,
    entity_type: str,
    entity_id: str | None,
    decision: dict[str, Any],
    correlation_id: UUID | str | None,
    autonomy: str = "auto",
    context: dict[str, Any] | None = None,
) -> str | None:
    """Insert one agent_action row with a counterfactual baseline. Returns the
    action_id, or None on any failure (never raises)."""
    global _ledger_unavailable
    if _ledger_unavailable:
        return None
    try:
        ctx = context or {}
        model = _BASELINES.get(action_type, _baseline_generic)
        baseline, measurability, _projected = model(decision, ctx)
        verify_after = datetime.now(timezone.utc) + timedelta(days=_settle_days(action_type))
        # A PO can't be judged until it has plausibly been delivered.
        if action_type == "purchase_order":
            verify_after += timedelta(days=float(ctx.get("lead_time_days") or 7))

        row = {
            "correlation_id": str(correlation_id) if correlation_id else None,
            "agent_name": agent_name,
            "action_type": action_type,
            "entity_type": entity_type,
            "entity_id": entity_id,
            "decision": decision,
            "baseline": baseline,
            "autonomy": autonomy,
            "measurability": measurability,
            "verify_after": verify_after.isoformat(),
            "baseline_delta_inr": baseline.get("baseline_delta_inr"),
            "status": "pending",
        }
        res = get_supabase().table("agent_action").insert(row).execute()
        return res.data[0]["action_id"] if res.data else None
    except Exception as exc:
        if "does not exist" in str(exc) or "schema cache" in str(exc):
            _ledger_unavailable = True
            logger.warning("Autopilot Ledger disabled: agent_action table missing — apply migration 016_ledger.sql")
        else:
            logger.warning("record_action skipped (%s/%s): %s", agent_name, action_type, exc)
        return None
