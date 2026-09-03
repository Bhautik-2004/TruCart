"""Smoke tests: every agent runner imports, is registered, and returns the
expected result shape when the database has nothing to act on.

Run: python -m pytest backend/tests
"""
import pytest


class FakeResult:
    def __init__(self, data=None, count=0):
        self.data = data
        self.count = count


_ZERO_UUID = "00000000-0000-0000-0000-000000000000"


class FakeQuery:
    """Chainable no-op query. Every builder method returns self. A SELECT
    execute() yields empty data; an INSERT execute() yields one id-bearing row."""

    def __init__(self, table):
        self._table = table
        self._is_insert = False

    def __getattr__(self, name):
        if name == "insert":
            self._is_insert = True
        return lambda *a, **k: self

    def execute(self):
        if self._is_insert:
            return FakeResult(data=[{
                "log_id": _ZERO_UUID, "review_id": _ZERO_UUID, "po_id": _ZERO_UUID,
                "history_id": _ZERO_UUID, "campaign_id": _ZERO_UUID, "shipment_id": _ZERO_UUID,
                "message_id": _ZERO_UUID,
            }])
        return FakeResult(data=[])


class FakeSupabase:
    def table(self, name):
        return FakeQuery(name)

    def rpc(self, *a, **k):
        return FakeQuery("__rpc__")


AGENT_MODULES = [
    "backend.db",
    "backend.agents.base",
    "backend.agents.inventory",
    "backend.agents.pricing",
    "backend.agents.orders",
    "backend.agents.marketing",
    "backend.agents.logistics",
    "backend.agents.support",
    "backend.agents.orchestrator",
]


@pytest.fixture
def fake_db(monkeypatch):
    import importlib

    fake = FakeSupabase()
    for name in AGENT_MODULES:
        mod = importlib.import_module(name)
        if hasattr(mod, "get_supabase"):
            monkeypatch.setattr(mod, "get_supabase", lambda: fake, raising=False)
    # RAG retrieval should be inert in tests.
    import backend.agents.support as support_mod
    monkeypatch.setattr(support_mod, "retrieve", lambda *a, **k: [])
    return fake


def test_all_runners_registered():
    from backend.routers.agents import _RUNNERS

    assert set(_RUNNERS) == {
        "inventory_agent", "pricing_agent", "support_agent",
        "order_agent", "marketing_agent", "logistics_agent", "orchestrator",
    }


def test_orchestrator_pipeline_matches_registry():
    from backend.agents.orchestrator import _PIPELINE
    from backend.routers.agents import _RUNNERS

    for name, _ in _PIPELINE:
        assert name in _RUNNERS


@pytest.mark.parametrize("name", [
    "inventory_agent", "pricing_agent", "support_agent",
    "order_agent", "marketing_agent", "logistics_agent",
])
def test_agent_returns_expected_shape(fake_db, name):
    from backend.routers.agents import _RUNNERS

    result = _RUNNERS[name]()
    assert result["agent_name"] == name
    assert result["status"] in {"completed", "partial", "error"}
    assert set(result["summary"]) == {"scanned", "auto_executed", "escalated"}


def test_orchestrator_runs_full_pipeline(fake_db):
    from backend.agents.orchestrator import run_orchestrator

    result = run_orchestrator()
    assert result["agent_name"] == "orchestrator"
    assert len(result["agents"]) == 6
    assert set(result["summary"]) == {"scanned", "auto_executed", "escalated"}


def test_app_registers_expected_routes():
    from backend.main import app

    paths = {getattr(r, "path", None) for r in app.routes}
    assert "/api/agents/{agent_name}/run" in paths
    assert "/api/agents/scheduler" in paths
    assert "/api/simulate/orders" in paths
    assert "/api/auth/change-password" in paths


def test_notify_is_best_effort(monkeypatch):
    """notify() must never raise even when the DB call fails."""
    import backend.agents.base as base

    class Boom:
        def table(self, *a, **k):
            raise RuntimeError("db down")

    monkeypatch.setattr(base, "get_supabase", lambda: Boom())
    base.notify("t", "m", type="info")  # should not raise
