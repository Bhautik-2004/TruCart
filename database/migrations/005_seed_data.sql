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
-- NOTE: Password hash below is a PLACEHOLDER. Staff typically sign in through
-- Supabase Auth (auth.users); this seeded row is a bootstrap admin record.
-- Replace with a real hash for the actual hashing scheme before using in prod.
INSERT INTO users (user_id, email, full_name, password_hash, role, is_active)
VALUES
    ('20000000-0000-0000-0000-000000000001',
     'admin@techbazaar.local',
     'System Admin',
     '$2a$10$placeholder_replace_me_hash_value',
     'admin',
     TRUE)
ON CONFLICT (user_id) DO NOTHING;