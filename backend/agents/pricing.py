import os
from datetime import datetime, timedelta, timezone
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
from .demand import units_sold_by_product
from .ledger import record_action

AGENT_NAME = "pricing_agent"

_ZERO_SUMMARY = {"scanned": 0, "auto_executed": 0, "escalated": 0}


def _margin_pct(cost: float, price: float) -> float:
    """Gross margin on price, as a percentage."""
    return (price - cost) / price * 100 if price else 0.0


def _price_for_margin(cost: float, margin_pct: float) -> float:
    """Selling price that yields ``margin_pct`` gross margin on ``cost``."""
    denom = 1 - margin_pct / 100
    return cost / denom if denom > 0 else cost


def _days_since(iso: str | None) -> float | None:
    if not iso:
        return None
    try:
        dt = datetime.fromisoformat(iso.replace("Z", "+00:00"))
    except ValueError:
        return None
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    return round((datetime.now(timezone.utc) - dt).total_seconds() / 86400, 1)


def run_pricing_agent(correlation_id=None) -> dict[str, Any]:
    """Cost-/margin-driven repricing.

    The agent does NOT look at competitors. For each active product it compares
    our current selling price against our own economics — the unit cost we last
    actually paid (latest purchase order), the gross margin that implies versus a
    target margin, how many days of stock cover we hold given recent sales, and
    how long since the price last moved — and proposes which products should be
    repriced and to what. Deterministic guardrails (margin floor, max % move,
    below-cost check) clamp or escalate every proposal.
    """
    supabase = get_supabase()
    config = load_agent_config(AGENT_NAME)
    max_items = int(config.get("max_items_per_run", 10))
    min_margin_pct = float(config.get("min_margin_pct", 10))
    target_margin_pct = float(config.get("target_margin_pct", 30))
    demand_window_days = int(config.get("demand_window_days", 90)) or 90
    overstock_cover_days = float(config.get("overstock_cover_days", 60))
    cost_move_alert_pct = float(config.get("cost_move_alert_pct", 5))
    dedup_window_min = float(config.get("dedup_window_minutes", 60))
    price_change_max_pct = float(get_store_config("price_change_max_pct", 15))
    correlation_id = correlation_id or new_correlation_id()

    def _finish(task_type: str, status: str, summary: dict[str, int], *,
                input_data=None, output_data=None, model=None) -> dict[str, Any]:
        log_id = log_task(
            AGENT_NAME, task_type, status,
            input_data=input_data, output_data=output_data or summary,
            model_used=model, correlation_id=correlation_id,
        )
        return {"status": status, "agent_name": AGENT_NAME, "log_id": log_id,
                "correlation_id": str(correlation_id), "summary": summary}

    products = (
        supabase.table("products")
        .select("product_id, sku, name, current_price, cost_price, status")
        .eq("status", "active")
        .execute()
        .data
        or []
    )
    if not products:
        return _finish("margin_scan", "completed", dict(_ZERO_SUMMARY),
                       input_data={"active_products": 0})

    # --- Effective cost basis: the unit cost of the most recent real PO ---------
    latest_po_cost: dict[str, float] = {}
    for row in (
        supabase.table("purchase_orders")
        .select("product_id, unit_cost, status, created_at")
        .in_("status", ["approved", "received"])
        .order("created_at", desc=True)
        .execute()
        .data
        or []
    ):
        pid = row["product_id"]
        if pid not in latest_po_cost and row.get("unit_cost") is not None:
            latest_po_cost[pid] = float(row["unit_cost"])

    # --- Stock on hand (summed across warehouses) ------------------------------
    stock_on_hand: dict[str, float] = {}
    for row in (
        supabase.table("inventory")
        .select("product_id, quantity_on_hand, quantity_reserved")
        .execute()
        .data
        or []
    ):
        pid = row["product_id"]
        avail = (row.get("quantity_on_hand") or 0) - (row.get("quantity_reserved") or 0)
        stock_on_hand[pid] = stock_on_hand.get(pid, 0) + avail

    # --- Demand: units sold in the trailing window (excl. cancelled/returned) --
    demand_cutoff = (datetime.now(timezone.utc) - timedelta(days=demand_window_days)).isoformat()
    units_sold = units_sold_by_product(supabase, demand_cutoff)

    # --- Build candidates ----------------------------------------------------
    candidates: list[dict[str, Any]] = []
    for p in products:
        current_price = float(p.get("current_price") or 0)
        base_cost = float(p.get("cost_price") or 0)
        if current_price <= 0 or base_cost <= 0:
            continue
        pid = p["product_id"]
        effective_cost = latest_po_cost.get(pid, base_cost)
        cost_change_pct = (effective_cost - base_cost) / base_cost * 100 if base_cost else 0.0
        current_margin_pct = _margin_pct(effective_cost, current_price)

        sold = units_sold.get(pid, 0)
        daily_velocity = sold / demand_window_days
        on_hand = max(stock_on_hand.get(pid, 0), 0)
        days_of_cover = (on_hand / daily_velocity) if daily_velocity > 0 else None

        squeezed = current_margin_pct < min_margin_pct
        cost_rose = cost_change_pct >= cost_move_alert_pct and current_margin_pct < target_margin_pct
        overstocked = (
            days_of_cover is not None
            and days_of_cover > overstock_cover_days
            and current_margin_pct > target_margin_pct
        )
        cost_fell = cost_change_pct <= -cost_move_alert_pct
        if not (squeezed or cost_rose or overstocked or cost_fell):
            continue

        if squeezed or cost_rose:
            bias = "raise"
        elif overstocked:
            bias = "reduce"
        else:  # cost fell only — let the model decide reduce vs hold
            bias = "hold"

        candidates.append({
            "product": p,
            "current_price": current_price,
            "base_cost": base_cost,
            "effective_cost": effective_cost,
            "cost_change_pct": cost_change_pct,
            "current_margin_pct": current_margin_pct,
            "units_sold": sold,
            "days_of_cover": days_of_cover,
            "bias": bias,
        })

    candidates.sort(key=lambda c: abs(c["current_margin_pct"] - target_margin_pct), reverse=True)

    # Recency (LLM input) + dedup filter, both over the candidate set.
    last_change_at: dict[str, str] = {}
    if candidates:
        cand_ids = [c["product"]["product_id"] for c in candidates]
        for row in (
            supabase.table("price_history")
            .select("product_id, created_at")
            .in_("product_id", cand_ids)
            .order("created_at", desc=True)
            .execute()
            .data
            or []
        ):
            last_change_at.setdefault(row["product_id"], row["created_at"])

        if dedup_window_min > 0:
            cutoff = (datetime.now(timezone.utc) - timedelta(minutes=dedup_window_min)).isoformat()
            recent = (
                supabase.table("price_history")
                .select("product_id")
                .in_("product_id", cand_ids)
                .gte("created_at", cutoff)
                .execute()
                .data
                or []
            )
            recent_ids = {r["product_id"] for r in recent}
            candidates = [c for c in candidates if c["product"]["product_id"] not in recent_ids]

    candidates = candidates[:max_items]
    if not candidates:
        return _finish("margin_scan", "completed", dict(_ZERO_SUMMARY),
                       input_data={"active_products": len(products)})

    # --- Ask the model to judge each move (target_price is advisory only) -----
    llm_input = [
        {
            "sku": c["product"]["sku"],
            "current_price": round(c["current_price"], 2),
            "unit_cost": round(c["effective_cost"], 2),
            "cost_change_pct": round(c["cost_change_pct"], 1),
            "current_margin_pct": round(c["current_margin_pct"], 1),
            "target_margin_pct": round(target_margin_pct, 1),
            "units_sold": c["units_sold"],
            "days_of_cover": (round(c["days_of_cover"], 1) if c["days_of_cover"] is not None else None),
            "days_since_last_change": _days_since(last_change_at.get(c["product"]["product_id"])),
        }
        for c in candidates
    ]
    llm_result = call_llm_json(
        system_prompt=load_active_policies(AGENT_NAME) + (
            "You are a retail pricing analyst. You are NOT doing competitor analysis. "
            "For each product decide whether our selling price should change based on our "
            "own economics: the unit cost basis, current gross margin versus the target "
            "margin, how much stock we hold relative to how fast it sells, and how long "
            "since the last price change. Raise the price to protect margin when our cost "
            "has risen or margin is below target. Reduce the price to accelerate "
            "sell-through only when we hold far more stock than demand supports and margin "
            "is comfortably above target. Otherwise hold. Never propose a price below unit "
            'cost. Return JSON {"items": [{"sku": "...", "action": "raise|reduce|hold", '
            '"target_price": number, "urgency": "low|medium|high", '
            '"rationale": "one sentence"}]}.'
        ),
        user_prompt=str(llm_input),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="assess-price-position",
    )
    decisions: dict[str, dict[str, Any]] = {}
    if llm_result and isinstance(llm_result.get("items"), list):
        for item in llm_result["items"]:
            if isinstance(item, dict) and item.get("sku"):
                decisions[item["sku"]] = item

    auto_executed = 0
    escalated = 0
    changes: list[dict[str, Any]] = []
    touched_product_ids: list[str] = []

    for c in candidates:
        product = c["product"]
        sku = product["sku"]
        current_price = c["current_price"]
        effective_cost = c["effective_cost"]
        current_margin_pct = c["current_margin_pct"]
        days_of_cover = c["days_of_cover"]

        target_at_margin = _price_for_margin(effective_cost, target_margin_pct)
        floor_price = _price_for_margin(effective_cost, min_margin_pct)
        cap_low = current_price * (1 - price_change_max_pct / 100)
        cap_high = current_price * (1 + price_change_max_pct / 100)

        decision = decisions.get(sku)
        action = c["bias"]
        urgency = "low"
        llm_target: float | None = None
        rationale = ""
        if decision is not None:
            raw_target = decision.get("target_price")
            try:
                llm_target = float(raw_target) if raw_target is not None else None
            except (TypeError, ValueError):
                llm_target = None
            if decision.get("action") in {"raise", "reduce", "hold"}:
                action = decision["action"]
            if str(decision.get("urgency", "")).lower() in {"low", "medium", "high"}:
                urgency = str(decision["urgency"]).lower()
            rationale = str(decision.get("rationale") or "").strip()

        if action == "hold":
            desired = current_price
        elif llm_target is not None:
            desired = llm_target
        elif action == "raise":
            desired = min(target_at_margin, cap_high)
        else:  # reduce
            desired = max(target_at_margin, cap_low)

        proposed_price = round(min(max(desired, floor_price, cap_low), cap_high), 2)
        new_margin_pct = _margin_pct(effective_cost, proposed_price)
        pct_change = (proposed_price - current_price) / current_price * 100 if current_price else 0

        below_cost = current_margin_pct < 0
        breaches_floor = proposed_price < floor_price - 0.01
        escalate = below_cost or breaches_floor or urgency == "high"

        # A genuine hold (or a sub-₹ rounding move) with no risk flag: do nothing.
        if not escalate and (action == "hold" or abs(pct_change) < 0.5):
            continue

        apply_now = not escalate

        if not rationale:
            cover_txt = (
                f"{days_of_cover:.0f}d stock cover" if days_of_cover is not None
                else "no recent sales"
            )
            rationale = (
                f"Margin {current_margin_pct:.0f}%→{new_margin_pct:.0f}% on unit cost "
                f"₹{effective_cost:,.2f} (cost {c['cost_change_pct']:+.0f}%); {cover_txt}."
            )
        reason = rationale[:200]

        try:
            rpc_res = supabase.rpc("apply_price_change", {
                "p_product_id": product["product_id"],
                "p_old_price": current_price,
                "p_new_price": proposed_price,
                "p_reason": reason,
                "p_competitor_price": None,
                "p_margin_pct": new_margin_pct,
                "p_apply": apply_now,
            }).execute()
            history_id = rpc_res.data if isinstance(rpc_res.data, str) else (rpc_res.data or [None])[0]
        except Exception:
            history_id = supabase.table("price_history").insert({
                "product_id": product["product_id"],
                "old_price": current_price,
                "new_price": proposed_price,
                "change_reason": reason[:200],
                "changed_by": AGENT_NAME,
                "competitor_price": None,
                "margin_pct": new_margin_pct,
            }).execute().data[0]["history_id"]
            if apply_now:
                supabase.table("products").update(
                    {"current_price": proposed_price}
                ).eq("product_id", product["product_id"]).execute()

        changes.append({
            "sku": sku,
            "action": action,
            "urgency": urgency,
            "old_price": current_price,
            "proposed_price": proposed_price,
            "effective_cost": round(effective_cost, 2),
            "current_margin_pct": round(current_margin_pct, 1),
            "new_margin_pct": round(new_margin_pct, 1),
            "days_of_cover": (round(days_of_cover, 1) if days_of_cover is not None else None),
            "escalated": escalate,
        })

        if escalate:
            escalated += 1
            enqueue_review(
                item_type="price_change",
                reference_id=history_id,
                agent_name=AGENT_NAME,
                summary=(
                    f"{product['name']}: ₹{current_price:,.2f} → ₹{proposed_price:,.2f} "
                    f"({pct_change:+.1f}%), margin {current_margin_pct:.0f}%→{new_margin_pct:.0f}%"
                ),
                payload={
                    "source": AGENT_NAME,
                    "item_type": "price_change",
                    "reference_id": history_id,
                    "product_id": product["product_id"],
                    "old_price": current_price,
                    "new_price": proposed_price,
                    "effective_cost": round(effective_cost, 2),
                    "cost_price_ref": round(c["base_cost"], 2),
                    "cost_change_pct": round(c["cost_change_pct"], 1),
                    "old_margin_pct": round(current_margin_pct, 1),
                    "new_margin_pct": round(new_margin_pct, 1),
                    "days_of_cover": (round(days_of_cover, 1) if days_of_cover is not None else None),
                    "units_sold": c["units_sold"],
                    "action": action,
                    "urgency": urgency,
                    "reason": reason,
                    "below_cost": below_cost,
                    "breaches_floor": breaches_floor,
                },
            )
        else:
            auto_executed += 1  # price already applied by apply_price_change / fallback
            notify(
                "Price updated",
                f"{product['name']}: ₹{current_price:,.2f} → ₹{proposed_price:,.2f} ({pct_change:+.1f}%).",
                type="agent",
                reference_id=history_id,
                reference_type="price_history",
            )

        touched_product_ids.append(product["product_id"])
        record_action(
            action_type="price_change",
            agent_name=AGENT_NAME,
            entity_type="product",
            entity_id=product["product_id"],
            decision={
                "product_id": product["product_id"], "history_id": history_id, "sku": sku,
                "old_price": current_price, "new_price": proposed_price,
                "effective_cost": round(effective_cost, 2), "action": action, "urgency": urgency,
            },
            correlation_id=correlation_id,
            autonomy="escalated" if escalate else "auto",
            context={"daily_velocity": (c["units_sold"] / demand_window_days) if demand_window_days else 0.0},
        )

    summary = {"scanned": len(candidates), "auto_executed": auto_executed, "escalated": escalated}
    result = _finish(
        "price_update", "completed", summary,
        input_data={"candidates": len(candidates)},
        output_data={"changes": changes, "auto_executed": auto_executed, "escalated": escalated},
        model=None if llm_result is None else os.getenv("OLLAMA_MODEL", "qwen2.5:7b"),
    )
    result["touched_product_ids"] = touched_product_ids
    return result
