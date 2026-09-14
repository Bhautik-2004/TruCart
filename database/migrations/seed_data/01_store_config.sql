-- store_config (lean shipping-zone set; core 4 keys are in 005_seed_data.sql,
-- the 8 ledger_* keys are added by 016_ledger.sql)
-- ----------------------------------------------------------------------------
INSERT INTO store_config (config_key, config_value, description) VALUES
('shipping.zone.1.base_rate', 49, 'Base shipping rate (INR) for shipping zone 1'),
('shipping.zone.1.free_threshold', 999, 'Order value for free shipping in zone 1'),
('shipping.zone.1.cod_allowed', TRUE, 'Whether COD is allowed in zone 1'),
('shipping.zone.1.cutoff_hours', 18, 'Same-day dispatch cutoff hour for zone 1'),
('shipping.zone.1.max_weight_kg', 25, 'Max package weight (kg) in zone 1'),
('shipping.zone.1.rate_per_kg', 12, 'Extra charge per kg beyond base in zone 1'),
('shipping.zone.1.sla_days', 3, 'Service-level commitment (days) for zone 1'),
('shipping.zone.2.base_rate', 69, 'Base shipping rate (INR) for shipping zone 2'),
('shipping.zone.2.free_threshold', 999, 'Order value for free shipping in zone 2'),
('shipping.zone.2.cod_allowed', TRUE, 'Whether COD is allowed in zone 2'),
('shipping.zone.2.cutoff_hours', 18, 'Same-day dispatch cutoff hour for zone 2'),
('shipping.zone.2.max_weight_kg', 25, 'Max package weight (kg) in zone 2'),
('shipping.zone.2.rate_per_kg', 12, 'Extra charge per kg beyond base in zone 2'),
('shipping.zone.2.sla_days', 5, 'Service-level commitment (days) for zone 2')
ON CONFLICT (config_key) DO NOTHING;
