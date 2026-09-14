-- warehouses (6 rows) — the 3 hubs in 005_seed_data.sql plus a few more.
-- ----------------------------------------------------------------------------
INSERT INTO warehouses (warehouse_id, name, location, region, is_active, created_at) VALUES
('10000000-0000-0000-0000-000000000001', 'Mumbai Hub', 'Mumbai, MH', 'West', TRUE, '2024-10-12 10:00:00+05:30'),
('10000000-0000-0000-0000-000000000002', 'Delhi Hub', 'Delhi, DL', 'North', TRUE, '2024-10-22 10:00:00+05:30'),
('10000000-0000-0000-0000-000000000003', 'Bangalore Hub', 'Bangalore, KA', 'South', TRUE, '2024-11-01 10:00:00+05:30'),
('10000000-0000-0000-0000-000000000004', 'Chennai Hub', 'Chennai, TN', 'South', TRUE, '2024-11-11 10:00:00+05:30'),
('10000000-0000-0000-0000-000000000005', 'Pune Hub', 'Pune, MH', 'West', TRUE, '2024-11-21 10:00:00+05:30'),
('10000000-0000-0000-0000-000000000006', 'Kolkata Hub', 'Kolkata, WB', 'East', TRUE, '2024-12-01 10:00:00+05:30')
ON CONFLICT (warehouse_id) DO NOTHING;
