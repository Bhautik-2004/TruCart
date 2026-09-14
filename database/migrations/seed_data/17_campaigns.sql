-- campaigns (12 rows)
-- ----------------------------------------------------------------------------
INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3d000000-0000-0000-0000-000000000001', 'Festive Electronics Sale', 'email', 'regular', 'active', 'Festive Electronics Sale — don''t miss out!', 'Hi customer,

Festive Electronics Sale is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 338.18, 222.89, 'marketing_agent', NULL, '2026-03-04 08:30:05+05:30', '2026-03-04 14:30:05+05:30', '2026-03-04 08:30:05+05:30'),
('3d000000-0000-0000-0000-000000000002', 'Diwali Dhamaka — Laptops & Tablets', 'email', 'vip', 'active', 'Diwali Dhamaka — Laptops & Tablets — don''t miss out!', 'Hi customer,

Diwali Dhamaka — Laptops & Tablets is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 182.39, 122.09, 'marketing_agent', NULL, '2026-08-13 21:12:40+05:30', '2026-08-14 03:12:40+05:30', '2026-08-13 21:12:40+05:30'),
('3d000000-0000-0000-0000-000000000003', 'Weekend Flash Sale — Audio', 'social', 'regular', 'active', 'Weekend Flash Sale — Audio — don''t miss out!', 'Hi customer,

Weekend Flash Sale — Audio is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 383.66, 241.76, 'marketing_agent', NULL, '2026-08-04 08:54:49+05:30', '2026-08-04 14:54:49+05:30', '2026-08-04 08:54:49+05:30'),
('3d000000-0000-0000-0000-000000000004', 'New Year Clearance', 'email', 'standard', 'active', 'New Year Clearance — don''t miss out!', 'Hi customer,

New Year Clearance is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 331.18, 260.17, 'marketing_agent', NULL, '2026-03-05 16:06:28+05:30', '2026-03-05 22:06:28+05:30', '2026-03-05 16:06:28+05:30'),
('3d000000-0000-0000-0000-000000000005', 'Monsoon Accessories Bundle', 'social', 'regular', 'archived', 'Monsoon Accessories Bundle — don''t miss out!', 'Hi customer,

Monsoon Accessories Bundle is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 311.79, 272.02, 'marketing_agent', NULL, '2026-05-18 07:21:58+05:30', '2026-05-18 13:21:58+05:30', '2026-05-18 07:21:58+05:30'),
('3d000000-0000-0000-0000-000000000006', 'Back to College — Laptops', 'email', 'standard', 'archived', 'Back to College — Laptops — don''t miss out!', 'Hi customer,

Back to College — Laptops is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 337.2, 335.38, 'marketing_agent', NULL, '2026-03-18 19:51:37+05:30', '2026-03-19 01:51:37+05:30', '2026-03-18 19:51:37+05:30'),
('3d000000-0000-0000-0000-000000000007', 'Smartwatch Spotlight', 'email', 'vip', 'draft', 'Smartwatch Spotlight — don''t miss out!', 'Hi customer,

Smartwatch Spotlight is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 468.39, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-03 00:10:13+05:30'),
('3d000000-0000-0000-0000-000000000008', 'Gaming Console Restock Alert', 'social', 'regular', 'draft', 'Gaming Console Restock Alert — don''t miss out!', 'Hi customer,

Gaming Console Restock Alert is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 255.91, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-04 08:24:23+05:30'),
('3d000000-0000-0000-0000-000000000009', 'Summer Cooling Gadgets', 'email', 'regular', 'archived', 'Summer Cooling Gadgets — don''t miss out!', 'Hi customer,

Summer Cooling Gadgets is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 332.55, 305.46, 'marketing_agent', NULL, '2026-06-05 07:43:11+05:30', '2026-06-05 13:43:11+05:30', '2026-06-05 07:43:11+05:30'),
('3d000000-0000-0000-0000-00000000000a', 'Republic Day Sale', 'email', 'standard', 'active', 'Republic Day Sale — don''t miss out!', 'Hi customer,

Republic Day Sale is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 220.78, 139.02, 'marketing_agent', NULL, '2026-05-13 01:07:33+05:30', '2026-05-13 07:07:33+05:30', '2026-05-13 01:07:33+05:30'),
('3d000000-0000-0000-0000-00000000000b', 'Camera & Drone Showcase', 'social', 'vip', 'draft', 'Camera & Drone Showcase — don''t miss out!', 'Hi customer,

Camera & Drone Showcase is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 95.04, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-06 16:27:15+05:30'),
('3d000000-0000-0000-0000-00000000000c', 'Networking Gear Upgrade Week', 'email', 'regular', 'archived', 'Networking Gear Upgrade Week — don''t miss out!', 'Hi customer,

Networking Gear Upgrade Week is live now. Check out our latest deals across the TechBazaar catalogue.

Team TechBazaar', 194.83, 167.14, 'marketing_agent', NULL, '2026-06-24 08:33:23+05:30', '2026-06-24 14:33:23+05:30', '2026-06-24 08:33:23+05:30')
ON CONFLICT (campaign_id) DO NOTHING;
