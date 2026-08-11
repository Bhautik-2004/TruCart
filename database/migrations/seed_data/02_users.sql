-- users (1 row)
-- Single admin user (bootstrap from 005_seed_data.sql).
-----------------------------------------------------------------------------
INSERT INTO users (user_id, auth_user_id, email, full_name, password_hash, role, is_active, created_at, updated_at) VALUES
('20000000-0000-0000-0000-000000000001', NULL, 'admin@techbazaar.local', 'System Admin', '$2a$10$placeholder_replace_me_hash_value', 'admin', TRUE, '2023-03-26 22:33:20+05:30', '2023-03-26 22:33:20+05:30')
ON CONFLICT (user_id) DO NOTHING;
