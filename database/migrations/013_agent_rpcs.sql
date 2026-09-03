-- ============================================================================
-- 013 - Transactional RPCs for agent multi-row writes
-- Depends on: 003, 004
--
-- Each agent action below writes several rows that must land together. A
-- plpgsql function body runs in a single transaction, so RAISE / any error
-- rolls the whole thing back. The agents call these via supabase.rpc(...),
-- and fall back to their previous row-by-row writes if the function is absent.
-- ============================================================================

-- Pricing: record the proposal, and (only when p_apply) move the live price.
CREATE OR REPLACE FUNCTION apply_price_change(
    p_product_id uuid,
    p_old_price numeric,
    p_new_price numeric,
    p_reason text,
    p_competitor_price numeric,
    p_margin_pct numeric,
    p_apply boolean
) RETURNS uuid
LANGUAGE plpgsql
AS $$
DECLARE
    v_history_id uuid;
BEGIN
    INSERT INTO price_history (
        product_id, old_price, new_price, change_reason,
        changed_by, competitor_price, margin_pct
    )
    VALUES (
        p_product_id, p_old_price, p_new_price, left(p_reason, 200),
        'pricing_agent', p_competitor_price, p_margin_pct
    )
    RETURNING history_id INTO v_history_id;

    IF p_apply THEN
        UPDATE products SET current_price = p_new_price WHERE product_id = p_product_id;
    END IF;

    RETURN v_history_id;
END;
$$;


-- Inventory: create the PO, and enqueue a review row iff it isn't auto-approved.
CREATE OR REPLACE FUNCTION create_po_with_review(
    p_po_number text,
    p_supplier_id uuid,
    p_product_id uuid,
    p_quantity int,
    p_unit_cost numeric,
    p_expected_delivery date,
    p_auto_approve boolean,
    p_review_summary text,
    p_review_payload jsonb
) RETURNS uuid
LANGUAGE plpgsql
AS $$
DECLARE
    v_po_id uuid;
BEGIN
    INSERT INTO purchase_orders (
        po_number, supplier_id, product_id, quantity, unit_cost,
        created_by_agent, expected_delivery, status, approved_at
    )
    VALUES (
        p_po_number, p_supplier_id, p_product_id, p_quantity, p_unit_cost,
        'inventory_agent', p_expected_delivery,
        CASE WHEN p_auto_approve THEN 'approved' ELSE 'draft' END,
        CASE WHEN p_auto_approve THEN now() ELSE NULL END
    )
    RETURNING po_id INTO v_po_id;

    IF NOT p_auto_approve THEN
        INSERT INTO review_queue (item_type, reference_id, agent_name, summary, payload, status)
        VALUES ('purchase_order', v_po_id, 'inventory_agent', p_review_summary, p_review_payload, 'pending');
    END IF;

    RETURN v_po_id;
END;
$$;


-- Orders: reserve stock for every line item, then confirm. Any shortage raises,
-- rolling back all reservations (the agent then escalates the order).
CREATE OR REPLACE FUNCTION confirm_order_and_reserve(p_order_id uuid)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    r_item RECORD;
    r_inv RECORD;
    v_remaining int;
    v_take int;
    v_available int;
BEGIN
    FOR r_item IN
        SELECT product_id, quantity FROM order_items WHERE order_id = p_order_id
    LOOP
        v_remaining := r_item.quantity;
        FOR r_inv IN
            SELECT inventory_id, quantity_on_hand, quantity_reserved
            FROM inventory
            WHERE product_id = r_item.product_id
            ORDER BY (quantity_on_hand - quantity_reserved) DESC
            FOR UPDATE
        LOOP
            EXIT WHEN v_remaining <= 0;
            v_available := r_inv.quantity_on_hand - r_inv.quantity_reserved;
            IF v_available <= 0 THEN
                CONTINUE;
            END IF;
            v_take := LEAST(v_available, v_remaining);
            UPDATE inventory
            SET quantity_reserved = quantity_reserved + v_take
            WHERE inventory_id = r_inv.inventory_id;
            v_remaining := v_remaining - v_take;
        END LOOP;

        IF v_remaining > 0 THEN
            RAISE EXCEPTION 'insufficient stock for product %', r_item.product_id;
        END IF;
    END LOOP;

    UPDATE orders SET status = 'confirmed', confirmed_at = now() WHERE order_id = p_order_id;
    UPDATE order_items SET status = 'fulfilled' WHERE order_id = p_order_id;
    RETURN 'confirmed';
END;
$$;
