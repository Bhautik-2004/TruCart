""""Explain this decision" — takes a review_queue item or a ledger
agent_action row (which already carry the decision, its counterfactual
baseline, and its outcome once graded — see agents/ledger.py) and has the LLM
write a short, plain-English explanation for a human reviewer: why the agent
did this, what "do nothing" would have cost, and how risky the call is.
Explanation-only: the LLM never changes the decision, and any failure falls
back to more of the same in the client, not disabled.
"""

from typing import Any

from ..db import get_supabase
from .base import call_llm_json, new_correlation_id

AGENT_NAME = "explain_agent"

_SYSTEM_PROMPT = (
    "You are explaining one automated e-commerce decision to a non-technical store "
    "operator who needs to approve or reject it. Given the decision's parameters, its "
    "counterfactual baseline (what doing nothing would have cost), and any measured "
    "outcome, write a short explanation: (1) what the agent decided and why, in plain "
    "language, (2) what would likely happen if a human did nothing instead, and (3) how "
    "risky or reversible this decision is. 3-5 sentences, no headers, no jargon. "
    'Return JSON: {"explanation": "..."}.'
)


def _fallback(reason: str) -> dict[str, Any]:
    return {"explanation": f"Explanation unavailable ({reason}). Review the raw details below instead."}


def explain_review_item(review_id: str) -> dict[str, Any]:
    supabase = get_supabase()
    rows = (
        supabase.table("review_queue")
        .select("review_id, item_type, agent_name, summary, payload, status")
        .eq("review_id", review_id)
        .limit(1)
        .execute()
        .data
        or []
    )
    if not rows:
        return _fallback("review item not found")

    row = rows[0]
    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=_SYSTEM_PROMPT,
        user_prompt=str({
            "agent": row["agent_name"],
            "item_type": row["item_type"],
            "summary": row["summary"],
            "decision_payload": row.get("payload"),
        }),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="explain-review-item",
        trace_metadata={"review_id": review_id},
    )
    if llm_result is None or not llm_result.get("explanation"):
        return _fallback("LLM unavailable")
    return {"explanation": llm_result["explanation"]}


def explain_ledger_action(action_id: str) -> dict[str, Any]:
    supabase = get_supabase()
    rows = (
        supabase.table("agent_action")
        .select(
            "action_id, agent_name, action_type, decision, baseline, autonomy, "
            "status, outcome, realized_delta_inr, baseline_delta_inr, grade"
        )
        .eq("action_id", action_id)
        .limit(1)
        .execute()
        .data
        or []
    )
    if not rows:
        return _fallback("ledger action not found")

    row = rows[0]
    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=_SYSTEM_PROMPT,
        user_prompt=str({
            "agent": row["agent_name"],
            "action_type": row["action_type"],
            "decision": row.get("decision"),
            "baseline": row.get("baseline"),
            "autonomy": row["autonomy"],
            "status": row["status"],
            "grade": row.get("grade"),
            "realized_delta_inr": row.get("realized_delta_inr"),
            "baseline_delta_inr": row.get("baseline_delta_inr"),
        }),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="explain-ledger-action",
        trace_metadata={"action_id": action_id},
    )
    if llm_result is None or not llm_result.get("explanation"):
        return _fallback("LLM unavailable")
    return {"explanation": llm_result["explanation"]}
