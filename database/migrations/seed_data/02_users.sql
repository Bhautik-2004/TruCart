-- users (1 row)
-- Single admin user (bootstrap from 005_seed_data.sql).
-----------------------------------------------------------------------------
-- bcrypt hash is for demo password 'trucart-demo' (see README).
INSERT INTO users (user_id, auth_user_id, email, full_name, password_hash, role, is_active, created_at, updated_at) VALUES
('20000000-0000-0000-0000-000000000001', NULL, 'admin@techbazaar.local', 'System Admin', '$2b$10$W4ZCcv99JUNlBJMJkn6XP.gW/nreHceG7.s/L6hZSD6mXBPFvtiF.', 'admin', TRUE, '2023-03-26 22:33:20+05:30', '2023-03-26 22:33:20+05:30')
ON CONFLICT (user_id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    password_hash = EXCLUDED.password_hash,
    role = EXCLUDED.role,
    is_active = EXCLUDED.is_active,
    updated_at = now();
