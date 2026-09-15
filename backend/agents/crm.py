"""AI Customer CRM — deterministic RFM (Recency/Frequency/Monetary)
segmentation, the same "deterministic math, LLM only for narration" split
used everywhere else in this codebase (see agents/ledger.py, agents/risk.py).
The LLM is only asked for one "next best action" per segment, not per
customer, since customers within a segment share the same story.
"""

from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import call_llm_json, new_correlation_id

AGENT_NAME = "crm_agent"

_CHURN_RISK_DAYS = 90


def _segment(recency_days: float | None, total_orders: int, lifetime_value: float) -> str:
    if total_orders == 0:
        return "prospect"  # never ordered
    if recency_days is None:
        return "prospect"
    if recency_days <= 30 and total_orders <= 1:
        return "new"
    if recency_days > _CHURN_RISK_DAYS:
        return "at_risk" if lifetime_value > 0 else "lost"
    if total_orders >= 3 and lifetime_value >= 20000:
        return "champion"
    if total_orders >= 2:
        return "loyal"
    return "needs_attention"


def compute_customer_segments() -> dict[str, Any]:
    supabase = get_supabase()
    customers = (
        supabase.table("customers")
        .select("customer_id, full_name, email, segment, total_orders, lifetime_value")
        .execute()
        .data
        or []
    )
    orders = supabase.table("orders").select("customer_id, placed_at").execute().data or []

    last_order_by_customer: dict[str, str] = {}
    for o in orders:
        cid = o["customer_id"]
        if cid not in last_order_by_customer or o["placed_at"] > last_order_by_customer[cid]:
            last_order_by_customer[cid] = o["placed_at"]

    now = datetime.now(timezone.utc)
    results = []
    for c in customers:
        last_order = last_order_by_customer.get(c["customer_id"])
        recency_days = None
        if last_order:
            last_dt = datetime.fromisoformat(last_order.replace("Z", "+00:00"))
            recency_days = (now - last_dt).days

        total_orders = int(c.get("total_orders") or 0)
        lifetime_value = float(c.get("lifetime_value") or 0)
        rfm_segment = _segment(recency_days, total_orders, lifetime_value)

        results.append({
            "customer_id": c["customer_id"],
            "full_name": c["full_name"],
            "email": c["email"],
            "crm_segment": rfm_segment,
            "recency_days": recency_days,
            "total_orders": total_orders,
            "lifetime_value": lifetime_value,
            "churn_risk": rfm_segment in ("at_risk", "lost"),
        })

    counts: dict[str, int] = {}
    for r in results:
        counts[r["crm_segment"]] = counts.get(r["crm_segment"], 0) + 1

    return {"customers": results, "segment_counts": counts}


def next_best_action(segment: str) -> dict[str, Any]:
    """One LLM call per segment (not per customer) to recommend a marketing
    action. Deterministic fallback text if the model is unreachable."""
    fallback = {
        "champion": "Reward with early access to new arrivals or a loyalty perk to keep them engaged.",
        "loyal": "Send a personalized thank-you offer to reinforce the relationship.",
        "at_risk": "Send a win-back campaign with a time-limited discount before they churn.",
        "lost": "Try a low-cost reactivation email; if no response, deprioritize further spend.",
        "new": "Send a welcome series introducing your best-selling categories.",
        "needs_attention": "Send a personalized recommendation based on their last purchase.",
        "prospect": "Not yet a customer — focus on acquisition campaigns, not retention.",
    }.get(segment, "Review this segment manually.")

    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=(
            "You are a CRM/lifecycle marketing advisor for an e-commerce store. Given a customer "
            "RFM segment name, recommend one concrete next-best-action a marketing team could take "
            "for that whole segment (e.g. campaign type, offer, channel). 2-3 sentences. "
            'Return JSON: {"action": "..."}.'
        ),
        user_prompt=str({"segment": segment}),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="crm-next-best-action",
        trace_metadata={"segment": segment},
    )
    action = (llm_result or {}).get("action") or fallback
    return {"segment": segment, "action": action}
