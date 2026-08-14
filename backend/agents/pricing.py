import os
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

AGENT_NAME = "pricing_agent"


def run_pricing_agent() -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 10))
    min_margin_pct = float(config.get("min_margin_pct", 10))
    competitor_drop_escalate_pct = float(config.get("competitor_drop_escalate_pct", 20))
    price_change_max_pct = float(get_store_config("price_change_max_pct", 15))
    correlation_id = new_correlation_id()

    comp_result = (
        supabase.table("competitor_prices")
        .select("product_id, competitor_name, competitor_price, detected_at")
        .order("detected_at", desc=True)
        .limit(500)
        .execute()
    )
    min_by_product: dict[str, float] = {}
    for row in comp_result.data or []:
        product_id = row["product_id"]
        price = float(row["competitor_price"])
        if product_id not in min_by_product or price < min_by_product[product_id]:
            min_by_product[product_id] = price

    product_ids = list(min_by_product.keys())
    if not product_ids:
        log_id = log_task(
            AGENT_NAME, "competitor_monitor", "completed",
            input_data={"competitor_rows": len(comp_result.data or [])},
            output_data={"scanned": 0, "auto_executed": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    products = {
        p["product_id"]: p
        for p in (
            supabase.table("products")
            .select("product_id, sku, name, current_price, cost_price")
            .in_("product_id", product_ids)
            .execute()
            .data
            or []
        )
    }

    candidates = []
    for product_id, competitor_min in min_by_product.items():
        product = products.get(product_id)
        if not product:
            continue
        current_price = float(product["current_price"])
        gap_pct = (current_price - competitor_min) / current_price if current_price else 0
        candidates.append({"product": product, "competitor_min": competitor_min, "gap_pct": gap_pct})
    candidates.sort(key=lambda c: c["gap_pct"], reverse=True)
    candidates = [c for c in candidates if c["gap_pct"] > 0][:max_items]

    if not candidates:
        log_id = log_task(
            AGENT_NAME, "competitor_monitor", "completed",
            input_data={"products_with_competitor_data": len(product_ids)},
            output_data={"scanned": 0, "auto_executed": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    llm_input = [
        {
            "sku": c["product"]["sku"],
            "current_price": c["product"]["current_price"],
            "competitor_price": c["competitor_min"],
        }
        for c in candidates
    ]
    llm_result = call_llm_json(
        system_prompt=(
            "You are a pricing assistant. Given products and their cheapest competitor price, "
            'return JSON {"items": [{"sku": "...", "change_reason": "one short sentence"}]}.'
        ),
        user_prompt=str(llm_input),
    )
    reasons: dict[str, str] = {}
    if llm_result and isinstance(llm_result.get("items"), list):
        for item in llm_result["items"]:
            if isinstance(item, dict) and item.get("sku"):
                reasons[item["sku"]] = item.get("change_reason", "")

    auto_executed = 0
    escalated = 0
    changes = []

    for candidate in candidates:
        product = candidate["product"]
        current_price = float(product["current_price"])
        cost_price = float(product["cost_price"])
        competitor_min = candidate["competitor_min"]
        gap_pct = candidate["gap_pct"] * 100

        floor_price = cost_price * (1 + min_margin_pct / 100)
        proposed_price = max(competitor_min * 0.99, floor_price)
        pct_change = abs(proposed_price - current_price) / current_price * 100 if current_price else 0
        reason = reasons.get(product["sku"], f"Competitor price ₹{competitor_min:,.2f} vs current ₹{current_price:,.2f}.")
        reason = reason[:200]

        breaches_floor = proposed_price < floor_price - 0.01
        exceeds_cap = pct_change > price_change_max_pct
        competitor_drop_triggered = gap_pct > competitor_drop_escalate_pct
        escalate = breaches_floor or exceeds_cap or competitor_drop_triggered

        margin_pct = (proposed_price - cost_price) / proposed_price * 100 if proposed_price else 0
        history_row = {
            "product_id": product["product_id"],
            "old_price": current_price,
            "new_price": proposed_price,
            "change_reason": reason,
            "changed_by": AGENT_NAME,
            "competitor_price": competitor_min,
            "margin_pct": margin_pct,
        }
        insert_result = supabase.table("price_history").insert(history_row).execute()
        history_id = insert_result.data[0]["history_id"]
        changes.append({"product_id": product["product_id"], "history_id": history_id, "proposed_price": proposed_price, "escalated": escalate})

        if escalate:
            escalated += 1
            enqueue_review(
                item_type="price_change",
                reference_id=history_id,
                agent_name=AGENT_NAME,
                summary=f"Price change for {product['name']}: ₹{current_price:,.2f} → ₹{proposed_price:,.2f} ({pct_change:.1f}%)",
                payload={
                    "source": AGENT_NAME,
                    "item_type": "price_change",
                    "reference_id": history_id,
                    "product_id": product["product_id"],
                    "old_price": current_price,
                    "new_price": proposed_price,
                    "reason": reason,
                    "breaches_floor": breaches_floor,
                    "exceeds_cap": exceeds_cap,
                    "competitor_drop_triggered": competitor_drop_triggered,
                },
            )
        else:
            auto_executed += 1
            supabase.table("products").update({"current_price": proposed_price}).eq("product_id", product["product_id"]).execute()

    log_id = log_task(
        AGENT_NAME, "price_update", "completed",
        input_data={"candidates": len(candidates)},
        output_data={"changes": changes, "auto_executed": auto_executed, "escalated": escalated},
        model_used=None if llm_result is None else os.getenv("OLLAMA_MODEL", "qwen2.5:7b"),
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": len(candidates), "auto_executed": auto_executed, "escalated": escalated},
    }
