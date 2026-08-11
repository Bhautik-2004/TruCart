-- ============================================================================
-- 006 - Row Level Security (RLS)
-- Depends on: 001-005 (all tables must exist first)
--
-- MODEL
--   * postgres / service_role (owner) = full access, bypasses RLS (your agents).
--   * authenticated  = logged-in users. Two personas distinguished via auth.uid():
--       - CUSTOMER: a row in customers whose auth_user_id = their auth uid.
--       - STAFF   : a row in users (role admin/reviewer) whose auth_user_id = their uid.
--   * anon = public; read-only on products + knowledge_base.
--
-- Helpers are SECURITY DEFINER so they read lookup tables without recursion.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Helper functions (CREATE OR REPLACE keeps them idempotent)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_staff()
RETURNS boolean
LANGUAGE sql STABLE SECURITY DEFINER
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1 FROM public.users u
        WHERE u.auth_user_id = auth.uid()
          AND u.is_active = TRUE
          AND u.role IN ('admin', 'reviewer')
    );
$$;

CREATE OR REPLACE FUNCTION current_customer_id()
RETURNS uuid
LANGUAGE sql STABLE SECURITY DEFINER
SET search_path = public
AS $$
    SELECT c.customer_id FROM public.customers c
    WHERE c.auth_user_id = auth.uid()
    LIMIT 1;
$$;

-- ----------------------------------------------------------------------------
-- CUSTOMER-owned tables: customers, addresses, orders, order_items, shipments,
-- support_tickets, ticket_messages.
-- Customers act on their own rows; staff act on all rows.
-- ----------------------------------------------------------------------------

ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS customers_own_all ON customers;
CREATE POLICY customers_own_all ON customers FOR ALL TO authenticated
    USING (auth_user_id = auth.uid() OR is_staff())
    WITH CHECK (auth_user_id = auth.uid() OR is_staff());

ALTER TABLE addresses ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS addresses_own_all ON addresses;
CREATE POLICY addresses_own_all ON addresses FOR ALL TO authenticated
    USING (customer_id = current_customer_id() OR is_staff())
    WITH CHECK (customer_id = current_customer_id() OR is_staff());

ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS orders_own_all ON orders;
CREATE POLICY orders_own_all ON orders FOR ALL TO authenticated
    USING (customer_id = current_customer_id() OR is_staff())
    WITH CHECK (customer_id = current_customer_id() OR is_staff());

ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS order_items_own_all ON order_items;
CREATE POLICY order_items_own_all ON order_items FOR ALL TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM orders o
            WHERE o.order_id = order_items.order_id
              AND o.customer_id = current_customer_id()
        ) OR is_staff()
    )
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM orders o
            WHERE o.order_id = order_items.order_id
              AND o.customer_id = current_customer_id()
        ) OR is_staff()
    );

ALTER TABLE shipments ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS shipments_own_all ON shipments;
CREATE POLICY shipments_own_all ON shipments FOR ALL TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM orders o
            WHERE o.order_id = shipments.order_id
              AND o.customer_id = current_customer_id()
        ) OR is_staff()
    )
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM orders o
            WHERE o.order_id = shipments.order_id
              AND o.customer_id = current_customer_id()
        ) OR is_staff()
    );

ALTER TABLE support_tickets ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS support_tickets_own_all ON support_tickets;
CREATE POLICY support_tickets_own_all ON support_tickets FOR ALL TO authenticated
    USING (customer_id = current_customer_id() OR is_staff())
    WITH CHECK (customer_id = current_customer_id() OR is_staff());

ALTER TABLE ticket_messages ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS ticket_messages_own_all ON ticket_messages;
CREATE POLICY ticket_messages_own_all ON ticket_messages FOR ALL TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM support_tickets t
            WHERE t.ticket_id = ticket_messages.ticket_id
              AND t.customer_id = current_customer_id()
        ) OR is_staff()
    )
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM support_tickets t
            WHERE t.ticket_id = ticket_messages.ticket_id
              AND t.customer_id = current_customer_id()
        ) OR is_staff()
    );

-- ----------------------------------------------------------------------------
-- STAFF-only internal tables.
-- Users / staff see and act on all rows; customers have no access.
-- ----------------------------------------------------------------------------

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS users_staff_all ON users;
CREATE POLICY users_staff_all ON users FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE store_config ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS store_config_staff_all ON store_config;
CREATE POLICY store_config_staff_all ON store_config FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE warehouses ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS warehouses_staff_all ON warehouses;
CREATE POLICY warehouses_staff_all ON warehouses FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS suppliers_staff_all ON suppliers;
CREATE POLICY suppliers_staff_all ON suppliers FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE inventory ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS inventory_staff_all ON inventory;
CREATE POLICY inventory_staff_all ON inventory FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE purchase_orders ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS purchase_orders_staff_all ON purchase_orders;
CREATE POLICY purchase_orders_staff_all ON purchase_orders FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE price_history ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS price_history_staff_all ON price_history;
CREATE POLICY price_history_staff_all ON price_history FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE competitor_prices ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS competitor_prices_staff_all ON competitor_prices;
CREATE POLICY competitor_prices_staff_all ON competitor_prices FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE campaigns ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS campaigns_staff_all ON campaigns;
CREATE POLICY campaigns_staff_all ON campaigns FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE campaign_metrics ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS campaign_metrics_staff_all ON campaign_metrics;
CREATE POLICY campaign_metrics_staff_all ON campaign_metrics FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE agent_task_log ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS agent_task_log_staff_all ON agent_task_log;
CREATE POLICY agent_task_log_staff_all ON agent_task_log FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE agent_config ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS agent_config_staff_all ON agent_config;
CREATE POLICY agent_config_staff_all ON agent_config FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE review_queue ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS review_queue_staff_all ON review_queue;
CREATE POLICY review_queue_staff_all ON review_queue FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

-- ----------------------------------------------------------------------------
-- PUBLIC-READ tables: products + knowledge_base.
-- Anyone (anon / authenticated) may read; only staff may write.
-- ----------------------------------------------------------------------------

ALTER TABLE products ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS products_public_read ON products;
CREATE POLICY products_public_read ON products FOR SELECT TO anon, authenticated USING (TRUE);

DROP POLICY IF EXISTS products_staff_all ON products;
CREATE POLICY products_staff_all ON products FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

ALTER TABLE knowledge_base ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS knowledge_base_public_read ON knowledge_base;
CREATE POLICY knowledge_base_public_read ON knowledge_base FOR SELECT TO anon, authenticated USING (TRUE);

DROP POLICY IF EXISTS knowledge_base_staff_all ON knowledge_base;
CREATE POLICY knowledge_base_staff_all ON knowledge_base FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());

-- ----------------------------------------------------------------------------
-- Explicit grants (defensive; Supabase usually grants these already).
-- ----------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT SELECT ON products, knowledge_base TO anon;