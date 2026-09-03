import os
from collections import defaultdict
from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import (
    call_llm_json,
    enqueue_review,
    load_agent_config,
    log_task,
    new_correlation_id,
)

AGENT_NAME = "marketing_agent"


def run_marketing_agent(correlation_id=None) -> dict[str, Any]:
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 3))
    budget_auto_approve_limit = float(config.get("budget_auto_approve_limit", 200))
    overstock_multiplier = float(config.get("overstock_multiplier", 4))
    correlation_id = correlation_id or new_correlation_id()

    inventory_result = (
        supabase.table("inventory")
        .select("product_id, quantity_on_hand, reorder_point")
        .execute()
    )
    totals: dict[str, dict[str, int]] = defaultdict(lambda: {"on_hand": 0, "reorder_point": 0})
    for row in inventory_result.data or []:
        totals[row["product_id"]]["on_hand"] += row["quantity_on_hand"]
        totals[row["product_id"]]["reorder_point"] = max(
            totals[row["product_id"]]["reorder_point"], row["reorder_point"]
        )

    overstocked = [
        {"product_id": pid, "on_hand": t["on_hand"], "reorder_point": t["reorder_point"]}
        for pid, t in totals.items()
        if t["reorder_point"] > 0 and t["on_hand"] > t["reorder_point"] * overstock_multiplier
    ]
    overstocked.sort(key=lambda r: r["on_hand"] - r["reorder_point"], reverse=True)
    candidates = overstocked[:max_items]

    if not candidates:
        log_id = log_task(
            AGENT_NAME, "overstock_scan", "completed",
            input_data={"products_scanned": len(totals)},
            output_data={"scanned": 0, "auto_executed": 0, "escalated": 0},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    product_ids = [c["product_id"] for c in candidates]
    products = {
        p["product_id"]: p
        for p in (
            supabase.table("products")
            .select("product_id, sku, name, category, current_price")
            .in_("product_id", product_ids)
            .execute()
            .data
            or []
        )
    }

    # Idempotency: skip products that already have a live/draft clearance campaign.
    existing_campaign_names = {
        row["name"]
        for row in (
            supabase.table("campaigns")
            .select("name, status")
            .in_("status", ["active", "draft", "scheduled"])
            .execute()
            .data
            or []
        )
    }
    candidates = [
        c for c in candidates
        if c["product_id"] in products
        and f"Clearance — {products[c['product_id']]['name']}"[:255] not in existing_campaign_names
    ]
    if not candidates:
        log_id = log_task(
            AGENT_NAME, "overstock_scan", "completed",
            input_data={"products_scanned": len(totals)},
            output_data={"scanned": 0, "auto_executed": 0, "escalated": 0, "note": "all overstock already has a campaign"},
            model_used=None, correlation_id=correlation_id,
        )
        return {"status": "completed", "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0}}

    active_customers = (
        supabase.table("customers").select("customer_id", count="exact").limit(1).execute()
    )
    recipient_estimate = min(2500, max(50, (active_customers.count or 500) // 3))

    auto_executed = 0
    escalated = 0
    campaigns_created = []
    model_used = None

    for candidate in candidates:
        product = products.get(candidate["product_id"])
        if not product:
            continue

        llm_result = call_llm_json(
            system_prompt=(
                "You are an e-commerce marketing copywriter. Given an overstocked product, "
                'return JSON {"subject": "short email subject", "body": "1-2 sentence promo copy", '
                '"segment": "target audience label"}.'
            ),
            user_prompt=str({"name": product["name"], "category": product["category"], "price": product["current_price"]}),
            agent_name=AGENT_NAME,
            correlation_id=correlation_id,
            call_name="generate-campaign-copy",
            trace_metadata={"sku": product["sku"]},
        )
        if llm_result:
            model_used = os.getenv("OLLAMA_MODEL", "qwen2.5:7b")
            subject = llm_result.get("subject") or f"Clearance: {product['name']}"
            body = llm_result.get("body") or f"Save on {product['name']} while stocks last."
            segment = llm_result.get("segment") or "recent_buyers"
        else:
            subject = f"Limited-Time Offer: {product['name']}"
            body = f"We've got extra stock of {product['name']} — grab it at a special price this week only."
            segment = "recent_buyers"

        budget = round(min(500, max(50, product["current_price"] * 0.5)), 2)
        auto_approve = budget <= budget_auto_approve_limit

        campaign_row = {
            "name": f"Clearance — {product['name']}"[:255],
            "type": "clearance",
            "segment": segment[:100],
            "content_subject": subject,
            "content_body": body,
            "budget": budget,
            "created_by_agent": AGENT_NAME,
        }
        if auto_approve:
            campaign_row["status"] = "active"
            campaign_row["sent_at"] = datetime.now(timezone.utc).isoformat()
        else:
            campaign_row["status"] = "draft"

        insert_result = supabase.table("campaigns").insert(campaign_row).execute()
        campaign_id = insert_result.data[0]["campaign_id"]
        campaigns_created.append({"campaign_id": campaign_id, "product_id": product["product_id"], "status": campaign_row["status"]})

        if auto_approve:
            supabase.table("campaign_metrics").insert({
                "campaign_id": campaign_id,
                "recipients": recipient_estimate,
                "opened": 0,
                "clicked": 0,
                "converted": 0,
                "revenue_attributed": 0,
            }).execute()
            auto_executed += 1
        else:
            escalated += 1
            enqueue_review(
                item_type="campaign",
                reference_id=campaign_id,
                agent_name=AGENT_NAME,
                summary=f"Approve campaign '{campaign_row['name']}' — budget ₹{budget:,.2f}, targeting {segment}.",
                payload={
                    "source": AGENT_NAME,
                    "item_type": "campaign",
                    "reference_id": campaign_id,
                    "product_id": product["product_id"],
                    "budget": budget,
                    "segment": segment,
                },
            )

    log_id = log_task(
        AGENT_NAME, "overstock_campaign", "completed",
        input_data={"candidates": len(candidates)},
        output_data={"campaigns": campaigns_created, "auto_executed": auto_executed, "escalated": escalated},
        model_used=model_used,
        correlation_id=correlation_id,
    )

    return {
        "status": "completed",
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(correlation_id),
        "summary": {"scanned": len(candidates), "auto_executed": auto_executed, "escalated": escalated},
    }
