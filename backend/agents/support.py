import os
from datetime import datetime
from typing import Any

from ..db import get_supabase
from .base import (
    call_llm_json,
    enqueue_review,
    get_store_config,
    load_agent_config,
    log_task,
    new_correlation_id,
)

AGENT_NAME = "support_agent"
_PRIORITY_RANK = {"high": 0, "medium": 1, "normal": 2, "low": 3}


def run_support_agent() -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 5))
    auto_resolve_confidence_min = float(config.get("auto_resolve_confidence_min", 0.75))
    refund_auto_approve_limit = float(get_store_config("refund_auto_approve_limit", 100))
    correlation_id = new_correlation_id()

    tickets_result = (
        supabase.table("support_tickets")
        .select("ticket_id, order_id, subject, description, category, priority, created_at")
        .eq("status", "open")
        .execute()
    )
    tickets = sorted(
        tickets_result.data or [],
        key=lambda t: (_PRIORITY_RANK.get(t["priority"], 2), t["created_at"]),
    )[:max_items]

    if not tickets:
        log_id = log_task(
            AGENT_NAME, "ticket_triage", "completed",
            input_data={"open_tickets": 0}, output_data={"scanned": 0, "auto_executed": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    auto_executed = 0
    escalated = 0
    outcomes = []
    model_used = None

    for ticket in tickets:
        llm_result = call_llm_json(
            system_prompt=(
                "You are a customer support triage assistant for an e-commerce store. "
                "Read the ticket and decide how to handle it. Return JSON: "
                '{"resolution_text": "...", "confidence_score": 0.0-1.0, '
                '"refund_amount": number or null, "action": "resolve" | "refund" | "escalate"}. '
                "Use \"refund\" only if the customer is clearly owed money back. "
                "Use \"escalate\" if you are unsure or the issue needs human judgment."
            ),
            user_prompt=str({
                "subject": ticket["subject"],
                "description": ticket["description"],
                "category": ticket["category"],
                "has_order": ticket["order_id"] is not None,
            }),
        )
        if llm_result is None:
            llm_result = {"resolution_text": "Unable to auto-resolve; needs human review.", "confidence_score": 0.0, "refund_amount": None, "action": "escalate"}
        else:
            model_used = os.getenv("OLLAMA_MODEL", "qwen2.5:7b")

        action = llm_result.get("action", "escalate")
        confidence = float(llm_result.get("confidence_score") or 0)
        resolution_text = llm_result.get("resolution_text") or "Reviewed by support agent."
        refund_amount = llm_result.get("refund_amount")

        if action == "refund" and ticket["order_id"] is None:
            action = "escalate"

        if action == "resolve" and confidence >= auto_resolve_confidence_min:
            supabase.table("support_tickets").update({
                "status": "resolved",
                "resolution": resolution_text,
                "confidence_score": confidence,
                "resolved_at": datetime.utcnow().isoformat(),
            }).eq("ticket_id", ticket["ticket_id"]).execute()
            auto_executed += 1
            outcomes.append({"ticket_id": ticket["ticket_id"], "action": "resolved"})

        elif action == "refund":
            refund_amount = float(refund_amount or 0)
            if refund_amount <= refund_auto_approve_limit:
                supabase.table("orders").update({"status": "cancelled", "payment_status": "refunded"}).eq("order_id", ticket["order_id"]).execute()
                supabase.table("support_tickets").update({
                    "status": "resolved",
                    "resolution": resolution_text,
                    "confidence_score": confidence,
                    "resolved_at": datetime.utcnow().isoformat(),
                }).eq("ticket_id", ticket["ticket_id"]).execute()
                auto_executed += 1
                outcomes.append({"ticket_id": ticket["ticket_id"], "action": "refunded", "amount": refund_amount})
            else:
                escalated += 1
                enqueue_review(
                    item_type="refund",
                    reference_id=ticket["order_id"],
                    agent_name=AGENT_NAME,
                    summary=f"Refund ₹{refund_amount:,.2f} for order (ticket: {ticket['subject']})",
                    payload={
                        "source": AGENT_NAME,
                        "item_type": "refund",
                        "ticket_id": ticket["ticket_id"],
                        "order_id": ticket["order_id"],
                        "refund_amount": refund_amount,
                        "resolution_text": resolution_text,
                        "confidence_score": confidence,
                    },
                )
                outcomes.append({"ticket_id": ticket["ticket_id"], "action": "escalated_refund", "amount": refund_amount})

        else:
            escalated += 1
            enqueue_review(
                item_type="other",
                reference_id=ticket["ticket_id"],
                agent_name=AGENT_NAME,
                summary=f"Needs human review: {ticket['subject']}",
                payload={
                    "source": AGENT_NAME,
                    "item_type": "other",
                    "ticket_id": ticket["ticket_id"],
                    "resolution_text": resolution_text,
                    "confidence_score": confidence,
                },
            )
            outcomes.append({"ticket_id": ticket["ticket_id"], "action": "escalated"})

    log_id = log_task(
        AGENT_NAME, "ticket_triage", "completed",
        input_data={"tickets_processed": len(tickets)},
        output_data={"outcomes": outcomes, "auto_executed": auto_executed, "escalated": escalated},
        model_used=model_used,
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": len(tickets), "auto_executed": auto_executed, "escalated": escalated},
    }
