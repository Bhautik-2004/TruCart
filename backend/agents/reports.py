"""AI-generated operational reports — the "Generate weekly report" style
feature: pull a snapshot of store metrics and have the LLM write it up as a
short prose report, the same way every other agent turns structured data
into a JSON/text decision via call_llm_json.
"""

import os
from datetime import datetime, timedelta, timezone
from typing import Any

from ..db import get_supabase
from .base import call_llm_json, new_correlation_id

AGENT_NAME = "reports_agent"

_PERIOD_DAYS = {"today": 1, "week": 7, "month": 30}


def _since(period: str) -> datetime:
    days = _PERIOD_DAYS.get(period, 7)
    return datetime.now(timezone.utc) - timedelta(days=days)


def _gather_metrics(period: str) -> dict[str, Any]:
    supabase = get_supabase()
    since = _since(period).isoformat()

    orders = (
        supabase.table("orders")
        .select("order_id, total_amount, status, placed_at")
        .gte("placed_at", since)
        .execute()
        .data
        or []
    )
    revenue = round(sum(float(o["total_amount"] or 0) for o in orders if o["status"] != "cancelled"), 2)
    cancelled = sum(1 for o in orders if o["status"] == "cancelled")

    open_tickets = (
        supabase.table("support_tickets")
        .select("ticket_id, sentiment_label", count="exact")
        .eq("status", "open")
        .execute()
    )
    ticket_rows = open_tickets.data or []
    sentiment_breakdown = {"positive": 0, "neutral": 0, "negative": 0, "unscored": 0}
    for t in ticket_rows:
        label = t.get("sentiment_label")
        sentiment_breakdown[label if label in sentiment_breakdown else "unscored"] += 1

    pending_reviews = (
        supabase.table("review_queue")
        .select("review_id", count="exact")
        .eq("status", "pending")
        .execute()
        .count
        or 0
    )

    inventory = supabase.table("inventory").select("quantity_available, reorder_point").execute().data or []
    low_stock_count = sum(1 for i in inventory if (i["quantity_available"] or 0) <= (i["reorder_point"] or 0))

    price_changes = (
        supabase.table("price_history")
        .select("history_id", count="exact")
        .gte("created_at", since)
        .execute()
        .count
        or 0
    )

    agent_actions = (
        supabase.table("agent_action")
        .select("agent_name, action_type, autonomy, grade, realized_delta_inr, baseline_delta_inr")
        .gte("created_at", since)
        .execute()
        .data
        or []
    )
    verified = [a for a in agent_actions if a.get("grade") in ("win", "loss", "neutral")]
    net_impact = round(sum(
        float(a["realized_delta_inr"] or 0) - float(a["baseline_delta_inr"] or 0) for a in verified
    ), 2)

    return {
        "period": period,
        "orders_count": len(orders),
        "revenue_inr": revenue,
        "cancelled_orders": cancelled,
        "open_tickets": len(ticket_rows),
        "ticket_sentiment_breakdown": sentiment_breakdown,
        "pending_human_reviews": pending_reviews,
        "low_stock_skus": low_stock_count,
        "price_changes": price_changes,
        "agent_actions_total": len(agent_actions),
        "agent_actions_net_impact_inr": net_impact,
    }


def generate_report(period: str = "week", focus: str | None = None) -> dict[str, Any]:
    """Build a metrics snapshot for `period` ("today" | "week" | "month") and
    have the LLM write it up as a short markdown report, optionally centered
    on a `focus` area (e.g. "inventory risk", "customer satisfaction"). The
    report is persisted to ai_reports for history and returned."""
    if period not in _PERIOD_DAYS:
        period = "week"

    supabase = get_supabase()
    metrics = _gather_metrics(period)
    correlation_id = new_correlation_id()

    system_prompt = (
        "You are an operations analyst for an e-commerce store. You are given a JSON "
        "snapshot of store metrics for a period. Write a concise report in markdown "
        "with a short headline summary, then 3-6 bullet points calling out the most "
        "important findings (revenue, risk, customer sentiment, inventory, agent "
        "automation impact), and a final 'Recommended actions' section with 1-3 items. "
        "Be specific and reference the actual numbers given. Return JSON: "
        '{"title": "short report title", "content_md": "the full markdown report"}.'
    )
    user_prompt = str({"metrics": metrics, "focus": focus or "overall store health"})

    llm_result = call_llm_json(
        system_prompt=system_prompt,
        user_prompt=user_prompt,
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="generate-ai-report",
        trace_metadata={"period": period, "focus": focus},
    )

    model_used = None
    if llm_result is None:
        title = f"{period.title()}ly Store Report"
        content_md = (
            "_The AI writer is unavailable right now, so here is the raw metrics snapshot:_\n\n"
            + "\n".join(f"- **{k}**: {v}" for k, v in metrics.items())
        )
    else:
        model_used = os.getenv("OLLAMA_MODEL", "qwen2.5:7b")
        title = llm_result.get("title") or f"{period.title()}ly Store Report"
        content_md = llm_result.get("content_md") or ""

    row = {
        "period": period,
        "focus": focus,
        "title": title,
        "content_md": content_md,
        "model_used": model_used,
        "correlation_id": str(correlation_id),
    }
    inserted = supabase.table("ai_reports").insert(row).execute()
    report_id = inserted.data[0]["report_id"] if inserted.data else None

    return {**row, "report_id": report_id, "metrics": metrics}


def list_reports(limit: int = 20) -> list[dict[str, Any]]:
    return (
        get_supabase()
        .table("ai_reports")
        .select("report_id, period, focus, title, created_at")
        .order("created_at", desc=True)
        .limit(limit)
        .execute()
        .data
        or []
    )
