"""Deterministic order risk/fraud scoring. Kept separate from the LLM path on
purpose: the score itself must be reproducible and auditable (a judge or an
operator can check the arithmetic), and only the human-readable explanation
of a flagged order is left to the LLM (see explain.py). This mirrors the
ledger's baseline-model pattern in agents/ledger.py — deterministic math,
LLM only for narration.
"""

from datetime import datetime, timedelta, timezone
from typing import Any

from ..db import get_supabase

# Tunable thresholds. Not exposed via agent_config (store_config) yet since
# there's no operator UI for a risk agent — hardcoded, documented here.
_NEW_CUSTOMER_ORDER_COUNT = 1  # total_orders <= this counts as "new"
_HIGH_VALUE_MULTIPLIER = 3.0  # order value vs customer's average order value
_HIGH_VALUE_ABSOLUTE_INR = 15000.0  # or outright large in absolute terms
_VELOCITY_WINDOW_HOURS = 24
_VELOCITY_ORDER_COUNT = 3  # N+ orders by the same customer within the window
_COD_HIGH_VALUE_INR = 5000.0

_SCORE_WEIGHTS = {
    "new_customer_high_value": 0.4,
    "high_value_vs_average": 0.25,
    "order_velocity": 0.25,
    "cod_high_value": 0.2,
}


def assess_order_risk(order: dict[str, Any], customer: dict[str, Any], supabase=None) -> dict[str, Any]:
    """Score one order 0.0-1.0. `order` needs order_id, customer_id,
    total_amount, payment_method. `customer` needs total_orders,
    lifetime_value. Returns {score, level, reasons}."""
    supabase = supabase or get_supabase()
    reasons: list[str] = []
    score = 0.0

    total_amount = float(order.get("total_amount") or 0)
    total_orders = int(customer.get("total_orders") or 0)
    lifetime_value = float(customer.get("lifetime_value") or 0)
    average_order_value = (lifetime_value / total_orders) if total_orders > 0 else 0.0

    is_new = total_orders <= _NEW_CUSTOMER_ORDER_COUNT
    is_high_value = total_amount >= _HIGH_VALUE_ABSOLUTE_INR
    if is_new and is_high_value:
        score += _SCORE_WEIGHTS["new_customer_high_value"]
        reasons.append(
            f"New customer (order history: {total_orders}) placing a high-value order "
            f"(₹{total_amount:,.2f})."
        )

    if average_order_value > 0 and total_amount >= average_order_value * _HIGH_VALUE_MULTIPLIER:
        score += _SCORE_WEIGHTS["high_value_vs_average"]
        reasons.append(
            f"Order (₹{total_amount:,.2f}) is {total_amount / average_order_value:.1f}x this "
            f"customer's average order value (₹{average_order_value:,.2f})."
        )

    since = (datetime.now(timezone.utc) - timedelta(hours=_VELOCITY_WINDOW_HOURS)).isoformat()
    recent_count = (
        supabase.table("orders")
        .select("order_id", count="exact")
        .eq("customer_id", order["customer_id"])
        .gte("placed_at", since)
        .execute()
        .count
        or 0
    )
    if recent_count >= _VELOCITY_ORDER_COUNT:
        score += _SCORE_WEIGHTS["order_velocity"]
        reasons.append(f"{recent_count} orders from this customer in the last {_VELOCITY_WINDOW_HOURS}h.")

    if (order.get("payment_method") or "") == "cod" and total_amount >= _COD_HIGH_VALUE_INR:
        score += _SCORE_WEIGHTS["cod_high_value"]
        reasons.append(f"Cash-on-delivery order above ₹{_COD_HIGH_VALUE_INR:,.0f}.")

    score = min(1.0, round(score, 3))
    level = "high" if score >= 0.5 else "medium" if score >= 0.25 else "low"

    return {"score": score, "level": level, "reasons": reasons}
