"""Deterministic order risk scoring (backend/agents/risk.py)."""

from backend.agents.risk import assess_order_risk


class _FakeQuery:
    def __init__(self, count: int):
        self._count = count

    def select(self, *_args, **_kwargs):
        return self

    def eq(self, *_args, **_kwargs):
        return self

    def gte(self, *_args, **_kwargs):
        return self

    def execute(self):
        return self

    @property
    def count(self):
        return self._count


class _FakeSupabase:
    def __init__(self, recent_order_count: int = 0):
        self._recent_order_count = recent_order_count

    def table(self, _name):
        return _FakeQuery(self._recent_order_count)


def test_low_risk_established_customer_normal_order():
    order = {"customer_id": "c1", "total_amount": 1200.0, "payment_method": "card"}
    customer = {"total_orders": 12, "lifetime_value": 18000.0}
    result = assess_order_risk(order, customer, supabase=_FakeSupabase())
    assert result["level"] == "low"
    assert result["score"] < 0.25
    assert result["reasons"] == []


def test_new_customer_high_value_order_flagged():
    order = {"customer_id": "c2", "total_amount": 20000.0, "payment_method": "card"}
    customer = {"total_orders": 0, "lifetime_value": 0.0}
    result = assess_order_risk(order, customer, supabase=_FakeSupabase())
    assert result["level"] in ("medium", "high")
    assert any("New customer" in r for r in result["reasons"])


def test_order_velocity_adds_risk():
    order = {"customer_id": "c3", "total_amount": 500.0, "payment_method": "card"}
    customer = {"total_orders": 5, "lifetime_value": 2500.0}
    result = assess_order_risk(order, customer, supabase=_FakeSupabase(recent_order_count=4))
    assert result["score"] >= 0.25
    assert any("orders from this customer" in r for r in result["reasons"])


def test_cod_high_value_adds_risk():
    order = {"customer_id": "c4", "total_amount": 6000.0, "payment_method": "cod"}
    customer = {"total_orders": 3, "lifetime_value": 9000.0}
    result = assess_order_risk(order, customer, supabase=_FakeSupabase())
    assert any("Cash-on-delivery" in r for r in result["reasons"])


def test_score_is_clamped_to_one():
    order = {"customer_id": "c5", "total_amount": 50000.0, "payment_method": "cod"}
    customer = {"total_orders": 0, "lifetime_value": 0.0}
    result = assess_order_risk(order, customer, supabase=_FakeSupabase(recent_order_count=5))
    assert result["score"] <= 1.0
    assert result["level"] == "high"
