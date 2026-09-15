import os
from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import (
    call_llm_json,
    enqueue_review,
    get_store_config,
    load_agent_config,
    load_active_policies,
    log_task,
    new_correlation_id,
    notify,
)
from .ledger import record_action
from .rag import format_context, retrieve

AGENT_NAME = "support_agent"
_PRIORITY_RANK = {"high": 0, "medium": 1, "normal": 2, "low": 3}
_VALID_SENTIMENTS = {"positive", "neutral", "negative"}


def run_support_agent(correlation_id=None) -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 5))
    auto_resolve_confidence_min = float(config.get("auto_resolve_confidence_min", 0.75))
    refund_auto_approve_limit = float(get_store_config("refund_auto_approve_limit", 100))
    correlation_id = correlation_id or new_correlation_id()

    tickets_result = (
        supabase.table("support_tickets")
        .select("ticket_id, order_id, subject, description, category, priority, created_at")
        .eq("status", "open")
        .execute()
    )
    tickets = sorted(
        tickets_result.data or [],
        key=lambda t: (_PRIORITY_RANK.get(t["priority"], 2), t["created_at"]),
    )

    # Idempotency: an escalated ticket stays 'open', so skip any ticket that
    # already has a pending review item (otherwise every run re-escalates it).
    if tickets:
        pending = (
            supabase.table("review_queue")
            .select("reference_id, payload")
            .eq("status", "pending")
            .eq("agent_name", AGENT_NAME)
            .execute()
            .data
            or []
        )
        pending_ticket_ids: set = set()
        for r in pending:
            if r.get("reference_id"):
                pending_ticket_ids.add(r["reference_id"])
            pl = r.get("payload") or {}
            if pl.get("ticket_id"):
                pending_ticket_ids.add(pl["ticket_id"])
        tickets = [t for t in tickets if t["ticket_id"] not in pending_ticket_ids]

    tickets = tickets[:max_items]

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
        # RAG: pull the most relevant policy / FAQ / past-resolution snippets so
        # the model triages against store rules rather than guessing. Degrades to
        # no context if the embedding model or the match RPC is unavailable.
        kb_chunks = retrieve(f"{ticket['subject']} {ticket['description']}", k=4)
        kb_ids = [c["kb_id"] for c in kb_chunks if c.get("kb_id")]
        kb_context = format_context(kb_chunks)

        system_prompt = load_active_policies(AGENT_NAME) + (
            "You are a customer support triage assistant for an e-commerce store. "
            "Read the ticket and decide how to handle it. Return JSON: "
            '{"resolution_text": "...", "confidence_score": 0.0-1.0, '
            '"refund_amount": number or null, "action": "resolve" | "refund" | "escalate"}. '
            "Use \"refund\" only if the customer is clearly owed money back. "
            "Use \"escalate\" if you are unsure or the issue needs human judgment."
        )
        if kb_context:
            system_prompt += (
                "\n\nRelevant store policy / FAQ / past resolutions:\n"
                + kb_context
                + "\n\nBase your decision on this context where it applies, and reference it in resolution_text."
            )

        llm_result = call_llm_json(
            system_prompt=system_prompt,
            user_prompt=str({
                "subject": ticket["subject"],
                "description": ticket["description"],
                "category": ticket["category"],
                "has_order": ticket["order_id"] is not None,
            }),
            agent_name=AGENT_NAME,
            correlation_id=correlation_id,
            call_name="triage-support-ticket",
            trace_metadata={"ticket_id": ticket["ticket_id"], "kb_ids": kb_ids},
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
                "resolved_at": datetime.now(timezone.utc).isoformat(),
            }).eq("ticket_id", ticket["ticket_id"]).execute()
            auto_executed += 1
            outcomes.append({"ticket_id": ticket["ticket_id"], "action": "resolved", "kb_ids": kb_ids})
            notify(
                "Support ticket resolved",
                f"Auto-resolved: {ticket['subject']}",
                type="success",
                reference_id=ticket["ticket_id"],
                reference_type="support_ticket",
            )

        elif action == "refund":
            order_row = (
                supabase.table("orders")
                .select("total_amount, status")
                .eq("order_id", ticket["order_id"])
                .limit(1)
                .execute()
                .data
                or [{}]
            )
            order_total = float(order_row[0].get("total_amount") or 0)
            requested_amount = float(refund_amount or 0)
            # Never refund more than the order was worth. The config ceiling
            # (refund_auto_approve_limit) alone would let a hallucinated amount
            # under the cap through; clamp to the real order total first.
            refund_amount = min(requested_amount, order_total) if order_total > 0 else 0.0

            if refund_amount <= 0:
                escalated += 1
                enqueue_review(
                    item_type="other",
                    reference_id=ticket["ticket_id"],
                    agent_name=AGENT_NAME,
                    summary=f"Refund amount could not be determined: {ticket['subject']}",
                    payload={
                        "source": AGENT_NAME,
                        "item_type": "other",
                        "ticket_id": ticket["ticket_id"],
                        "order_id": ticket["order_id"],
                        "requested_amount": requested_amount,
                        "order_total": order_total,
                        "resolution_text": resolution_text,
                        "confidence_score": confidence,
                    },
                )
                outcomes.append({"ticket_id": ticket["ticket_id"], "action": "escalated_refund", "reason": "amount_undetermined", "kb_ids": kb_ids})
            elif refund_amount <= refund_auto_approve_limit:
                # Release any stock this order had reserved before cancelling it,
                # so availability doesn't silently drift down.
                if (order_row[0].get("status") or "") in ("confirmed", "processing", "shipped"):
                    try:
                        supabase.rpc("release_order_reservation", {"p_order_id": ticket["order_id"]}).execute()
                    except Exception:
                        # RPC absent until migration 016 is applied — the refund
                        # still proceeds; reservation is reconciled later.
                        pass
                supabase.table("orders").update({"status": "cancelled", "payment_status": "refunded"}).eq("order_id", ticket["order_id"]).execute()
                supabase.table("support_tickets").update({
                    "status": "resolved",
                    "resolution": resolution_text,
                    "confidence_score": confidence,
                    "resolved_at": datetime.now(timezone.utc).isoformat(),
                }).eq("ticket_id", ticket["ticket_id"]).execute()
                auto_executed += 1
                outcomes.append({"ticket_id": ticket["ticket_id"], "action": "refunded", "amount": refund_amount, "requested": requested_amount, "order_total": order_total, "kb_ids": kb_ids})
                notify(
                    "Refund auto-approved",
                    f"₹{refund_amount:,.2f} refunded for ticket: {ticket['subject']}",
                    type="success",
                    reference_id=ticket["ticket_id"],
                    reference_type="support_ticket",
                )
                record_action(
                    action_type="refund",
                    agent_name=AGENT_NAME,
                    entity_type="support_ticket",
                    entity_id=ticket["ticket_id"],
                    decision={"ticket_id": ticket["ticket_id"], "order_id": ticket["order_id"],
                              "refund_amount": refund_amount},
                    correlation_id=correlation_id,
                    autonomy="auto",
                )
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
                        "requested_amount": requested_amount,
                        "order_total": order_total,
                        "resolution_text": resolution_text,
                        "confidence_score": confidence,
                    },
                )
                outcomes.append({"ticket_id": ticket["ticket_id"], "action": "escalated_refund", "amount": refund_amount, "order_total": order_total, "kb_ids": kb_ids})
                record_action(
                    action_type="refund",
                    agent_name=AGENT_NAME,
                    entity_type="support_ticket",
                    entity_id=ticket["ticket_id"],
                    decision={"ticket_id": ticket["ticket_id"], "order_id": ticket["order_id"],
                              "refund_amount": refund_amount},
                    correlation_id=correlation_id,
                    autonomy="escalated",
                )

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
            outcomes.append({"ticket_id": ticket["ticket_id"], "action": "escalated", "kb_ids": kb_ids})

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


def analyze_ticket_sentiment(ticket_id: str) -> dict[str, Any]:
    """Score one ticket's customer sentiment with the LLM and persist it onto
    the row. Falls back to a neutral/unscored result (rather than raising) if
    the ticket is missing or the model call fails, so a bulk sweep can keep
    going past one bad ticket."""
    supabase = get_supabase()
    rows = (
        supabase.table("support_tickets")
        .select("ticket_id, subject, description, category, priority")
        .eq("ticket_id", ticket_id)
        .limit(1)
        .execute()
        .data
        or []
    )
    if not rows:
        return {"ticket_id": ticket_id, "sentiment_label": None, "sentiment_score": None, "error": "ticket not found"}

    ticket = rows[0]
    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=(
            "You are a customer sentiment analysis assistant for an e-commerce support desk. "
            "Read the ticket and judge how the customer feels. Return JSON: "
            '{"sentiment": "positive" | "neutral" | "negative", '
            '"sentiment_score": -1.0 to 1.0 (negative = unhappy, positive = happy), '
            '"summary": "one sentence describing the customer\'s tone and urgency"}.'
        ),
        user_prompt=str({
            "subject": ticket["subject"],
            "description": ticket["description"],
            "category": ticket["category"],
            "priority": ticket["priority"],
        }),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="analyze-ticket-sentiment",
        trace_metadata={"ticket_id": ticket_id},
    )

    if llm_result is None:
        sentiment, score, summary = "neutral", 0.0, "Unable to analyze sentiment (LLM unavailable)."
    else:
        sentiment = str(llm_result.get("sentiment") or "neutral").lower()
        if sentiment not in _VALID_SENTIMENTS:
            sentiment = "neutral"
        try:
            score = max(-1.0, min(1.0, float(llm_result.get("sentiment_score") or 0)))
        except (TypeError, ValueError):
            score = 0.0
        summary = llm_result.get("summary") or ""

    analyzed_at = datetime.now(timezone.utc).isoformat()
    supabase.table("support_tickets").update({
        "sentiment_label": sentiment,
        "sentiment_score": score,
        "sentiment_summary": summary,
        "sentiment_analyzed_at": analyzed_at,
    }).eq("ticket_id", ticket_id).execute()

    return {
        "ticket_id": ticket_id,
        "sentiment_label": sentiment,
        "sentiment_score": score,
        "sentiment_summary": summary,
        "sentiment_analyzed_at": analyzed_at,
    }


def bulk_sentiment_analysis(limit: int = 20) -> dict[str, Any]:
    """Analyze sentiment for the most recent tickets that have not been
    scored yet. Returns per-ticket results plus a breakdown count."""
    supabase = get_supabase()
    tickets = (
        supabase.table("support_tickets")
        .select("ticket_id")
        .is_("sentiment_analyzed_at", "null")
        .order("created_at", desc=True)
        .limit(limit)
        .execute()
        .data
        or []
    )

    results = [analyze_ticket_sentiment(t["ticket_id"]) for t in tickets]
    breakdown = {"positive": 0, "neutral": 0, "negative": 0}
    for r in results:
        label = r.get("sentiment_label")
        if label in breakdown:
            breakdown[label] += 1

    return {"analyzed": len(results), "breakdown": breakdown, "results": results}
