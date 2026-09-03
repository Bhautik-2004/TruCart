-- ============================================================================
-- 015 - Demo signal seed for the cost/margin-driven pricing agent
-- Depends on: 002, 003, 06_suppliers, 07_products, 10_order_items
--
-- The reworked pricing agent reasons about the unit cost we last actually paid
-- (the most recent approved/received purchase order) versus the product's
-- standing cost_price. With the base seed, almost every product sits near its
-- target margin, so a first run finds little to do. This migration injects a
-- small, fixed set of RECENT purchase orders whose unit_cost diverges from
-- cost_price, so the guide's scenario -- "we ordered at one price, the market
-- moved by the time it arrived, now what should we charge?" -- is visible on the
-- first run:
--
--   * 3 products: unit_cost ~= cost_price x 1.60  -> restoring the floor margin
--     needs more than the max allowed % move  -> escalated to the review queue.
--   * 5 products: unit_cost ~= cost_price x 1.20  -> margin squeezed but fixable
--     within the cap  -> auto-applied price rise.
--   * 4 products (that actually have sales): unit_cost ~= cost_price x 0.78
--     -> cost fell, a reduce/hold opportunity for the model to weigh.
--
-- POs are inserted as status 'received' (which the inventory agent's open-PO
-- guard ignores) and dated 3 days ago. Idempotent via ON CONFLICT on po_number.
-- ============================================================================

WITH active AS (
    SELECT p.product_id, p.cost_price,
           row_number() OVER (ORDER BY p.sku) AS rn
    FROM products p
    WHERE p.status = 'active'
),
sold AS (
    SELECT DISTINCT product_id FROM order_items
),
picks AS (
    -- severe cost spike -> escalation
    SELECT product_id, ROUND(cost_price * 1.60, 2) AS new_unit_cost, 1 AS grp, rn
    FROM active WHERE rn BETWEEN 1 AND 3
    UNION ALL
    -- moderate cost rise -> capped auto-apply
    SELECT product_id, ROUND(cost_price * 1.20, 2) AS new_unit_cost, 2 AS grp, rn
    FROM active WHERE rn BETWEEN 4 AND 8
    UNION ALL
    -- cost fell -> reduce / hold opportunity (restricted to products with sales)
    SELECT a.product_id, ROUND(a.cost_price * 0.78, 2) AS new_unit_cost, 3 AS grp, a.rn
    FROM active a
    JOIN sold s ON s.product_id = a.product_id
    WHERE a.rn > 8
    ORDER BY grp, rn
    LIMIT 12
),
sup AS (
    SELECT supplier_id
    FROM suppliers
    WHERE is_active = true
    ORDER BY rating DESC NULLS LAST, name
    LIMIT 1
)
INSERT INTO purchase_orders
    (po_number, supplier_id, product_id, quantity, unit_cost, status,
     created_by_agent, created_at, approved_at, expected_delivery)
SELECT
    'PO-DEMO-' || LPAD((row_number() OVER (ORDER BY picks.grp, picks.rn))::text, 4, '0'),
    sup.supplier_id,
    picks.product_id,
    25,
    GREATEST(picks.new_unit_cost, 1.00),
    'received',
    'seed',
    now() - INTERVAL '3 days',
    now() - INTERVAL '3 days',
    (now() - INTERVAL '1 day')::date
FROM picks CROSS JOIN sup
ON CONFLICT (po_number) DO NOTHING;
