-- ============================================================================
-- 005 - Core configuration & reference seed data
-- Depends on: 001, 002, 003, 004
-- Idempotent: ON CONFLICT ... DO NOTHING so re-running will not duplicate rows.
-- Fixed UUIDs keep cross-references stable across runs.
-- ============================================================================

-- --- store_config -----------------------------------------------------------
INSERT INTO store_config (config_key, config_value, description)
VALUES
    ('store_name',              '"TechBazaar"',     'Store display name'),
    ('po_auto_approve_limit',   '5000',             'Purchase orders above this total (INR) require human approval'),
    ('refund_auto_approve_limit','100',            'Refunds above this amount require human approval'),
    ('price_change_max_pct',    '15',              'Maximum single price-change percentage allowed')
ON CONFLICT (config_key) DO NOTHING;

-- --- warehouses -------------------------------------------------------------
INSERT INTO warehouses (warehouse_id, name, location, region, is_active)
VALUES
    ('10000000-0000-0000-0000-000000000001', 'Mumbai Hub',   'Mumbai, MH', 'West',   TRUE),
    ('10000000-0000-0000-0000-000000000002', 'Delhi Hub',    'Delhi, DL',  'North',  TRUE),
    ('10000000-0000-0000-0000-000000000003', 'Bangalore Hub','Bangalore, KA','South', TRUE)
ON CONFLICT (warehouse_id) DO NOTHING;

-- --- admin user -------------------------------------------------------------
-- Bootstrap admin. The bcrypt hash below is for the demo password 'trucart-demo'
-- (see README). Generate your own with:
--   python -c "import bcrypt; print(bcrypt.hashpw(b'PW', bcrypt.gensalt(rounds=10)).decode())"
INSERT INTO users (user_id, email, full_name, password_hash, role, is_active)
VALUES
    ('20000000-0000-0000-0000-000000000001',
     'admin@techbazaar.local',
     'System Admin',
     '$2b$10$W4ZCcv99JUNlBJMJkn6XP.gW/nreHceG7.s/L6hZSD6mXBPFvtiF.',
     'admin',
     TRUE)
ON CONFLICT (user_id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    password_hash = EXCLUDED.password_hash,
    role = EXCLUDED.role,
    is_active = EXCLUDED.is_active;