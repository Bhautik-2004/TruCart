"""Autopilot Ledger: baseline math, grading, and the autonomy proposal loop."""

import pytest

from backend.agents import ledger, verification


# --- pure baseline math --------------------------------------------------

def test_price_change_baseline_uses_old_margin(monkeypatch):
    monkeypatch.setattr(ledger, "get_store_config", lambda k, d=None: {"ledger_settle_days_price": 10}.get(k, d))
    baseline, measurability, projected = ledger._baseline_price_change(
        {"old_price": 100.0, "new_price": 90.0, "effective_cost": 60.0},
        {"daily_velocity": 2.0},
    )
    # do nothing: 2/day * 10 days * (100 - 60) = 800
    assert baseline["baseline_delta_inr"] == 800.0
    # projected at the new price: 2 * 10 * (90 - 60) = 600
    assert projected == 600.0
    assert measurability == "measured"


def test_purchase_order_baseline_is_negative_lost_margin(monkeypatch):
    monkeypatch.setattr(ledger, "get_store_config", lambda k, d=None: {"ledger_settle_days_po": 7}.get(k, d))
    baseline, measurability, projected = ledger._baseline_purchase_order(
        {"total_cost": 1000.0},
        {"daily_velocity": 5.0, "available": 10.0, "lead_time_days": 6, "margin_per_unit": 20.0},
    )
    # lost units over lead time: 5*6 - 10 = 20 ; lost margin = 20 * 20 = 400
    assert baseline["baseline_delta_inr"] == -400.0
    assert projected < 400.0  # projected rescue is net of holding cost
    assert measurability == "measured"


def test_campaign_baseline_is_zero_and_estimated():
    baseline, measurability, _ = ledger._baseline_campaign({"budget": 200.0}, {})
    assert baseline["baseline_delta_inr"] == 0.0
    assert measurability == "estimated"


@pytest.mark.parametrize("realized,baseline,expected", [
    (100.0, 10.0, "win"),
    (10.0, 100.0, "loss"),
    (50.0, 50.0, "neutral"),
    (50.5, 50.0, "neutral"),  # within epsilon
])
def test_grade_thresholds(realized, baseline, expected):
    assert verification._grade(realized, baseline) == expected


# --- autonomy evaluation ----------------------------------------------

class _FakeQ:
    def __init__(self, rows):
        self._rows = rows
        self._inserted = None

    def select(self, *a, **k): return self
    def eq(self, *a, **k): return self
    def in_(self, *a, **k): return self
    def order(self, *a, **k): return self
    def limit(self, *a, **k): return self

    def insert(self, row):
        self._inserted = row
        return self

    def execute(self):
        return type("R", (), {"data": self._rows})()


class _FakeSupabase:
    def __init__(self, recent_rows, open_proposals):
        self.recent_rows = recent_rows
        self.open_proposals = open_proposals
        self.review_inserts = []

    def table(self, name):
        if name == "agent_action":
            return _FakeQ(self.recent_rows)
        if name == "review_queue":
            q = _FakeQ(self.open_proposals)
            parent = self

            class _RQ(_FakeQ):
                def insert(self, row):
                    parent.review_inserts.append(row)
                    return self

            rq = _RQ(self.open_proposals)
            return rq
        return _FakeQ([])


@pytest.fixture(autouse=True)
def _config(monkeypatch):
    cfg = {"ledger_min_sample": 4, "ledger_win_rate_floor": 0.5, "ledger_win_rate_ceiling": 0.8,
           "price_change_max_pct": 15}
    monkeypatch.setattr(verification, "get_store_config", lambda k, d=None: cfg.get(k, d))
    monkeypatch.setattr(verification, "load_agent_config", lambda a: {})


def test_low_win_rate_enqueues_a_tightening(monkeypatch):
    rows = [{"action_id": f"a{i}", "grade": "loss"} for i in range(3)] + [{"action_id": "a3", "grade": "win"}]
    fake = _FakeSupabase(rows, open_proposals=[])
    captured = {}
    monkeypatch.setattr(verification, "enqueue_review", lambda **kw: captured.update(kw))

    created = verification.evaluate_autonomy(fake, "pricing_agent")

    assert created is True
    assert captured["item_type"] == "autonomy_adjustment"
    assert captured["payload"]["direction"] == "tighten"
    assert captured["payload"]["to"] < captured["payload"]["from"]


def test_open_proposal_makes_it_idempotent(monkeypatch):
    rows = [{"action_id": f"a{i}", "grade": "loss"} for i in range(4)]
    fake = _FakeSupabase(rows, open_proposals=[{"payload": {"agent_name": "pricing_agent"}, "status": "pending"}])
    monkeypatch.setattr(verification, "enqueue_review", lambda **kw: (_ for _ in ()).throw(AssertionError("should not enqueue")))

    assert verification.evaluate_autonomy(fake, "pricing_agent") is False


def test_healthy_win_rate_does_nothing(monkeypatch):
    rows = [{"action_id": f"a{i}", "grade": "win"} for i in range(3)] + [{"action_id": "a3", "grade": "loss"}]
    fake = _FakeSupabase(rows, open_proposals=[])
    monkeypatch.setattr(verification, "enqueue_review", lambda **kw: (_ for _ in ()).throw(AssertionError("should not enqueue")))

    # 75% win-rate: between floor (0.5) and ceiling (0.8) -> no change
    assert verification.evaluate_autonomy(fake, "pricing_agent") is False
