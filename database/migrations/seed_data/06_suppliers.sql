-- suppliers (8 rows)
-- ----------------------------------------------------------------------------
INSERT INTO suppliers (supplier_id, name, contact_email, contact_phone, lead_time_days, rating, is_active, created_at) VALUES
('32000000-0000-0000-0000-000000000001', 'Redington India', 'sales@redingtonindia.example.com', '+91-9746317213', 7, 4.6, TRUE, '2024-12-01 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000002', 'Ingram Micro India', 'sales@ingrammicroind.example.com', '+91-7478163327', 5, 4.4, TRUE, '2024-12-09 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000003', 'Rashi Peripherals', 'sales@rashiperiphera.example.com', '+91-7107420369', 10, 4.1, TRUE, '2024-12-17 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000004', 'Neoteric Infomatique', 'sales@neotericinfoma.example.com', '+91-8181241943', 6, 4.3, TRUE, '2024-12-25 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000005', 'Supertron Electronics', 'sales@supertronelect.example.com', '+91-8051802512', 12, 3.9, TRUE, '2025-01-02 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000006', 'Priya Limited', 'sales@priyalimited.example.com', '+91-7958682846', 9, 4.0, TRUE, '2025-01-10 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000007', 'Compuage Infocom', 'sales@compuageinfoco.example.com', '+91-7599310825', 8, 4.2, TRUE, '2025-01-18 10:00:00+05:30'),
('32000000-0000-0000-0000-000000000008', 'Savex Technologies', 'sales@savextechnolog.example.com', '+91-7440213415', 14, 3.7, TRUE, '2025-01-26 10:00:00+05:30')
ON CONFLICT (supplier_id) DO NOTHING;
