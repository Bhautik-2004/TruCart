from collections import defaultdict
from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import (
    enqueue_review,
    load_agent_config,
    log_task,
    new_correlation_id,
    notify,
)

AGENT_NAME = "order_agent"


def run_order_agent(correlation_id=None) -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 8))
    correlation_id = correlation_id or new_correlation_id()

    orders_result = (
        supabase.table("orders")
        .select("order_id, order_number, customer_id, payment_status")
        .eq("status", "pending")
        .order("placed_at")
        .limit(max_items)
        .execute()
    )
    orders = orders_result.data or []

    # Skip orders already awaiting a human decision from an earlier run —
    # otherwise every run files a fresh duplicate review_queue row for the same
    # still-pending order.
    pending_reviews = (
        supabase.table("review_queue")
        .select("reference_id, payload")
        .eq("status", "pending")
        .eq("agent_name", AGENT_NAME)
        .execute()
        .data
        or []
    )
    already_queued: set[str] = set()
    for r in pending_reviews:
        if r.get("reference_id"):
            already_queued.add(str(r["reference_id"]))
        payload = r.get("payload") or {}
        if isinstance(payload, dict) and payload.get("order_id"):
            already_queued.add(str(payload["order_id"]))
    skipped = [o["order_id"] for o in orders if str(o["order_id"]) in already_queued]
    orders = [o for o in orders if str(o["order_id"]) not in already_queued]

    if not orders:
        log_id = log_task(
            AGENT_NAME, "order_processing", "completed",
            input_data={"scanned": 0, "skipped_already_queued": len(skipped)},
            output_data={"scanned": 0, "auto_executed": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    order_ids = [o["order_id"] for o in orders]
    items_result = (
        supabase.table("order_items")
        .select("order_item_id, order_id, product_id, quantity")
        .in_("order_id", order_ids)
        .execute()
    )
    items_by_order: dict[str, list[dict]] = defaultdict(list)
    for item in items_result.data or []:
        items_by_order[item["order_id"]].append(item)

    product_ids = list({item["product_id"] for item in items_result.data or []})
    inventory_result = (
        supabase.table("inventory")
        .select("inventory_id, product_id, quantity_on_hand, quantity_reserved")
        .in_("product_id", product_ids)
        .execute()
    )
    inventory_by_product: dict[str, list[dict]] = defaultdict(list)
    for row in inventory_result.data or []:
        inventory_by_product[row["product_id"]].append(row)

    auto_executed = 0
    escalated = 0
    outcomes = []

    for order in orders:
        order_items = items_by_order.get(order["order_id"], [])
        if order["payment_status"] != "paid" or not order_items:
            reason = "payment not confirmed" if order["payment_status"] != "paid" else "no line items found"
            escalated += 1
            enqueue_review(
                item_type="order",
                reference_id=order["order_id"],
                agent_name=AGENT_NAME,
                summary=f"Order {order['order_number']} needs review: {reason}.",
                payload={"source": AGENT_NAME, "item_type": "order", "order_id": order["order_id"], "reason": reason},
            )
            outcomes.append({"order_id": order["order_id"], "action": "escalated", "reason": reason})
            continue

        shortages = []
        for item in order_items:
            rows = inventory_by_product.get(item["product_id"], [])
            available = sum((r["quantity_on_hand"] - r["quantity_reserved"]) for r in rows)
            if available < item["quantity"]:
                shortages.append(item["product_id"])

        if shortages:
            escalated += 1
            enqueue_review(
                item_type="order",
                reference_id=order["order_id"],
                agent_name=AGENT_NAME,
                summary=f"Order {order['order_number']} cannot be confirmed — insufficient stock for {len(shortages)} item(s).",
                payload={"source": AGENT_NAME, "item_type": "order", "order_id": order["order_id"], "shortage_product_ids": shortages},
            )
            outcomes.append({"order_id": order["order_id"], "action": "escalated", "reason": "insufficient_stock"})
            continue

        # Atomic reserve-all-then-confirm. If the RPC is installed, a shortage
        # (race with another run) rolls back every reservation and raises; we
        # then escalate the order instead of leaving it half-reserved.
        used_rpc = False
        try:
            supabase.rpc("confirm_order_and_reserve", {"p_order_id": order["order_id"]}).execute()
            used_rpc = True
        except Exception as exc:
            msg = str(exc)
            if "insufficient stock" in msg or "insufficient_stock" in msg:
                escalated += 1
                enqueue_review(
                    item_type="order",
                    reference_id=order["order_id"],
                    agent_name=AGENT_NAME,
                    summary=f"Order {order['order_number']} could not be confirmed — stock ran out during processing.",
                    payload={"source": AGENT_NAME, "item_type": "order", "order_id": order["order_id"], "reason": "insufficient_stock_race"},
                )
                outcomes.append({"order_id": order["order_id"], "action": "escalated", "reason": "insufficient_stock_race"})
                continue
            # RPC not installed / other error -> fall back to row-by-row writes.

        if not used_rpc:
            for item in order_items:
                remaining = item["quantity"]
                for row in inventory_by_product.get(item["product_id"], []):
                    if remaining <= 0:
                        break
                    available = row["quantity_on_hand"] - row["quantity_reserved"]
                    take = min(available, remaining)
                    if take <= 0:
                        continue
                    supabase.table("inventory").update(
                        {"quantity_reserved": row["quantity_reserved"] + take}
                    ).eq("inventory_id", row["inventory_id"]).execute()
                    row["quantity_reserved"] += take
                    remaining -= take

            supabase.table("orders").update(
                {"status": "confirmed", "confirmed_at": datetime.now(timezone.utc).isoformat()}
            ).eq("order_id", order["order_id"]).execute()
            supabase.table("order_items").update({"status": "fulfilled"}).eq(
                "order_id", order["order_id"]
            ).execute()

        auto_executed += 1
        outcomes.append({"order_id": order["order_id"], "action": "confirmed"})
        notify(
            "Order confirmed",
            f"Order {order['order_number']} confirmed and stock reserved.",
            type="order",
            reference_id=order["order_id"],
            reference_type="order",
        )

    log_id = log_task(
        AGENT_NAME, "order_processing", "completed",
        input_data={"scanned": len(orders), "skipped_already_queued": len(skipped)},
        output_data={"outcomes": outcomes, "auto_executed": auto_executed, "escalated": escalated},
        model_used=None,
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": len(orders), "auto_executed": auto_executed, "escalated": escalated},
    }
