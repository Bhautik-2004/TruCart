"""Copilot tool-call dispatch (backend/agents/chat.py). The LLM itself is
mocked throughout — these tests check the *routing* logic: read tools
execute and get summarized, write tools always come back as
pending_confirmation instead of running.
"""

from backend.agents import chat


class _FakeSupabase:
    """Enough of the Supabase client surface for _live_snapshot()/low_stock()."""

    def table(self, _name):
        return self

    def select(self, *_args, **_kwargs):
        return self

    def eq(self, *_args, **_kwargs):
        return self

    def execute(self):
        return self

    @property
    def count(self):
        return 0

    @property
    def data(self):
        return []


def _patch_common(monkeypatch):
    monkeypatch.setattr(chat, "get_supabase", lambda: _FakeSupabase())
    monkeypatch.setattr(chat, "retrieve", lambda *_a, **_k: [])
    monkeypatch.setattr(chat, "format_context", lambda *_a, **_k: "")


def test_plain_reply_passes_through(monkeypatch):
    _patch_common(monkeypatch)
    monkeypatch.setattr(chat, "call_llm_json", lambda **_kwargs: {"type": "reply", "reply": "42 open tickets."})

    result = chat.run_chat("how many open tickets?", history=[])
    assert result == {"type": "reply", "reply": "42 open tickets."}


def test_read_tool_executes_and_summarizes(monkeypatch):
    _patch_common(monkeypatch)
    monkeypatch.setattr(chat, "low_stock", lambda: {"low_stock_count": 3, "items": []})

    calls = iter([
        {"type": "tool_call", "tool": "low_stock", "args": {}, "reason": "checking stock"},
        {"reply": "3 SKUs are below their reorder point."},
    ])
    monkeypatch.setattr(chat, "call_llm_json", lambda **_kwargs: next(calls))

    result = chat.run_chat("what's low on stock?", history=[])
    assert result["type"] == "reply"
    assert result["tool_used"] == "low_stock"
    assert "3 SKUs" in result["reply"]


def test_list_orders_tool_executes_and_summarizes(monkeypatch):
    _patch_common(monkeypatch)
    monkeypatch.setattr(chat, "list_orders", lambda limit=10, status=None: {"count": 2, "orders": []})

    calls = iter([
        {"type": "tool_call", "tool": "list_orders", "args": {"limit": 10}, "reason": "listing recent orders"},
        {"reply": "Here are the 2 most recent orders."},
    ])
    monkeypatch.setattr(chat, "call_llm_json", lambda **_kwargs: next(calls))

    result = chat.run_chat("show me the first 10 orders", history=[])
    assert result["type"] == "reply"
    assert result["tool_used"] == "list_orders"
    assert "2 most recent orders" in result["reply"]


def test_write_tool_requires_confirmation_and_does_not_execute(monkeypatch):
    _patch_common(monkeypatch)
    executed = {"called": False}
    monkeypatch.setattr(chat, "run_agent", lambda agent_name: executed.update(called=True))
    monkeypatch.setattr(
        chat, "call_llm_json",
        lambda **_kwargs: {"type": "tool_call", "tool": "run_agent", "args": {"agent_name": "pricing_agent"}, "reason": "operator asked to run pricing"},
    )

    result = chat.run_chat("run the pricing agent", history=[])
    assert result["type"] == "pending_confirmation"
    assert result["tool"] == "run_agent"
    assert result["args"] == {"agent_name": "pricing_agent"}
    assert executed["called"] is False


def test_execute_tool_runs_a_confirmed_write_tool(monkeypatch):
    monkeypatch.setattr(chat, "run_agent", lambda agent_name: {"status": "completed", "agent_name": agent_name})

    result = chat.execute_tool("run_agent", {"agent_name": "pricing_agent"})
    assert result == {"status": "completed", "agent_name": "pricing_agent"}


def test_execute_tool_rejects_unknown_tool():
    result = chat.execute_tool("delete_everything", {})
    assert "error" in result
