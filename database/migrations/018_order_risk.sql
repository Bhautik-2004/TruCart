-- ============================================================================
-- 018 - Order risk/fraud scoring
-- Depends on: 003
--
-- Adds risk_* columns to orders, written by agents.risk.assess_order_risk via
-- agents.orders.run_order_agent for every order it processes (not just the
-- ones it escalates), so the dashboard can show a risk badge on any order.
-- ============================================================================

ALTER TABLE orders
    ADD COLUMN IF NOT EXISTS risk_score       DECIMAL(4,3),   -- 0.000 - 1.000
    ADD COLUMN IF NOT EXISTS risk_level       VARCHAR(10),    -- low | medium | high
    ADD COLUMN IF NOT EXISTS risk_reasons     JSONB,
    ADD COLUMN IF NOT EXISTS risk_assessed_at TIMESTAMPTZ;
