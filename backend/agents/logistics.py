from datetime import date, datetime, timedelta, timezone
from typing import Any

from ..db import get_supabase
from .base import enqueue_review, load_agent_config, log_task, new_correlation_id

AGENT_NAME = "logistics_agent"

_CARRIERS = ["Delhivery", "BlueDart", "DTDC", "FedEx"]


def _pick_carrier(order_number: str) -> str:
    return _CARRIERS[hash(order_number) % len(_CARRIERS)]


def run_logistics_agent() -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 10))
    exception_after_days = float(config.get("exception_after_days", 4))
    correlation_id = new_correlation_id()

    now = datetime.now(timezone.utc)
    auto_executed = 0
    escalated = 0
    outcomes = []

    # 1. Create shipments for confirmed orders that don't have one yet.
    confirmed_orders = (
        supabase.table("orders")
        .select("order_id, order_number")
        .eq("status", "confirmed")
        .limit(max_items)
        .execute()
        .data
        or []
    )
    for order in confirmed_orders:
        existing = (
            supabase.table("shipments")
            .select("shipment_id")
            .eq("order_id", order["order_id"])
            .limit(1)
            .execute()
            .data
        )
        if existing:
            continue
        carrier = _pick_carrier(order["order_number"])
        supabase.table("shipments").insert({
            "order_id": order["order_id"],
            "carrier": carrier,
            "tracking_number": f"{carrier[:2].upper()}{order['order_number'][-8:]}",
            "shipping_cost": 60.0,
            "status": "label_created",
            "estimated_delivery": (date.today() + timedelta(days=3)).isoformat(),
        }).execute()
        supabase.table("orders").update({"status": "shipped", "shipped_at": now.isoformat()}).eq(
            "order_id", order["order_id"]
        ).execute()
        auto_executed += 1
        outcomes.append({"order_id": order["order_id"], "action": "shipment_created", "carrier": carrier})

    # 2. Progress label_created shipments to in_transit.
    label_created = (
        supabase.table("shipments")
        .select("shipment_id, order_id")
        .eq("status", "label_created")
        .limit(max_items)
        .execute()
        .data
        or []
    )
    for shipment in label_created:
        supabase.table("shipments").update({"status": "in_transit"}).eq(
            "shipment_id", shipment["shipment_id"]
        ).execute()
        auto_executed += 1
        outcomes.append({"shipment_id": shipment["shipment_id"], "action": "in_transit"})

    # 3. Complete deliveries whose estimated date has passed.
    out_for_delivery = (
        supabase.table("shipments")
        .select("shipment_id, order_id, estimated_delivery")
        .eq("status", "out_for_delivery")
        .lte("estimated_delivery", date.today().isoformat())
        .limit(max_items)
        .execute()
        .data
        or []
    )
    for shipment in out_for_delivery:
        supabase.table("shipments").update({"status": "delivered", "delivered_at": now.isoformat()}).eq(
            "shipment_id", shipment["shipment_id"]
        ).execute()
        supabase.table("orders").update({"status": "delivered", "delivered_at": now.isoformat()}).eq(
            "order_id", shipment["order_id"]
        ).execute()
        auto_executed += 1
        outcomes.append({"shipment_id": shipment["shipment_id"], "action": "delivered"})

    # 4. Flag stalled in-transit shipments as exceptions.
    cutoff = (now - timedelta(days=exception_after_days)).isoformat()
    stalled = (
        supabase.table("shipments")
        .select("shipment_id, order_id, tracking_number, updated_at")
        .in_("status", ["in_transit", "out_for_delivery"])
        .lt("updated_at", cutoff)
        .limit(max_items)
        .execute()
        .data
        or []
    )
    for shipment in stalled:
        supabase.table("shipments").update({"status": "exception"}).eq(
            "shipment_id", shipment["shipment_id"]
        ).execute()
        escalated += 1
        enqueue_review(
            item_type="shipment_exception",
            reference_id=shipment["shipment_id"],
            agent_name=AGENT_NAME,
            summary=f"Shipment {shipment['tracking_number']} has been in transit with no update since {shipment['updated_at']}.",
            payload={
                "source": AGENT_NAME,
                "item_type": "shipment_exception",
                "shipment_id": shipment["shipment_id"],
                "order_id": shipment["order_id"],
            },
        )
        outcomes.append({"shipment_id": shipment["shipment_id"], "action": "flagged_exception"})

    scanned = len(confirmed_orders) + len(label_created) + len(out_for_delivery) + len(stalled)

    log_id = log_task(
        AGENT_NAME, "shipment_lifecycle", "completed",
        input_data={"scanned": scanned},
        output_data={"outcomes": outcomes, "auto_executed": auto_executed, "escalated": escalated},
        model_used=None,
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": scanned, "auto_executed": auto_executed, "escalated": escalated},
    }
