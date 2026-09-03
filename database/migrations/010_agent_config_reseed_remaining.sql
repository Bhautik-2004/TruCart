-- ============================================================================
-- 010 - Reseed agent_config for the remaining agents (order/marketing/logistics)
-- Depends on: 004, 008
--
-- Migration 008 cleaned inventory/pricing/support. The order, marketing, and
-- logistics agents were still reading from the fuzzed/randomized seed rows in
-- seed_data/20_agent_config.sql (duplicate keys, near-random values), so they
-- silently fell back to code defaults. Replace those rows with the canonical
-- keys each agent's code actually reads. Approval thresholds stay in
-- store_config; not duplicated here.
-- ============================================================================

DELETE FROM agent_config WHERE agent_name IN ('order_agent', 'marketing_agent', 'logistics_agent');

INSERT INTO agent_config (agent_name, config_key, config_value) VALUES
('order_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('order_agent', 'max_items_per_run', '8'::jsonb),

('marketing_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('marketing_agent', 'max_items_per_run', '3'::jsonb),
('marketing_agent', 'budget_auto_approve_limit', '200'::jsonb),
('marketing_agent', 'overstock_multiplier', '4'::jsonb),

('logistics_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('logistics_agent', 'max_items_per_run', '10'::jsonb),
('logistics_agent', 'exception_after_days', '4'::jsonb)
ON CONFLICT (agent_name, config_key) DO UPDATE SET config_value = EXCLUDED.config_value, updated_at = now();
