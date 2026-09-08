"""Shared demand / sales-velocity helpers.

Both the pricing agent (days-of-cover, repricing signal) and the Autopilot
Ledger (counterfactual baselines, realized-outcome verification) need "how many
units of each product sold in a time window". Keep one implementation here.
"""

from datetime import datetime, timedelta, timezone
from typing import Any

_EXCLUDED_ORDER_STATUS = ("cancelled", "returned")


def _iso(dt: datetime) -> str:
    return dt.astimezone(timezone.utc).isoformat()


def window_bounds(days: int, *, end: datetime | None = None) -> tuple[str, str]:
    """(start_iso, end_iso) for a trailing window of `days` ending at `end` (now)."""
    end = end or datetime.now(timezone.utc)
    return _iso(end - timedelta(days=days)), _iso(end)


def units_sold_by_product(
    supabase: Any,
    start_iso: str,
    end_iso: str | None = None,
    *,
    product_ids: list[str] | None = None,
) -> dict[str, int]:
    """Units sold per product_id for orders placed in [start_iso, end_iso),
    excluding cancelled/returned orders. `end_iso` None means "up to now".
    """
    q = supabase.table("orders").select("order_id, status").gte("placed_at", start_iso)
    if end_iso is not None:
        q = q.lt("placed_at", end_iso)
    orders = q.execute().data or []
    order_ids = [o["order_id"] for o in orders if o.get("status") not in _EXCLUDED_ORDER_STATUS]

    sold: dict[str, int] = {}
    for i in range(0, len(order_ids), 200):
        chunk = order_ids[i:i + 200]
        rows = (
            supabase.table("order_items")
            .select("product_id, quantity")
            .in_("order_id", chunk)
            .execute()
            .data
            or []
        )
        for row in rows:
            pid = row["product_id"]
            if product_ids is not None and pid not in product_ids:
                continue
            sold[pid] = sold.get(pid, 0) + int(row.get("quantity") or 0)
    return sold


def daily_velocity(units: int, window_days: int) -> float:
    return units / window_days if window_days > 0 else 0.0
