import os
from datetime import date, datetime, timedelta
from typing import Any

from ..db import get_supabase
from .base import (
    call_llm_json,
    enqueue_review,
    get_store_config,
    load_agent_config,
    log_task,
    new_correlation_id,
)

AGENT_NAME = "inventory_agent"


def _generate_po_number() -> str:
    return f"PO-{datetime.utcnow().strftime('%Y%m%d%H%M%S%f')}"


def run_inventory_agent() -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 5))
    po_auto_approve_limit = float(get_store_config("po_auto_approve_limit", 5000))
    correlation_id = new_correlation_id()

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
    candidates = low_stock[:max_items]

    if not candidates:
        log_id = log_task(
            AGENT_NAME, "stock_check", "completed",
            input_data={"scanned": len(inventory_result.data or [])},
            output_data={"scanned": len(inventory_result.data or []), "auto_approved": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    product_ids = [c["product_id"] for c in candidates]
    products = {
        p["product_id"]: p
        for p in (supabase.table("products").select("product_id, sku, name, cost_price").in_("product_id", product_ids).execute().data or [])
    }
    suppliers_result = supabase.table("suppliers").select("supplier_id, name, lead_time_days").eq("is_active", True).limit(1).execute()
    supplier = (suppliers_result.data or [{}])[0]

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
        system_prompt=(
            "You are an inventory restocking assistant. Given a list of low-stock products, "
            'return JSON {"items": [{"sku": "...", "justification": "one short sentence"}]}.'
        ),
        user_prompt=str(llm_input),
    )
    justifications: dict[str, str] = {}
    if llm_result and isinstance(llm_result.get("items"), list):
        for item in llm_result["items"]:
            if isinstance(item, dict) and item.get("sku"):
                justifications[item["sku"]] = item.get("justification", "")

    auto_approved = 0
    escalated = 0
    po_results = []

    for candidate in candidates:
        product = products.get(candidate["product_id"])
        if not product or not supplier.get("supplier_id"):
            continue
        quantity = candidate["reorder_quantity"]
        unit_cost = float(product["cost_price"])
        total_cost = quantity * unit_cost
        po_number = _generate_po_number()
        justification = justifications.get(product["sku"], f"Stock at {candidate['quantity_on_hand']} units, below reorder point {candidate['reorder_point']}.")

        under_limit = total_cost <= po_auto_approve_limit
        po_row = {
            "po_number": po_number,
            "supplier_id": supplier["supplier_id"],
            "product_id": candidate["product_id"],
            "quantity": quantity,
            "unit_cost": unit_cost,
            "created_by_agent": AGENT_NAME,
            "expected_delivery": (date.today() + timedelta(days=supplier.get("lead_time_days") or 7)).isoformat(),
        }
        if under_limit:
            po_row["status"] = "approved"
            po_row["approved_at"] = datetime.utcnow().isoformat()
        # else: leave status at schema default ('draft')

        insert_result = supabase.table("purchase_orders").insert(po_row).execute()
        po_id = insert_result.data[0]["po_id"]
        po_results.append({"po_id": po_id, "po_number": po_number, "status": po_row.get("status", "draft"), "total_cost": total_cost})

        if under_limit:
            auto_approved += 1
        else:
            escalated += 1
            enqueue_review(
                item_type="purchase_order",
                reference_id=po_id,
                agent_name=AGENT_NAME,
                summary=f"Approve {quantity} units restock ({po_number}) — ₹{total_cost:,.2f}. {justification}",
                payload={
                    "source": AGENT_NAME,
                    "item_type": "purchase_order",
                    "reference_id": po_id,
                    "submitted_reason": "crosses_auto_approve_threshold",
                    "total_cost": total_cost,
                    "justification": justification,
                },
            )

    log_id = log_task(
        AGENT_NAME, "stock_reconciliation", "completed",
        input_data={"scanned": len(inventory_result.data or []), "candidates": len(candidates)},
        output_data={"purchase_orders": po_results, "auto_approved": auto_approved, "escalated": escalated},
        model_used=None if llm_result is None else os.getenv("OLLAMA_MODEL", "qwen2.5:7b"),
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": len(candidates), "auto_executed": auto_approved, "escalated": escalated},
    }
