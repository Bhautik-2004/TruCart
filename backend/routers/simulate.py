"""Simulated inbound order traffic.

In a real deployment orders arrive from a storefront or an integration (Shopify,
a marketplace API, ...). This project has no customer-facing surface, so orders
only ever existed as SQL seed data. This endpoint synthesises fresh, realistic
`orders` + `order_items` (and occasionally a new customer) so the agent pipeline
has new work to act on during a demo.
"""

import logging
import random
import uuid
from typing import Any

from fastapi import APIRouter, Query

from ..agents.base import notify
from ..agents.orchestrator import run_orchestrator
from ..db import get_supabase

logger = logging.getLogger("trucart.simulate")

router = APIRouter(prefix="/api/simulate", tags=["simulate"])

_PAYMENT_METHODS = ["upi", "cod", "card", "netbanking"]
_FIRST_NAMES = ["Aarav", "Diya", "Vivaan", "Ananya", "Reyansh", "Ishita", "Kabir", "Myra", "Arjun", "Sara"]
_LAST_NAMES = ["Sharma", "Patel", "Reddy", "Nair", "Gupta", "Iyer", "Bose", "Khan", "Mehta", "Rao"]
_CITIES = [("Mumbai", "MH"), ("Bengaluru", "KA"), ("Delhi", "DL"), ("Pune", "MH"), ("Chennai", "TN"), ("Hyderabad", "TG")]


def _new_customer(supabase: Any) -> tuple[str, str]:
    """Create a throwaway customer + default address. Returns (customer_id, address_id)."""
    first, last = random.choice(_FIRST_NAMES), random.choice(_LAST_NAMES)
    suffix = uuid.uuid4().hex[:8]
    customer = supabase.table("customers").insert({
        "email": f"{first.lower()}.{last.lower()}{suffix}@example.com",
        "full_name": f"{first} {last}",
        "phone": f"+91-9{random.randint(100000000, 999999999)}",
        "segment": random.choice(["standard", "regular"]),
    }).execute().data[0]
    city, state = random.choice(_CITIES)
    address = supabase.table("addresses").insert({
        "customer_id": customer["customer_id"],
        "line1": f"{random.randint(1, 999)}, {random.choice(_LAST_NAMES)} Residency",
        "city": city,
        "state": state,
        "postal_code": str(random.randint(110001, 799999)),
        "country": "IN",
        "is_default": True,
    }).execute().data[0]
    return customer["customer_id"], address["address_id"]


@router.post("/orders")
def simulate_orders(
    count: int = Query(5, ge=1, le=50),
    trigger_agents: bool = Query(False, description="Run one orchestrator cycle after creating the orders."),
) -> dict[str, Any]:
    supabase = get_supabase()

    # Candidate pools.
    addresses = (
        supabase.table("addresses").select("address_id, customer_id").limit(500).execute().data or []
    )
    products = (
        supabase.table("products")
        .select("product_id, current_price")
        .eq("status", "active")
        .limit(500)
        .execute()
        .data
        or []
    )
    if not products:
        return {"status": "error", "detail": "No active products to build orders from.", "created": 0}

    created_ids: list[str] = []
    new_customers = 0

    for _ in range(count):
        # ~15% of simulated orders come from a brand-new customer.
        if not addresses or random.random() < 0.15:
            customer_id, address_id = _new_customer(supabase)
            new_customers += 1
        else:
            row = random.choice(addresses)
            customer_id, address_id = row["customer_id"], row["address_id"]

        line_products = random.sample(products, k=min(len(products), random.randint(1, 3)))
        items = [
            {"product": p, "quantity": random.randint(1, 3), "unit_price": float(p["current_price"])}
            for p in line_products
        ]
        total = round(sum(i["quantity"] * i["unit_price"] for i in items), 2)

        order = supabase.table("orders").insert({
            "customer_id": customer_id,
            "order_number": f"TB-SIM-{uuid.uuid4().hex[:8].upper()}",
            "status": "pending",
            "total_amount": total,
            "currency": "INR",
            "shipping_address_id": address_id,
            "payment_method": random.choice(_PAYMENT_METHODS),
            # Weight toward paid so the order agent has something to confirm.
            "payment_status": random.choices(["paid", "pending"], weights=[0.65, 0.35])[0],
        }).execute().data[0]
        order_id = order["order_id"]
        created_ids.append(order_id)

        supabase.table("order_items").insert([
            {
                "order_id": order_id,
                "product_id": i["product"]["product_id"],
                "quantity": i["quantity"],
                "unit_price": i["unit_price"],
                "status": "pending",
            }
            for i in items
        ]).execute()

    notify(
        "Simulated orders received",
        f"{count} new order(s) entered the queue" + (f", including {new_customers} new customer(s)." if new_customers else "."),
        type="order",
        reference_type="order",
    )

    result: dict[str, Any] = {
        "status": "success",
        "created": len(created_ids),
        "new_customers": new_customers,
        "order_ids": created_ids,
    }
    if trigger_agents:
        try:
            result["cycle"] = run_orchestrator()
        except Exception as exc:  # noqa: BLE001 - simulation must still report success
            logger.exception("post-simulate orchestrator run failed")
            result["cycle_error"] = str(exc)
    return result
