-- ============================================================================
-- 016 - Autopilot Ledger: per-decision outcome accounting + supporting RPCs
-- Depends on: 003, 004, 013
--
-- Adds:
--   * agent_action   - one row per discrete autonomous/escalated agent decision,
--                      carrying a counterfactual baseline captured at decision
--                      time and (after a settle window) the verified outcome.
--   * agent_policy    - standing natural-language rules a human attached when
--                      rejecting a review item; injected into agent prompts.
--   * receive_purchase_order / release_order_reservation - atomic RPCs the
--     blocker fixes need.
--   * ledger_* store_config knobs.
-- ============================================================================

CREATE TABLE IF NOT EXISTS agent_action (
    action_id           UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    correlation_id      UUID,
    agent_name          VARCHAR(50)   NOT NULL,
    action_type         VARCHAR(40)   NOT NULL,   -- price_change | purchase_order | order_confirm | campaign | refund | shipment_exception
    entity_type         VARCHAR(40)   NOT NULL,
    entity_id           UUID,
    decision            JSONB,                    -- the parameters the agent chose
    baseline            JSONB,                    -- {formula, inputs, projected_delta_inr}
    autonomy            VARCHAR(20)   NOT NULL DEFAULT 'auto',   -- auto | escalated | human_approved | human_rejected
    measurability       VARCHAR(12)   NOT NULL DEFAULT 'measured', -- measured | estimated | unmeasurable
    verify_after        TIMESTAMPTZ   NOT NULL,
    status              VARCHAR(20)   NOT NULL DEFAULT 'pending', -- pending | verified | skipped
    outcome             JSONB,
    realized_delta_inr  NUMERIC(14,2),
    baseline_delta_inr  NUMERIC(14,2),
    calibration_error   NUMERIC(14,2),
    grade               VARCHAR(12),              -- win | loss | neutral | unmeasurable
    created_at          TIMESTAMPTZ   NOT NULL DEFAULT now(),
    verified_at         TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_agent_action_agent_verified ON agent_action (agent_name, verified_at);
CREATE INDEX IF NOT EXISTS idx_agent_action_due ON agent_action (status, verify_after);
CREATE INDEX IF NOT EXISTS idx_agent_action_correlation ON agent_action (correlation_id);

-- The cycle grouping key was never indexed.
CREATE INDEX IF NOT EXISTS idx_agent_task_log_correlation ON agent_task_log (correlation_id);


CREATE TABLE IF NOT EXISTS agent_policy (
    policy_id             UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_name            VARCHAR(50)   NOT NULL,
    rule_text             TEXT          NOT NULL,
    created_from_review_id UUID         REFERENCES review_queue(review_id) ON DELETE SET NULL,
    active                BOOLEAN       NOT NULL DEFAULT TRUE,
    created_at            TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_agent_policy_active ON agent_policy (agent_name, active);


-- Ledger tunables (JSONB scalar values, same convention as the rest of store_config).
INSERT INTO store_config (config_key, config_value, description) VALUES
    ('ledger_settle_days_price',    '14'::jsonb,  'Days after a price change before the ledger verifies its outcome'),
    ('ledger_settle_days_po',       '7'::jsonb,   'Days after a PO''s expected delivery before verification'),
    ('ledger_settle_days_campaign', '14'::jsonb,  'Days after a campaign launch before verification'),
    ('ledger_settle_days_refund',   '30'::jsonb,  'Days after an auto-refund before verification (reopen window)'),
    ('ledger_win_rate_floor',       '0.5'::jsonb, 'Verified win-rate below which an agent''s autonomy is proposed for tightening'),
    ('ledger_win_rate_ceiling',     '0.8'::jsonb, 'Verified win-rate at or above which an agent may be proposed for widening'),
    ('ledger_min_sample',           '8'::jsonb,   'Minimum verified actions before autonomy is re-evaluated'),
    ('support_handle_cost_inr',     '120'::jsonb, 'Assumed loaded cost of a human handling one support ticket (INR)')
ON CONFLICT (config_key) DO NOTHING;


-- Inventory: atomically receive one approved PO. Returns 'received' if this call
-- did the work, 'skipped' if the PO was already received / not approved / gone.
-- The row lock + status guard make a concurrent manual run and scheduler tick
-- safe (only one adds the quantity).
CREATE OR REPLACE FUNCTION receive_purchase_order(p_po_id uuid)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    v_po   RECORD;
    v_inv_id uuid;
BEGIN
    SELECT po_id, product_id, quantity INTO v_po
    FROM purchase_orders
    WHERE po_id = p_po_id AND status = 'approved'
    FOR UPDATE;

    IF NOT FOUND THEN
        RETURN 'skipped';
    END IF;

    UPDATE purchase_orders SET status = 'received' WHERE po_id = p_po_id;

    SELECT inventory_id INTO v_inv_id
    FROM inventory
    WHERE product_id = v_po.product_id
    ORDER BY quantity_on_hand ASC
    LIMIT 1
    FOR UPDATE;

    IF v_inv_id IS NOT NULL THEN
        UPDATE inventory
        SET quantity_on_hand  = quantity_on_hand + v_po.quantity,
            last_restock_date = CURRENT_DATE
        WHERE inventory_id = v_inv_id;
    END IF;

    RETURN 'received';
END;
$$;


-- Release stock previously reserved for an order (used on cancel / refund).
-- Callers must only invoke this for an order whose stock was actually reserved
-- (i.e. it had reached 'confirmed'/'shipped'); it decrements quantity_reserved
-- by the order's line quantities, never below zero.
CREATE OR REPLACE FUNCTION release_order_reservation(p_order_id uuid)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    r_item RECORD;
    r_inv  RECORD;
    v_remaining int;
    v_take int;
BEGIN
    FOR r_item IN
        SELECT product_id, quantity FROM order_items WHERE order_id = p_order_id
    LOOP
        v_remaining := r_item.quantity;
        FOR r_inv IN
            SELECT inventory_id, quantity_reserved
            FROM inventory
            WHERE product_id = r_item.product_id AND quantity_reserved > 0
            ORDER BY quantity_reserved DESC
            FOR UPDATE
        LOOP
            EXIT WHEN v_remaining <= 0;
            v_take := LEAST(r_inv.quantity_reserved, v_remaining);
            UPDATE inventory
            SET quantity_reserved = quantity_reserved - v_take
            WHERE inventory_id = r_inv.inventory_id;
            v_remaining := v_remaining - v_take;
        END LOOP;
    END LOOP;
    RETURN 'released';
END;
$$;
