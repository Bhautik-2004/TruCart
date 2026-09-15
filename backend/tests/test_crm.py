"""Deterministic RFM segmentation (backend/agents/crm.py)."""

from backend.agents.crm import _segment


def test_never_ordered_is_prospect():
    assert _segment(None, 0, 0.0) == "prospect"


def test_recent_first_order_is_new():
    assert _segment(10, 1, 1200.0) == "new"


def test_long_gap_with_history_is_at_risk():
    assert _segment(120, 3, 15000.0) == "at_risk"


def test_long_gap_with_no_value_is_lost():
    assert _segment(200, 1, 0.0) == "lost"


def test_frequent_high_value_recent_is_champion():
    assert _segment(15, 5, 50000.0) == "champion"


def test_moderate_repeat_customer_is_loyal():
    assert _segment(20, 2, 5000.0) == "loyal"
