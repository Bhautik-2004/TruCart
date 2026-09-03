-- ============================================================================
-- 014 - Reconfigure pricing_agent (cost/margin-driven) + logistics dwell time
-- Depends on: 004, 008
--
-- The pricing agent was reworked from competitor-price matching to reasoning
-- about our own economics: the unit cost we last actually paid (latest purchase
-- order), the gross margin that implies versus a target margin, days of stock
-- cover given recent sales, and how long since the price last moved. The old
-- competitor-era key (competitor_drop_escalate_pct) is dropped; new keys the
-- reworked code reads are seeded here. Approval thresholds stay in store_config
-- (price_change_max_pct) and are not duplicated.
--
-- logistics_agent gains transit_hours: the minimum time a shipment dwells in a
-- lifecycle state before the agent advances it, so agent-created shipments walk
-- label_created -> in_transit -> out_for_delivery -> delivered over successive
-- runs instead of jumping unconditionally on every run.
-- ============================================================================

DELETE FROM agent_config WHERE agent_name = 'pricing_agent';

INSERT INTO agent_config (agent_name, config_key, config_value) VALUES
('pricing_agent', 'model_name',           '"qwen2.5:7b"'::jsonb),
('pricing_agent', 'max_items_per_run',    '10'::jsonb),
('pricing_agent', 'min_margin_pct',       '10'::jsonb),
('pricing_agent', 'target_margin_pct',    '30'::jsonb),
('pricing_agent', 'demand_window_days',   '90'::jsonb),
('pricing_agent', 'overstock_cover_days', '60'::jsonb),
('pricing_agent', 'cost_move_alert_pct',  '5'::jsonb),
('pricing_agent', 'dedup_window_minutes', '60'::jsonb),

('logistics_agent', 'transit_hours', '24'::jsonb)
ON CONFLICT (agent_name, config_key) DO UPDATE SET config_value = EXCLUDED.config_value, updated_at = now();
