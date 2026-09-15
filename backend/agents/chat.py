"""Store-ops copilot — a conversational front end that can both answer
questions (grounded in the RAG knowledge base, see rag.py) and *act* by
calling a small fixed set of tools: looking up an order/SKU/tracking number,
reading the Autopilot Ledger summary, checking low stock, running one of the
existing autonomous agents, or generating an AI report.

Read tools execute immediately and their result is fed back to the model for
one more turn so it can answer in plain language. Write tools (running an
agent, which can move money/stock) are never executed by the model directly:
the model can only *propose* one, the API returns it as
pending_confirmation, and the frontend must call /chat/execute after the
operator clicks Confirm. This mirrors how every other agent in this codebase
treats risk (see enqueue_review in base.py) — autonomy for reads, a human
in the loop before an irreversible write triggered from chat.
"""

from typing import Any

from ..db import get_supabase
from .base import call_llm_json, new_correlation_id
from .rag import format_context, retrieve
from .reports import generate_report as _generate_report

AGENT_NAME = "chat_agent"
_MAX_HISTORY_TURNS = 8

READ_TOOLS = {"lookup_code", "ledger_summary", "low_stock", "list_orders"}
WRITE_TOOLS = {"run_agent", "generate_report"}
_KNOWN_AGENTS = [
    "inventory_agent", "pricing_agent", "support_agent",
    "order_agent", "marketing_agent", "logistics_agent", "orchestrator",
]

_TOOLS_DESCRIPTION = """You may either reply directly, or call one tool to help answer. Available tools:
- lookup_code(code): look up an order number, shipment tracking number, or product SKU.
- ledger_summary(): read the Autopilot Ledger's win-rate / financial-impact summary for every agent.
- low_stock(): list products at or below their reorder point.
- list_orders(limit, status): list the most recent orders (optionally filtered by status), newest first.
- run_agent(agent_name): run one autonomous agent now (agent_name is one of {agents}). This can change prices, stock, or orders — it always requires the operator's confirmation.
- generate_report(period, focus): have the AI write a store-ops report for "today"|"week"|"month", optionally focused on an area. This is a report only and does not change any data, but still requires confirmation like other actions.

Respond with exactly one JSON object, one of:
{{"type": "reply", "reply": "..."}}
{{"type": "tool_call", "tool": "<tool name>", "args": {{...}}, "reason": "one short sentence on why, shown to the operator"}}
""".format(agents=", ".join(_KNOWN_AGENTS))


def _live_snapshot() -> dict[str, Any]:
    supabase = get_supabase()
    try:
        open_tickets = (
            supabase.table("support_tickets").select("ticket_id", count="exact").eq("status", "open").execute().count
            or 0
        )
        pending_reviews = (
            supabase.table("review_queue").select("review_id", count="exact").eq("status", "pending").execute().count
            or 0
        )
        inventory = supabase.table("inventory").select("quantity_available, reorder_point").execute().data or []
        low_stock = sum(1 for i in inventory if (i["quantity_available"] or 0) <= (i["reorder_point"] or 0))
        return {"open_tickets": open_tickets, "pending_human_reviews": pending_reviews, "low_stock_skus": low_stock}
    except Exception:
        return {}


def lookup_code(code: str) -> dict[str, Any]:
    """Resolve a code against orders (order_number), shipments
    (tracking_number), or products (sku) — mirrors the web app's
    /api/lookup route so the copilot can answer the same questions."""
    supabase = get_supabase()
    code = (code or "").strip()
    if not code:
        return {"type": "not_found"}

    order = (
        supabase.table("orders")
        .select("order_id, order_number, status, payment_status, total_amount, placed_at")
        .ilike("order_number", code)
        .limit(1)
        .execute()
        .data
    )
    if order:
        return {"type": "order", "order": order[0]}

    shipment = (
        supabase.table("shipments")
        .select("carrier, tracking_number, status, shipped_at, delivered_at, estimated_delivery, orders(order_number)")
        .ilike("tracking_number", code)
        .limit(1)
        .execute()
        .data
    )
    if shipment:
        return {"type": "shipment", "shipment": shipment[0]}

    product = (
        supabase.table("products")
        .select("product_id, sku, name, category, current_price, status")
        .ilike("sku", code)
        .limit(1)
        .execute()
        .data
    )
    if product:
        return {"type": "product", "product": product[0]}

    return {"type": "not_found"}


def ledger_summary() -> dict[str, Any]:
    from ..routers.ledger import ledger_summary as _ledger_summary

    return _ledger_summary()


def low_stock() -> dict[str, Any]:
    supabase = get_supabase()
    rows = (
        supabase.table("inventory")
        .select("quantity_available, reorder_point, products(sku, name)")
        .execute()
        .data
        or []
    )
    low = [r for r in rows if (r["quantity_available"] or 0) <= (r["reorder_point"] or 0)]
    return {"low_stock_count": len(low), "items": low[:20]}


def list_orders(limit: int = 10, status: str | None = None) -> dict[str, Any]:
    """List the most recent orders, newest first, optionally filtered by status."""
    supabase = get_supabase()
    query = (
        supabase.table("orders")
        .select("order_id, order_number, status, payment_status, total_amount, placed_at, customers(full_name)")
        .order("placed_at", desc=True)
        .limit(min(limit or 10, 50))
    )
    if status:
        query = query.eq("status", status)
    rows = query.execute().data or []
    return {"count": len(rows), "orders": rows}


def run_agent(agent_name: str) -> dict[str, Any]:
    from ..routers.agents import _RUNNERS

    runner = _RUNNERS.get(agent_name)
    if runner is None:
        return {"error": f"Unknown agent: {agent_name}"}
    return runner()


def generate_report(period: str = "week", focus: str | None = None) -> dict[str, Any]:
    return _generate_report(period=period, focus=focus)


_TOOL_NAMES = {"lookup_code", "ledger_summary", "low_stock", "list_orders", "run_agent", "generate_report"}


def execute_tool(tool: str, args: dict[str, Any] | None = None) -> dict[str, Any]:
    """Actually run a tool. Called directly by the /chat/execute endpoint
    after the operator confirms a write tool the model proposed — never
    called automatically for a tool in WRITE_TOOLS. Looked up by name from
    this module's globals (not a dict captured at import time) so tests can
    monkeypatch e.g. chat.run_agent and have execute_tool see the patch."""
    func = globals().get(tool) if tool in _TOOL_NAMES else None
    if func is None:
        return {"error": f"Unknown tool: {tool}"}
    try:
        return func(**(args or {}))
    except TypeError as exc:
        return {"error": f"Bad arguments for {tool}: {exc}"}
    except Exception as exc:
        return {"error": str(exc)}


def run_chat(message: str, history: list[dict[str, str]] | None = None) -> dict[str, Any]:
    """Answer one chat message, optionally calling a read tool along the way.
    `history` is a list of {"role": "user"|"agent", "content": str} turns,
    most recent last."""
    message = (message or "").strip()
    if not message:
        return {"type": "reply", "reply": "Ask me about orders, inventory, tickets, store policy, or say \"run the pricing agent\"."}

    kb_chunks = retrieve(message, k=4)
    kb_context = format_context(kb_chunks)

    transcript = ""
    for turn in (history or [])[-_MAX_HISTORY_TURNS:]:
        speaker = "Operator" if turn.get("role") == "user" else "Assistant"
        transcript += f"{speaker}: {turn.get('content', '')}\n"

    system_prompt = (
        "You are TruCart's store operations copilot, embedded in the admin dashboard. "
        "Use the live metrics and knowledge base context given to you where relevant, and "
        "say when you don't have enough information rather than guessing.\n\n" + _TOOLS_DESCRIPTION
    )
    if kb_context:
        system_prompt += f"\nRelevant store policy / FAQ:\n{kb_context}"

    user_prompt = (
        f"Live store snapshot: {_live_snapshot()}\n\n"
        f"Conversation so far:\n{transcript}\n"
        f"Operator: {message}"
    )

    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=system_prompt,
        user_prompt=user_prompt,
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="chat-decide",
    )

    if llm_result is None:
        return {"type": "reply", "reply": "I couldn't reach the AI model just now. Please try again in a moment."}

    if llm_result.get("type") == "tool_call" and llm_result.get("tool") in READ_TOOLS | WRITE_TOOLS:
        tool = llm_result["tool"]
        args = llm_result.get("args") or {}
        reason = llm_result.get("reason") or f"Calling {tool}."

        if tool in WRITE_TOOLS:
            return {"type": "pending_confirmation", "tool": tool, "args": args, "reason": reason}

        tool_result = execute_tool(tool, args)
        followup = call_llm_json(
            system_prompt=(
                "You just called a tool for the operator and got a result. Write a short, direct "
                'answer using it. Return JSON: {"reply": "..."}.'
            ),
            user_prompt=str({"question": message, "tool": tool, "tool_result": tool_result}),
            agent_name=AGENT_NAME,
            correlation_id=correlation_id,
            call_name="chat-summarize-tool-result",
        )
        reply = (followup or {}).get("reply") or f"Result: {tool_result}"
        return {"type": "reply", "reply": reply, "tool_used": tool}

    reply = llm_result.get("reply") or "I'm not sure how to answer that."
    return {"type": "reply", "reply": reply}
