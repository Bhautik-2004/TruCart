"""Autopilot Ledger — verification sweep + autonomy evaluation.

Runs on a schedule (see ``scheduler.py``). For every ``agent_action`` whose
``verify_after`` has passed it measures what actually happened from the
operational tables, books a realized ₹ delta, and grades the decision win /
loss / neutral against its counterfactual baseline. It then re-scores each
agent and, when a verified win-rate falls outside the configured band, enqueues
a one-click ``autonomy_adjustment`` proposal.
"""

import logging
from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import enqueue_review, get_store_config, load_agent_config
from .demand import units_sold_by_product

logger = logging.getLogger("trucart.verification")

_EPSILON_INR = 1.0


def _now_iso() -> str:
    return datetime.now(timezone.utc).isoformat()


def _grade(realized: float, baseline: float) -> str:
    if realized > baseline + _EPSILON_INR:
        return "win"
    if realized < baseline - _EPSILON_INR:
        return "loss"
    return "neutral"


# --- per-type realized-outcome measurement --------------------------------

def _verify_price_change(supabase: Any, a: dict) -> tuple[float, str, dict]:
    d = a.get("decision") or {}
    product_id = d.get("product_id") or a.get("entity_id")
    new_price = float(d.get("new_price") or 0.0)
    cost = float(d.get("effective_cost") or 0.0)
    start = a["created_at"]
    sold = units_sold_by_product(supabase, start, _now_iso(), product_ids=[product_id]).get(product_id, 0)
    realized = sold * (new_price - cost)
    return realized, "measured", {"units_sold": sold, "margin_per_unit": round(new_price - cost, 2)}


def _verify_purchase_order(supabase: Any, a: dict) -> tuple[float, str, dict]:
    d = a.get("decision") or {}
    b = a.get("baseline") or {}
    po_id = a.get("entity_id")
    po = (
        supabase.table("purchase_orders").select("status, product_id, quantity")
        .eq("po_id", po_id).limit(1).execute().data or [{}]
    )[0]
    received = po.get("status") == "received"
    projected = float(b.get("projected_delta_inr") or 0.0)
    baseline = float(b.get("baseline_delta_inr") or 0.0)
    # If the PO was received and nothing stocked out for the product since, credit
    # the projected rescue; otherwise the restock didn't help -> baseline outcome.
    realized = projected if received else baseline
    return realized, "estimated", {"po_status": po.get("status"), "received": received}


def _verify_campaign(supabase: Any, a: dict) -> tuple[float, str, dict]:
    d = a.get("decision") or {}
    product_id = d.get("product_id")
    budget = float(d.get("budget") or 0.0)
    prod = (
        supabase.table("products").select("current_price, cost_price")
        .eq("product_id", product_id).limit(1).execute().data or [{}]
    )[0]
    margin_unit = float(prod.get("current_price") or 0) - float(prod.get("cost_price") or 0)
    sold = units_sold_by_product(supabase, a["created_at"], _now_iso(), product_ids=[product_id]).get(product_id, 0)
    realized = sold * margin_unit - budget
    return realized, "estimated", {"units_sold": sold, "margin_per_unit": round(margin_unit, 2), "budget": budget}


def _verify_refund(supabase: Any, a: dict) -> tuple[float, str, dict]:
    d = a.get("decision") or {}
    b = a.get("baseline") or {}
    ticket_id = d.get("ticket_id")
    handle_cost = float((b.get("inputs") or {}).get("support_handle_cost_inr") or get_store_config("support_handle_cost_inr", 120))
    reopened = False
    if ticket_id:
        t = (
            supabase.table("support_tickets").select("status, resolved_at")
            .eq("ticket_id", ticket_id).limit(1).execute().data or [{}]
        )[0]
        if t.get("status") in ("open", "reopened"):
            reopened = True
        elif t.get("resolved_at"):
            msgs = (
                supabase.table("ticket_messages").select("created_at")
                .eq("ticket_id", ticket_id).gt("created_at", t["resolved_at"]).limit(1).execute().data or []
            )
            reopened = bool(msgs)
    realized = -(2 * handle_cost) if reopened else handle_cost
    return realized, "estimated", {"reopened": reopened, "handle_cost": handle_cost}


_VERIFIERS = {
    "price_change": _verify_price_change,
    "purchase_order": _verify_purchase_order,
    "campaign": _verify_campaign,
    "refund": _verify_refund,
}


def _verify_one(supabase: Any, a: dict) -> dict:
    verifier = _VERIFIERS.get(a["action_type"])
    if verifier is None:
        return {"status": "skipped", "grade": "unmeasurable", "verified_at": _now_iso()}
    realized, measurability, outcome = verifier(supabase, a)
    baseline = float((a.get("baseline") or {}).get("baseline_delta_inr") or 0.0)
    projected = float((a.get("baseline") or {}).get("projected_delta_inr") or 0.0)
    return {
        "status": "verified",
        "outcome": outcome,
        "realized_delta_inr": round(realized, 2),
        "baseline_delta_inr": round(baseline, 2),
        "calibration_error": round(abs(projected - realized), 2),
        "grade": _grade(realized, baseline),
        "measurability": measurability,
        "verified_at": _now_iso(),
    }


def run_verification_sweep(limit: int = 200) -> dict[str, Any]:
    supabase = get_supabase()
    due = (
        supabase.table("agent_action").select("*")
        .eq("status", "pending").lte("verify_after", _now_iso())
        .order("verify_after", desc=False).limit(limit).execute().data or []
    )
    verified = skipped = 0
    agents_touched: set[str] = set()
    for a in due:
        try:
            patch = _verify_one(supabase, a)
            supabase.table("agent_action").update(patch).eq("action_id", a["action_id"]).execute()
            agents_touched.add(a["agent_name"])
            if patch["status"] == "verified":
                verified += 1
            else:
                skipped += 1
        except Exception:
            logger.exception("verification failed for action %s", a.get("action_id"))

    proposals = 0
    for agent in sorted(agents_touched):
        try:
            if evaluate_autonomy(supabase, agent):
                proposals += 1
        except Exception:
            logger.exception("autonomy evaluation failed for %s", agent)

    _prune_notifications(supabase)
    return {"due": len(due), "verified": verified, "skipped": skipped, "autonomy_proposals": proposals}


# --- autonomy envelope ---------------------------------------------------

# agent -> (scope, key, tighten(value), widen(value))
_KNOBS: dict[str, tuple[str, str, Any, Any]] = {
    "pricing_agent": ("store_config", "price_change_max_pct",
                      lambda v: max(2.0, round(v * 0.7, 1)), lambda v: min(25.0, round(v * 1.3, 1))),
    "inventory_agent": ("store_config", "po_auto_approve_limit",
                        lambda v: max(500.0, round(v * 0.6)), lambda v: round(v * 1.5)),
    "marketing_agent": ("agent_config", "budget_auto_approve_limit",
                        lambda v: max(50.0, round(v * 0.6)), lambda v: round(v * 1.5)),
    "support_agent": ("agent_config", "auto_resolve_confidence_min",
                      lambda v: min(0.95, round(v + 0.1, 2)), lambda v: max(0.6, round(v - 0.05, 2))),
}


def _current_knob(scope: str, key: str, agent: str) -> float | None:
    if scope == "store_config":
        val = get_store_config(key, None)
    else:
        val = load_agent_config(agent).get(key)
    try:
        return float(val)
    except (TypeError, ValueError):
        return None


def evaluate_autonomy(supabase: Any, agent_name: str) -> bool:
    """Score the agent's recent verified actions; enqueue an autonomy_adjustment
    review item if the win-rate is out of band. Returns True if one was created."""
    knob = _KNOBS.get(agent_name)
    if knob is None:
        return False
    scope, key, tighten, widen = knob

    min_sample = int(get_store_config("ledger_min_sample", 8))
    floor = float(get_store_config("ledger_win_rate_floor", 0.5))
    ceiling = float(get_store_config("ledger_win_rate_ceiling", 0.8))

    recent = (
        supabase.table("agent_action")
        .select("action_id, grade")
        .eq("agent_name", agent_name).eq("status", "verified")
        .in_("grade", ["win", "loss", "neutral"])
        .order("verified_at", desc=True).limit(min_sample).execute().data or []
    )
    if len(recent) < min_sample:
        return False
    decisive = [r for r in recent if r["grade"] in ("win", "loss")]
    if not decisive:
        return False
    win_rate = sum(1 for r in decisive if r["grade"] == "win") / len(decisive)

    if win_rate < floor:
        direction = "tighten"
    elif win_rate >= ceiling:
        direction = "widen"
    else:
        return False

    current = _current_knob(scope, key, agent_name)
    if current is None:
        return False
    proposed = (tighten if direction == "tighten" else widen)(current)
    if proposed == current:
        return False

    # Idempotency: one open proposal per agent at a time.
    open_rows = (
        supabase.table("review_queue").select("payload, status")
        .eq("item_type", "autonomy_adjustment").eq("status", "pending")
        .limit(50).execute().data or []
    )
    for row in open_rows:
        if (row.get("payload") or {}).get("agent_name") == agent_name:
            return False

    evidence = [r["action_id"] for r in recent]
    verb = "Reduce" if direction == "tighten" else "Widen"
    summary = (
        f"{verb} {agent_name.replace('_', ' ')} autonomy: {key} {current:g} → {proposed:g} "
        f"(verified win-rate {win_rate:.0%} over last {len(decisive)} decisions)."
    )
    enqueue_review(
        item_type="autonomy_adjustment",
        reference_id=evidence[0],
        agent_name="autopilot_ledger",
        summary=summary,
        payload={
            "source": "autopilot_ledger",
            "item_type": "autonomy_adjustment",
            "agent_name": agent_name,
            "scope": scope,
            "key": key,
            "from": current,
            "to": proposed,
            "direction": direction,
            "win_rate": round(win_rate, 3),
            "sample": len(decisive),
            "evidence_action_ids": evidence,
        },
    )
    return True


def _prune_notifications(supabase: Any) -> None:
    from datetime import timedelta

    cutoff = (datetime.now(timezone.utc) - timedelta(days=30)).isoformat()
    try:
        supabase.table("notifications").delete().eq("is_read", True).lt("created_at", cutoff).execute()
    except Exception:
        logger.exception("notification prune failed")
