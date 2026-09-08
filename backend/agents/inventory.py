import os
from datetime import date, datetime, timedelta, timezone
from typing import Any

from ..db import get_supabase
from .base import (
    call_llm_json,
    enqueue_review,
    get_store_config,
    load_active_policies,
    load_agent_config,
    log_task,
    new_correlation_id,
    notify,
)
from .demand import units_sold_by_product, window_bounds
from .ledger import record_action

AGENT_NAME = "inventory_agent"


def _generate_po_number() -> str:
    return f"PO-{datetime.now(timezone.utc).strftime('%Y%m%d%H%M%S%f')}"


def _receive_due_purchase_orders(supabase: Any, receiving_lead_days: float, max_items: int) -> list[dict[str, Any]]:
    """Close the restock loop: approved POs whose lead time has elapsed are
    marked 'received' and their quantity is added to on-hand stock. Without this
    step nothing ever increases quantity_on_hand and every restocked product
    stays permanently below its reorder point.
    """
    cutoff = (datetime.now(timezone.utc) - timedelta(days=receiving_lead_days)).isoformat()
    due = (
        supabase.table("purchase_orders")
        .select("po_id, po_number, product_id, quantity")
        .eq("status", "approved")
        .lt("approved_at", cutoff)
        .limit(max_items)
        .execute()
        .data
        or []
    )
    received: list[dict[str, Any]] = []
    today_iso = date.today().isoformat()
    for po in due:
        # Prefer the atomic RPC (migration 016): one row-locked, status-guarded
        # statement, so a scheduled tick racing a manual run can't double-count.
        # Fall back to the inline read-modify-write if the RPC isn't installed.
        try:
            rpc_res = supabase.rpc("receive_purchase_order", {"p_po_id": po["po_id"]}).execute()
            outcome = rpc_res.data if isinstance(rpc_res.data, str) else (rpc_res.data or [None])[0]
            if outcome == "skipped":
                continue
            if outcome != "received":
                raise RuntimeError("rpc unavailable")
        except Exception:
            inv = (
                supabase.table("inventory")
                .select("inventory_id, quantity_on_hand")
                .eq("product_id", po["product_id"])
                .order("quantity_on_hand", desc=False)
                .limit(1)
                .execute()
                .data
            )
            if not inv:
                continue
            new_on_hand = inv[0]["quantity_on_hand"] + po["quantity"]
            supabase.table("inventory").update(
                {"quantity_on_hand": new_on_hand, "last_restock_date": today_iso}
            ).eq("inventory_id", inv[0]["inventory_id"]).execute()
            supabase.table("purchase_orders").update({"status": "received"}).eq("po_id", po["po_id"]).execute()

        received.append({"po_id": po["po_id"], "po_number": po["po_number"], "quantity": po["quantity"]})
        notify(
            "Stock received",
            f"{po['po_number']}: {po['quantity']} units received into inventory.",
            type="success",
            reference_id=po["po_id"],
            reference_type="purchase_order",
        )
    return received


def run_inventory_agent(correlation_id=None) -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 5))
    receiving_lead_days = float(config.get("receiving_lead_days", 2))
    po_auto_approve_limit = float(get_store_config("po_auto_approve_limit", 5000))
    correlation_id = correlation_id or new_correlation_id()

    # Step 0: receive any approved POs whose lead time has elapsed.
    received = _receive_due_purchase_orders(supabase, receiving_lead_days, max_items)

    inventory_result = (
        supabase.table("inventory")
        .select("inventory_id, product_id, quantity_on_hand, quantity_reserved, reorder_point, reorder_quantity")
        .execute()
    )
    low_stock = [
        row
        for row in (inventory_result.data or [])
        if (row["quantity_on_hand"] - row["quantity_reserved"]) <= row["reorder_point"]
    ]
    low_stock.sort(key=lambda r: r["reorder_point"] - (r["quantity_on_hand"] - r["quantity_reserved"]), reverse=True)

    # Idempotency: skip products that already have an open purchase order, so a
    # re-run (or a scheduled cycle) doesn't stack duplicate POs.
    if low_stock:
        open_po = (
            supabase.table("purchase_orders")
            .select("product_id, status")
            .in_("product_id", [r["product_id"] for r in low_stock])
            .execute()
            .data
            or []
        )
        blocked = {r["product_id"] for r in open_po if r["status"] not in ("received", "cancelled", "rejected")}
        low_stock = [r for r in low_stock if r["product_id"] not in blocked]

    candidates = low_stock[:max_items]

    if not candidates:
        log_id = log_task(
            AGENT_NAME, "stock_check", "completed",
            input_data={"scanned": len(inventory_result.data or [])},
            output_data={"scanned": len(inventory_result.data or []), "auto_approved": 0, "escalated": 0, "received": received},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id),
                "summary": {"scanned": 0, "auto_executed": len(received), "escalated": 0}}

    product_ids = [c["product_id"] for c in candidates]
    products = {
        p["product_id"]: p
        for p in (supabase.table("products").select("product_id, sku, name, cost_price, current_price").in_("product_id", product_ids).execute().data or [])
    }
    suppliers_result = supabase.table("suppliers").select("supplier_id, name, lead_time_days").eq("is_active", True).limit(1).execute()
    supplier = (suppliers_result.data or [{}])[0]

    # Trailing 30-day demand per candidate product, for the ledger baseline.
    _demand_start, _ = window_bounds(30)
    units_30d = units_sold_by_product(supabase, _demand_start, product_ids=product_ids)

    # One batch LLM call for human-readable justifications; fall back to a
    # deterministic string per item if Ollama is unavailable.
    llm_input = [
        {
            "sku": products.get(c["product_id"], {}).get("sku"),
            "name": products.get(c["product_id"], {}).get("name"),
            "on_hand": c["quantity_on_hand"],
            "reorder_point": c["reorder_point"],
            "reorder_quantity": c["reorder_quantity"],
        }
        for c in candidates
    ]
    llm_result = call_llm_json(
        system_prompt=load_active_policies(AGENT_NAME) + (
            "You are an inventory restocking assistant. Given a list of low-stock products, "
            'return JSON {"items": [{"sku": "...", "justification": "one short sentence"}]}.'
        ),
        user_prompt=str(llm_input),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="generate-restock-justifications",
    )
    justifications: dict[str, str] = {}
    if llm_result and isinstance(llm_result.get("items"), list):
        for item in llm_result["items"]:
            if isinstance(item, dict) and item.get("sku"):
                justifications[item["sku"]] = item.get("justification", "")

    auto_approved = 0
    escalated = 0
    po_results = []
    touched_product_ids: list[str] = []

    for candidate in candidates:
        product = products.get(candidate["product_id"])
        if not product or not supplier.get("supplier_id"):
            continue
        touched_product_ids.append(candidate["product_id"])
        quantity = candidate["reorder_quantity"]
        unit_cost = float(product["cost_price"])
        total_cost = quantity * unit_cost
        po_number = _generate_po_number()
        justification = justifications.get(product["sku"], f"Stock at {candidate['quantity_on_hand']} units, below reorder point {candidate['reorder_point']}.")

        under_limit = total_cost <= po_auto_approve_limit
        expected_delivery = (date.today() + timedelta(days=supplier.get("lead_time_days") or 7)).isoformat()
        review_summary = f"Approve {quantity} units restock ({po_number}) — ₹{total_cost:,.2f}. {justification}"
        review_payload = {
            "source": AGENT_NAME,
            "item_type": "purchase_order",
            "submitted_reason": "crosses_auto_approve_threshold",
            "total_cost": total_cost,
            "justification": justification,
        }

        # Atomic: purchase_orders insert + (when escalated) review_queue insert.
        # Falls back to two separate writes if the RPC isn't installed.
        review_created_by_rpc = False
        try:
            rpc_res = supabase.rpc("create_po_with_review", {
                "p_po_number": po_number,
                "p_supplier_id": supplier["supplier_id"],
                "p_product_id": candidate["product_id"],
                "p_quantity": quantity,
                "p_unit_cost": unit_cost,
                "p_expected_delivery": expected_delivery,
                "p_auto_approve": under_limit,
                "p_review_summary": review_summary,
                "p_review_payload": review_payload,
            }).execute()
            po_id = rpc_res.data if isinstance(rpc_res.data, str) else (rpc_res.data or [None])[0]
            review_created_by_rpc = True
        except Exception:
            po_row = {
                "po_number": po_number,
                "supplier_id": supplier["supplier_id"],
                "product_id": candidate["product_id"],
                "quantity": quantity,
                "unit_cost": unit_cost,
                "created_by_agent": AGENT_NAME,
                "expected_delivery": expected_delivery,
            }
            if under_limit:
                po_row["status"] = "approved"
                po_row["approved_at"] = datetime.now(timezone.utc).isoformat()
            po_id = supabase.table("purchase_orders").insert(po_row).execute().data[0]["po_id"]

        po_results.append({"po_id": po_id, "po_number": po_number, "status": "approved" if under_limit else "draft", "total_cost": total_cost})
        notify(
            "Purchase order raised" if under_limit else "Purchase order needs approval",
            f"{po_number}: {quantity} units of {product['name']} — ₹{total_cost:,.2f}.",
            type="agent" if under_limit else "warning",
            reference_id=po_id,
            reference_type="purchase_order",
        )

        if under_limit:
            auto_approved += 1
        else:
            escalated += 1
            if not review_created_by_rpc:
                enqueue_review(
                    item_type="purchase_order",
                    reference_id=po_id,
                    agent_name=AGENT_NAME,
                    summary=review_summary,
                    payload={**review_payload, "reference_id": po_id},
                )

        _avail = candidate["quantity_on_hand"] - candidate["quantity_reserved"]
        _margin_unit = float(product.get("current_price") or 0) - unit_cost
        record_action(
            action_type="purchase_order",
            agent_name=AGENT_NAME,
            entity_type="purchase_order",
            entity_id=po_id,
            decision={
                "product_id": candidate["product_id"], "po_number": po_number,
                "quantity": quantity, "unit_cost": unit_cost, "total_cost": total_cost,
            },
            correlation_id=correlation_id,
            autonomy="auto" if under_limit else "escalated",
            context={
                "daily_velocity": units_30d.get(candidate["product_id"], 0) / 30.0,
                "available": _avail,
                "lead_time_days": supplier.get("lead_time_days") or 7,
                "margin_per_unit": _margin_unit,
            },
        )

    log_id = log_task(
        AGENT_NAME, "stock_reconciliation", "completed",
        input_data={"scanned": len(inventory_result.data or []), "candidates": len(candidates)},
        output_data={"purchase_orders": po_results, "auto_approved": auto_approved, "escalated": escalated, "received": received},
        model_used=None if llm_result is None else os.getenv("OLLAMA_MODEL", "qwen2.5:7b"),
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "touched_product_ids": touched_product_ids,
        "summary": {"scanned": len(candidates), "auto_executed": auto_approved + len(received), "escalated": escalated},
    }
