-- ============================================================================
-- 008 - Reseed agent_config for the agentic pipeline (inventory/pricing/support)
-- Depends on: 004
--
-- The original seed data for these 3 agents was fuzzed/randomized (duplicate
-- keys with .2/.3/.4/.5 suffixes, near-random values) and isn't usable by the
-- actual agent code. Replace it with a small canonical set of operational
-- settings per agent. Approval THRESHOLDS (po_auto_approve_limit,
-- refund_auto_approve_limit, price_change_max_pct) are intentionally not
-- duplicated here -- agents read those directly from store_config, which
-- already has clean values.
-- ============================================================================

DELETE FROM agent_config WHERE agent_name IN ('inventory_agent', 'pricing_agent', 'support_agent');

INSERT INTO agent_config (agent_name, config_key, config_value) VALUES
('inventory_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('inventory_agent', 'max_items_per_run', '5'::jsonb),

('pricing_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('pricing_agent', 'max_items_per_run', '10'::jsonb),
('pricing_agent', 'min_margin_pct', '10'::jsonb),
('pricing_agent', 'competitor_drop_escalate_pct', '20'::jsonb),

('support_agent', 'model_name', '"qwen2.5:7b"'::jsonb),
('support_agent', 'max_items_per_run', '5'::jsonb),
('support_agent', 'auto_resolve_confidence_min', '0.75'::jsonb)
ON CONFLICT (agent_name, config_key) DO UPDATE SET config_value = EXCLUDED.config_value, updated_at = now();
