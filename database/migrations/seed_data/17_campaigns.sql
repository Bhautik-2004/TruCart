-- campaigns (1000 rows)
-- Marketing campaigns. `approved_by` is NULL for drafts/pending.
-- ----------------------------------------------------------------------------
INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000001', 'Festive Electronics Sale — social / regular (001)', 'social', 'regular', 'draft', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 621831.29, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-25 23:01:59+05:30'),
('3D000000-0000-0000-0000-000000000002', 'Weekend Flash Deal — re_engagement / at_risk (002)', 're_engagement', 'at_risk', 'draft', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-25 13:06:40+05:30'),
('3D000000-0000-0000-0000-000000000003', 'VIP Early Access Drop — re_engagement / regular (003)', 're_engagement', 'regular', 'draft', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-15 21:58:09+05:30'),
('3D000000-0000-0000-0000-000000000004', 'New Arrivals Spotlight — re_engagement / regular (004)', 're_engagement', 'regular', 'draft', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-19 23:16:24+05:30'),
('3D000000-0000-0000-0000-000000000005', 'Clearance Blast — email / standard (005)', 'email', 'standard', 'draft', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-14 10:55:22+05:30'),
('3D000000-0000-0000-0000-000000000006', 'Re-engagement Comeback Offer — social / regular (006)', 'social', 'regular', 'draft', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 839705.79, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-03 16:23:43+05:30'),
('3D000000-0000-0000-0000-000000000007', 'Diwali Mega Sale — email / at_risk (007)', 'email', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 220951.84, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-02 01:59:23+05:30'),
('3D000000-0000-0000-0000-000000000008', 'Monsoon Gadget Deals — email / vip (008)', 'email', 'vip', 'draft', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-30 23:10:39+05:30'),
('3D000000-0000-0000-0000-000000000009', 'Loyalty Reward Campaign — social / regular (009)', 'social', 'regular', 'draft', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 507091.73, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-08 00:25:26+05:30'),
('3D000000-0000-0000-0000-00000000000A', 'Cart Abandonment Winback — social / at_risk (010)', 'social', 'at_risk', 'draft', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-09 04:13:22+05:30'),
('3D000000-0000-0000-0000-00000000000B', 'Festive Audio Week — re_engagement / vip (011)', 're_engagement', 'vip', 'draft', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 761286.19, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-06 11:31:40+05:30'),
('3D000000-0000-0000-0000-00000000000C', 'Back-to-Office Tech Drive — email / standard (012)', 'email', 'standard', 'draft', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 208817.12, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-01 12:53:16+05:30'),
('3D000000-0000-0000-0000-00000000000D', 'Festive Electronics Sale — social / all (013)', 'social', 'all', 'draft', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 282612.92, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-11 09:58:26+05:30'),
('3D000000-0000-0000-0000-00000000000E', 'Weekend Flash Deal — social / regular (014)', 'social', 'regular', 'draft', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-14 11:04:25+05:30'),
('3D000000-0000-0000-0000-00000000000F', 'VIP Early Access Drop — email / at_risk (015)', 'email', 'at_risk', 'draft', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 694505.64, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-07 06:34:29+05:30'),
('3D000000-0000-0000-0000-000000000010', 'New Arrivals Spotlight — email / at_risk (016)', 'email', 'at_risk', 'draft', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 361294.11, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-26 17:16:36+05:30'),
('3D000000-0000-0000-0000-000000000011', 'Clearance Blast — email / regular (017)', 'email', 'regular', 'draft', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-08 09:40:32+05:30'),
('3D000000-0000-0000-0000-000000000012', 'Re-engagement Comeback Offer — re_engagement / at_risk (018)', 're_engagement', 'at_risk', 'draft', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 780545.95, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-24 20:56:57+05:30'),
('3D000000-0000-0000-0000-000000000013', 'Diwali Mega Sale — re_engagement / at_risk (019)', 're_engagement', 'at_risk', 'draft', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 224102.38, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-25 05:34:27+05:30'),
('3D000000-0000-0000-0000-000000000014', 'Monsoon Gadget Deals — social / regular (020)', 'social', 'regular', 'draft', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 349426.99, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-31 02:48:57+05:30'),
('3D000000-0000-0000-0000-000000000015', 'Loyalty Reward Campaign — social / standard (021)', 'social', 'standard', 'draft', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 893797.08, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-31 16:47:27+05:30'),
('3D000000-0000-0000-0000-000000000016', 'Cart Abandonment Winback — email / at_risk (022)', 'email', 'at_risk', 'draft', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-05 23:55:31+05:30'),
('3D000000-0000-0000-0000-000000000017', 'Festive Audio Week — social / regular (023)', 'social', 'regular', 'draft', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 486617.55, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-13 18:43:35+05:30'),
('3D000000-0000-0000-0000-000000000018', 'Back-to-Office Tech Drive — re_engagement / vip (024)', 're_engagement', 'vip', 'draft', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-21 20:20:55+05:30'),
('3D000000-0000-0000-0000-000000000019', 'Festive Electronics Sale — email / vip (025)', 'email', 'vip', 'draft', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 437335.55, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-04 17:29:36+05:30'),
('3D000000-0000-0000-0000-00000000001A', 'Weekend Flash Deal — email / regular (026)', 'email', 'regular', 'draft', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 455611.22, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-16 11:51:16+05:30'),
('3D000000-0000-0000-0000-00000000001B', 'VIP Early Access Drop — clearance / all (027)', 'clearance', 'all', 'draft', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-26 19:16:42+05:30'),
('3D000000-0000-0000-0000-00000000001C', 'New Arrivals Spotlight — re_engagement / regular (028)', 're_engagement', 'regular', 'draft', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-26 04:00:06+05:30'),
('3D000000-0000-0000-0000-00000000001D', 'Clearance Blast — re_engagement / vip (029)', 're_engagement', 'vip', 'draft', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 652823.36, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-18 13:50:45+05:30'),
('3D000000-0000-0000-0000-00000000001E', 'Re-engagement Comeback Offer — re_engagement / all (030)', 're_engagement', 'all', 'draft', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 481509.95, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-01 02:29:28+05:30'),
('3D000000-0000-0000-0000-00000000001F', 'Diwali Mega Sale — clearance / all (031)', 'clearance', 'all', 'draft', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 568658.51, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-04 21:35:38+05:30'),
('3D000000-0000-0000-0000-000000000020', 'Monsoon Gadget Deals — email / standard (032)', 'email', 'standard', 'draft', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-24 19:35:06+05:30'),
('3D000000-0000-0000-0000-000000000021', 'Loyalty Reward Campaign — re_engagement / regular (033)', 're_engagement', 'regular', 'draft', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 782914.82, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-06 12:20:39+05:30'),
('3D000000-0000-0000-0000-000000000022', 'Cart Abandonment Winback — social / all (034)', 'social', 'all', 'draft', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 452628.96, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-10 17:42:37+05:30'),
('3D000000-0000-0000-0000-000000000023', 'Festive Audio Week — clearance / regular (035)', 'clearance', 'regular', 'draft', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-09 13:54:36+05:30'),
('3D000000-0000-0000-0000-000000000024', 'Back-to-Office Tech Drive — clearance / standard (036)', 'clearance', 'standard', 'draft', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 100401.21, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-23 15:04:27+05:30'),
('3D000000-0000-0000-0000-000000000025', 'Festive Electronics Sale — re_engagement / regular (037)', 're_engagement', 'regular', 'draft', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 529963.93, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-19 16:20:12+05:30'),
('3D000000-0000-0000-0000-000000000026', 'Weekend Flash Deal — re_engagement / at_risk (038)', 're_engagement', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-12 14:52:51+05:30'),
('3D000000-0000-0000-0000-000000000027', 'VIP Early Access Drop — re_engagement / at_risk (039)', 're_engagement', 'at_risk', 'draft', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 335258.88, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-23 11:04:04+05:30'),
('3D000000-0000-0000-0000-000000000028', 'New Arrivals Spotlight — social / at_risk (040)', 'social', 'at_risk', 'draft', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-09 23:14:26+05:30'),
('3D000000-0000-0000-0000-000000000029', 'Clearance Blast — email / regular (041)', 'email', 'regular', 'draft', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 100330.23, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-24 04:49:20+05:30'),
('3D000000-0000-0000-0000-00000000002A', 'Re-engagement Comeback Offer — clearance / vip (042)', 'clearance', 'vip', 'draft', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 399790.13, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-21 12:09:43+05:30'),
('3D000000-0000-0000-0000-00000000002B', 'Diwali Mega Sale — clearance / at_risk (043)', 'clearance', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 251220.92, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-10 05:21:11+05:30'),
('3D000000-0000-0000-0000-00000000002C', 'Monsoon Gadget Deals — social / standard (044)', 'social', 'standard', 'draft', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 84130.57, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-10 14:47:54+05:30'),
('3D000000-0000-0000-0000-00000000002D', 'Loyalty Reward Campaign — email / at_risk (045)', 'email', 'at_risk', 'draft', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 840023.02, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-10 16:47:47+05:30'),
('3D000000-0000-0000-0000-00000000002E', 'Cart Abandonment Winback — email / vip (046)', 'email', 'vip', 'draft', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 760347.43, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-30 22:10:42+05:30'),
('3D000000-0000-0000-0000-00000000002F', 'Festive Audio Week — email / all (047)', 'email', 'all', 'draft', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 768593.07, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-21 11:18:30+05:30'),
('3D000000-0000-0000-0000-000000000030', 'Back-to-Office Tech Drive — email / at_risk (048)', 'email', 'at_risk', 'draft', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-13 08:43:20+05:30'),
('3D000000-0000-0000-0000-000000000031', 'Festive Electronics Sale — email / regular (049)', 'email', 'regular', 'draft', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-12 16:51:23+05:30'),
('3D000000-0000-0000-0000-000000000032', 'Weekend Flash Deal — clearance / at_risk (050)', 'clearance', 'at_risk', 'draft', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 145517.19, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-21 04:58:06+05:30'),
('3D000000-0000-0000-0000-000000000033', 'VIP Early Access Drop — social / regular (051)', 'social', 'regular', 'draft', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 555670.78, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-09 02:59:34+05:30'),
('3D000000-0000-0000-0000-000000000034', 'New Arrivals Spotlight — social / regular (052)', 'social', 'regular', 'draft', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 425571.89, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-19 01:45:56+05:30'),
('3D000000-0000-0000-0000-000000000035', 'Clearance Blast — email / standard (053)', 'email', 'standard', 'draft', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 415986.21, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-27 09:06:11+05:30'),
('3D000000-0000-0000-0000-000000000036', 'Re-engagement Comeback Offer — email / vip (054)', 'email', 'vip', 'draft', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-03 10:56:28+05:30'),
('3D000000-0000-0000-0000-000000000037', 'Diwali Mega Sale — re_engagement / standard (055)', 're_engagement', 'standard', 'draft', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 399486.9, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-01 05:19:48+05:30'),
('3D000000-0000-0000-0000-000000000038', 'Monsoon Gadget Deals — social / vip (056)', 'social', 'vip', 'draft', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 523818.79, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-06 01:28:42+05:30'),
('3D000000-0000-0000-0000-000000000039', 'Loyalty Reward Campaign — clearance / vip (057)', 'clearance', 'vip', 'draft', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 823471.23, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-17 00:00:33+05:30'),
('3D000000-0000-0000-0000-00000000003A', 'Cart Abandonment Winback — social / vip (058)', 'social', 'vip', 'draft', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 71940.05, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-17 10:43:19+05:30'),
('3D000000-0000-0000-0000-00000000003B', 'Festive Audio Week — clearance / standard (059)', 'clearance', 'standard', 'draft', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 274859.64, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-30 02:26:03+05:30'),
('3D000000-0000-0000-0000-00000000003C', 'Back-to-Office Tech Drive — re_engagement / regular (060)', 're_engagement', 'regular', 'draft', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 894480.8, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-04 20:18:05+05:30'),
('3D000000-0000-0000-0000-00000000003D', 'Festive Electronics Sale — clearance / regular (061)', 'clearance', 'regular', 'draft', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 818075.02, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-28 03:41:12+05:30'),
('3D000000-0000-0000-0000-00000000003E', 'Weekend Flash Deal — re_engagement / all (062)', 're_engagement', 'all', 'draft', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 659204.83, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-03 05:40:50+05:30'),
('3D000000-0000-0000-0000-00000000003F', 'VIP Early Access Drop — email / at_risk (063)', 'email', 'at_risk', 'draft', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 449843.48, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-30 23:14:44+05:30'),
('3D000000-0000-0000-0000-000000000040', 'New Arrivals Spotlight — email / standard (064)', 'email', 'standard', 'draft', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 86819.62, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-07 07:16:45+05:30'),
('3D000000-0000-0000-0000-000000000041', 'Clearance Blast — clearance / at_risk (065)', 'clearance', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-08 19:25:39+05:30'),
('3D000000-0000-0000-0000-000000000042', 'Re-engagement Comeback Offer — email / at_risk (066)', 'email', 'at_risk', 'draft', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-18 22:42:33+05:30'),
('3D000000-0000-0000-0000-000000000043', 'Diwali Mega Sale — email / regular (067)', 'email', 'regular', 'draft', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-12 07:52:12+05:30'),
('3D000000-0000-0000-0000-000000000044', 'Monsoon Gadget Deals — email / standard (068)', 'email', 'standard', 'draft', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 770220.02, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-24 20:24:57+05:30'),
('3D000000-0000-0000-0000-000000000045', 'Loyalty Reward Campaign — re_engagement / at_risk (069)', 're_engagement', 'at_risk', 'draft', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-04 17:26:42+05:30'),
('3D000000-0000-0000-0000-000000000046', 'Cart Abandonment Winback — email / vip (070)', 'email', 'vip', 'draft', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 289251.67, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-24 10:11:32+05:30'),
('3D000000-0000-0000-0000-000000000047', 'Festive Audio Week — social / standard (071)', 'social', 'standard', 'draft', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-15 20:16:07+05:30'),
('3D000000-0000-0000-0000-000000000048', 'Back-to-Office Tech Drive — social / standard (072)', 'social', 'standard', 'draft', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 504936.17, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-13 23:31:16+05:30'),
('3D000000-0000-0000-0000-000000000049', 'Festive Electronics Sale — clearance / at_risk (073)', 'clearance', 'at_risk', 'draft', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 412005.12, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-12 20:31:59+05:30'),
('3D000000-0000-0000-0000-00000000004A', 'Weekend Flash Deal — email / all (074)', 'email', 'all', 'draft', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 42623.13, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-17 13:24:07+05:30'),
('3D000000-0000-0000-0000-00000000004B', 'VIP Early Access Drop — clearance / standard (075)', 'clearance', 'standard', 'draft', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 26409.31, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-14 20:51:13+05:30'),
('3D000000-0000-0000-0000-00000000004C', 'New Arrivals Spotlight — re_engagement / regular (076)', 're_engagement', 'regular', 'draft', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-03 00:26:39+05:30'),
('3D000000-0000-0000-0000-00000000004D', 'Clearance Blast — email / standard (077)', 'email', 'standard', 'draft', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 677007.84, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-17 14:22:25+05:30'),
('3D000000-0000-0000-0000-00000000004E', 'Re-engagement Comeback Offer — social / vip (078)', 'social', 'vip', 'draft', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 95648.52, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-31 02:18:31+05:30'),
('3D000000-0000-0000-0000-00000000004F', 'Diwali Mega Sale — social / all (079)', 'social', 'all', 'draft', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-31 14:03:51+05:30'),
('3D000000-0000-0000-0000-000000000050', 'Monsoon Gadget Deals — social / all (080)', 'social', 'all', 'draft', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 422883.58, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-13 06:00:34+05:30'),
('3D000000-0000-0000-0000-000000000051', 'Loyalty Reward Campaign — social / standard (081)', 'social', 'standard', 'draft', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 865084.73, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-27 01:16:30+05:30'),
('3D000000-0000-0000-0000-000000000052', 'Cart Abandonment Winback — email / vip (082)', 'email', 'vip', 'draft', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 594393.32, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-05 11:36:38+05:30'),
('3D000000-0000-0000-0000-000000000053', 'Festive Audio Week — clearance / at_risk (083)', 'clearance', 'at_risk', 'draft', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-14 19:01:18+05:30'),
('3D000000-0000-0000-0000-000000000054', 'Back-to-Office Tech Drive — social / regular (084)', 'social', 'regular', 'draft', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 615778.58, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-16 23:41:53+05:30'),
('3D000000-0000-0000-0000-000000000055', 'Festive Electronics Sale — social / vip (085)', 'social', 'vip', 'draft', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 442380.83, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-06 17:07:20+05:30'),
('3D000000-0000-0000-0000-000000000056', 'Weekend Flash Deal — clearance / regular (086)', 'clearance', 'regular', 'draft', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-08 13:52:09+05:30'),
('3D000000-0000-0000-0000-000000000057', 'VIP Early Access Drop — clearance / vip (087)', 'clearance', 'vip', 'draft', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-14 22:09:36+05:30'),
('3D000000-0000-0000-0000-000000000058', 'New Arrivals Spotlight — clearance / regular (088)', 'clearance', 'regular', 'draft', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 320942.68, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-07 06:06:47+05:30'),
('3D000000-0000-0000-0000-000000000059', 'Clearance Blast — social / at_risk (089)', 'social', 'at_risk', 'draft', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 183977.45, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-07 10:38:20+05:30'),
('3D000000-0000-0000-0000-00000000005A', 'Re-engagement Comeback Offer — social / regular (090)', 'social', 'regular', 'draft', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-04 21:34:24+05:30'),
('3D000000-0000-0000-0000-00000000005B', 'Diwali Mega Sale — email / all (091)', 'email', 'all', 'draft', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-01 05:13:03+05:30'),
('3D000000-0000-0000-0000-00000000005C', 'Monsoon Gadget Deals — social / regular (092)', 'social', 'regular', 'draft', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-26 15:23:18+05:30'),
('3D000000-0000-0000-0000-00000000005D', 'Loyalty Reward Campaign — email / standard (093)', 'email', 'standard', 'draft', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 250452.95, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-06 12:36:13+05:30'),
('3D000000-0000-0000-0000-00000000005E', 'Cart Abandonment Winback — email / regular (094)', 'email', 'regular', 'draft', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-04 01:00:34+05:30'),
('3D000000-0000-0000-0000-00000000005F', 'Festive Audio Week — re_engagement / standard (095)', 're_engagement', 'standard', 'draft', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 777510.8, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-04 07:08:36+05:30'),
('3D000000-0000-0000-0000-000000000060', 'Back-to-Office Tech Drive — social / at_risk (096)', 'social', 'at_risk', 'draft', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 716531.54, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-19 05:41:31+05:30'),
('3D000000-0000-0000-0000-000000000061', 'Festive Electronics Sale — social / at_risk (097)', 'social', 'at_risk', 'draft', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 745677.25, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-26 01:42:58+05:30'),
('3D000000-0000-0000-0000-000000000062', 'Weekend Flash Deal — re_engagement / vip (098)', 're_engagement', 'vip', 'draft', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 167108.03, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-16 17:46:36+05:30'),
('3D000000-0000-0000-0000-000000000063', 'VIP Early Access Drop — re_engagement / all (099)', 're_engagement', 'all', 'draft', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-04 06:17:33+05:30'),
('3D000000-0000-0000-0000-000000000064', 'New Arrivals Spotlight — email / standard (100)', 'email', 'standard', 'draft', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 522314.21, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-09 16:10:07+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000065', 'Clearance Blast — clearance / standard (101)', 'clearance', 'standard', 'draft', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 550959.9, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-03 04:55:54+05:30'),
('3D000000-0000-0000-0000-000000000066', 'Re-engagement Comeback Offer — email / standard (102)', 'email', 'standard', 'draft', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-18 11:50:57+05:30'),
('3D000000-0000-0000-0000-000000000067', 'Diwali Mega Sale — social / at_risk (103)', 'social', 'at_risk', 'draft', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 60137.06, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-19 15:00:03+05:30'),
('3D000000-0000-0000-0000-000000000068', 'Monsoon Gadget Deals — clearance / all (104)', 'clearance', 'all', 'draft', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 337524.69, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-02 20:35:10+05:30'),
('3D000000-0000-0000-0000-000000000069', 'Loyalty Reward Campaign — clearance / vip (105)', 'clearance', 'vip', 'draft', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 769943.88, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-14 05:29:09+05:30'),
('3D000000-0000-0000-0000-00000000006A', 'Cart Abandonment Winback — re_engagement / standard (106)', 're_engagement', 'standard', 'draft', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-13 01:44:00+05:30'),
('3D000000-0000-0000-0000-00000000006B', 'Festive Audio Week — re_engagement / at_risk (107)', 're_engagement', 'at_risk', 'draft', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-22 05:10:10+05:30'),
('3D000000-0000-0000-0000-00000000006C', 'Back-to-Office Tech Drive — email / at_risk (108)', 'email', 'at_risk', 'draft', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 380519.51, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-07 04:19:41+05:30'),
('3D000000-0000-0000-0000-00000000006D', 'Festive Electronics Sale — re_engagement / vip (109)', 're_engagement', 'vip', 'draft', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 602088.93, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-20 09:54:55+05:30'),
('3D000000-0000-0000-0000-00000000006E', 'Weekend Flash Deal — social / vip (110)', 'social', 'vip', 'draft', 'Big Savings — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-01 13:04:41+05:30'),
('3D000000-0000-0000-0000-00000000006F', 'VIP Early Access Drop — social / vip (111)', 'social', 'vip', 'draft', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 605292.45, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-07 16:29:40+05:30'),
('3D000000-0000-0000-0000-000000000070', 'New Arrivals Spotlight — clearance / all (112)', 'clearance', 'all', 'draft', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 582929.56, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-17 05:00:45+05:30'),
('3D000000-0000-0000-0000-000000000071', 'Clearance Blast — email / all (113)', 'email', 'all', 'draft', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 413409.54, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-28 12:24:41+05:30'),
('3D000000-0000-0000-0000-000000000072', 'Re-engagement Comeback Offer — email / vip (114)', 'email', 'vip', 'draft', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 339495.47, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-08 23:22:05+05:30'),
('3D000000-0000-0000-0000-000000000073', 'Diwali Mega Sale — clearance / standard (115)', 'clearance', 'standard', 'draft', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 305169.12, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-23 03:34:19+05:30'),
('3D000000-0000-0000-0000-000000000074', 'Monsoon Gadget Deals — clearance / all (116)', 'clearance', 'all', 'draft', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 747225.5, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-25 20:52:37+05:30'),
('3D000000-0000-0000-0000-000000000075', 'Loyalty Reward Campaign — clearance / at_risk (117)', 'clearance', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-29 03:01:05+05:30'),
('3D000000-0000-0000-0000-000000000076', 'Cart Abandonment Winback — re_engagement / all (118)', 're_engagement', 'all', 'draft', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 99598.1, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-16 01:05:54+05:30'),
('3D000000-0000-0000-0000-000000000077', 'Festive Audio Week — re_engagement / regular (119)', 're_engagement', 'regular', 'draft', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-09 18:55:02+05:30'),
('3D000000-0000-0000-0000-000000000078', 'Back-to-Office Tech Drive — re_engagement / standard (120)', 're_engagement', 'standard', 'draft', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 704925.13, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-23 06:40:03+05:30'),
('3D000000-0000-0000-0000-000000000079', 'Festive Electronics Sale — email / all (121)', 'email', 'all', 'draft', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 635892.81, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-02 01:31:38+05:30'),
('3D000000-0000-0000-0000-00000000007A', 'Weekend Flash Deal — re_engagement / standard (122)', 're_engagement', 'standard', 'draft', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 379811.8, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-18 22:22:23+05:30'),
('3D000000-0000-0000-0000-00000000007B', 'VIP Early Access Drop — re_engagement / standard (123)', 're_engagement', 'standard', 'draft', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 603922.02, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-28 17:24:48+05:30'),
('3D000000-0000-0000-0000-00000000007C', 'New Arrivals Spotlight — social / all (124)', 'social', 'all', 'draft', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-12 04:26:43+05:30'),
('3D000000-0000-0000-0000-00000000007D', 'Clearance Blast — social / regular (125)', 'social', 'regular', 'draft', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-25 23:13:43+05:30'),
('3D000000-0000-0000-0000-00000000007E', 'Re-engagement Comeback Offer — email / vip (126)', 'email', 'vip', 'draft', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 290566.37, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-05 16:47:45+05:30'),
('3D000000-0000-0000-0000-00000000007F', 'Diwali Mega Sale — clearance / standard (127)', 'clearance', 'standard', 'draft', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 420441.2, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-29 12:03:08+05:30'),
('3D000000-0000-0000-0000-000000000080', 'Monsoon Gadget Deals — social / standard (128)', 'social', 'standard', 'draft', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-05 07:48:06+05:30'),
('3D000000-0000-0000-0000-000000000081', 'Loyalty Reward Campaign — re_engagement / at_risk (129)', 're_engagement', 'at_risk', 'draft', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 154485.4, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-14 22:12:29+05:30'),
('3D000000-0000-0000-0000-000000000082', 'Cart Abandonment Winback — email / standard (130)', 'email', 'standard', 'draft', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 684794.7, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-03 18:18:52+05:30'),
('3D000000-0000-0000-0000-000000000083', 'Festive Audio Week — clearance / regular (131)', 'clearance', 'regular', 'draft', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-20 06:12:44+05:30'),
('3D000000-0000-0000-0000-000000000084', 'Back-to-Office Tech Drive — social / at_risk (132)', 'social', 'at_risk', 'draft', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 888867.71, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-25 11:08:14+05:30'),
('3D000000-0000-0000-0000-000000000085', 'Festive Electronics Sale — re_engagement / vip (133)', 're_engagement', 'vip', 'draft', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 28596.87, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-06 14:39:55+05:30'),
('3D000000-0000-0000-0000-000000000086', 'Weekend Flash Deal — re_engagement / all (134)', 're_engagement', 'all', 'draft', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 354860.69, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-13 08:21:47+05:30'),
('3D000000-0000-0000-0000-000000000087', 'VIP Early Access Drop — social / vip (135)', 'social', 'vip', 'draft', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-19 09:17:29+05:30'),
('3D000000-0000-0000-0000-000000000088', 'New Arrivals Spotlight — clearance / standard (136)', 'clearance', 'standard', 'draft', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 733997.97, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-18 04:17:14+05:30'),
('3D000000-0000-0000-0000-000000000089', 'Clearance Blast — re_engagement / standard (137)', 're_engagement', 'standard', 'draft', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 204033.25, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-29 14:41:00+05:30'),
('3D000000-0000-0000-0000-00000000008A', 'Re-engagement Comeback Offer — clearance / vip (138)', 'clearance', 'vip', 'draft', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-16 07:24:30+05:30'),
('3D000000-0000-0000-0000-00000000008B', 'Diwali Mega Sale — social / all (139)', 'social', 'all', 'draft', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-18 22:16:36+05:30'),
('3D000000-0000-0000-0000-00000000008C', 'Monsoon Gadget Deals — social / regular (140)', 'social', 'regular', 'draft', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 603622.16, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-02 17:18:43+05:30'),
('3D000000-0000-0000-0000-00000000008D', 'Loyalty Reward Campaign — re_engagement / regular (141)', 're_engagement', 'regular', 'draft', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-08 21:20:34+05:30'),
('3D000000-0000-0000-0000-00000000008E', 'Cart Abandonment Winback — social / all (142)', 'social', 'all', 'draft', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 391903.95, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-03 15:22:32+05:30'),
('3D000000-0000-0000-0000-00000000008F', 'Festive Audio Week — re_engagement / regular (143)', 're_engagement', 'regular', 'draft', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 178748.77, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-24 15:46:11+05:30'),
('3D000000-0000-0000-0000-000000000090', 'Back-to-Office Tech Drive — clearance / regular (144)', 'clearance', 'regular', 'draft', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-09 05:07:26+05:30'),
('3D000000-0000-0000-0000-000000000091', 'Festive Electronics Sale — social / standard (145)', 'social', 'standard', 'draft', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 369390.52, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-19 18:11:30+05:30'),
('3D000000-0000-0000-0000-000000000092', 'Weekend Flash Deal — email / vip (146)', 'email', 'vip', 'draft', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-17 14:18:39+05:30'),
('3D000000-0000-0000-0000-000000000093', 'VIP Early Access Drop — email / regular (147)', 'email', 'regular', 'draft', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-12 23:14:03+05:30'),
('3D000000-0000-0000-0000-000000000094', 'New Arrivals Spotlight — clearance / all (148)', 'clearance', 'all', 'draft', 'Just For You — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 742751.93, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-01 11:48:11+05:30'),
('3D000000-0000-0000-0000-000000000095', 'Clearance Blast — email / at_risk (149)', 'email', 'at_risk', 'draft', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 811744.63, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-03 01:43:07+05:30'),
('3D000000-0000-0000-0000-000000000096', 'Re-engagement Comeback Offer — re_engagement / regular (150)', 're_engagement', 'regular', 'draft', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 898142.91, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-12 20:02:09+05:30'),
('3D000000-0000-0000-0000-000000000097', 'Diwali Mega Sale — clearance / vip (151)', 'clearance', 'vip', 'pending_approval', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 237124.96, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-30 12:10:26+05:30'),
('3D000000-0000-0000-0000-000000000098', 'Monsoon Gadget Deals — re_engagement / standard (152)', 're_engagement', 'standard', 'pending_approval', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 628172.02, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-19 01:39:03+05:30'),
('3D000000-0000-0000-0000-000000000099', 'Loyalty Reward Campaign — clearance / standard (153)', 'clearance', 'standard', 'pending_approval', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 301186.64, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-25 23:36:41+05:30'),
('3D000000-0000-0000-0000-00000000009A', 'Cart Abandonment Winback — social / standard (154)', 'social', 'standard', 'pending_approval', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 288156.68, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-11 19:37:48+05:30'),
('3D000000-0000-0000-0000-00000000009B', 'Festive Audio Week — re_engagement / at_risk (155)', 're_engagement', 'at_risk', 'pending_approval', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 753953.46, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-17 07:25:20+05:30'),
('3D000000-0000-0000-0000-00000000009C', 'Back-to-Office Tech Drive — social / standard (156)', 'social', 'standard', 'pending_approval', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 123886.45, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-18 20:14:38+05:30'),
('3D000000-0000-0000-0000-00000000009D', 'Festive Electronics Sale — email / regular (157)', 'email', 'regular', 'pending_approval', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-12 08:17:46+05:30'),
('3D000000-0000-0000-0000-00000000009E', 'Weekend Flash Deal — re_engagement / vip (158)', 're_engagement', 'vip', 'pending_approval', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 113696.19, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-04 09:27:48+05:30'),
('3D000000-0000-0000-0000-00000000009F', 'VIP Early Access Drop — email / at_risk (159)', 'email', 'at_risk', 'pending_approval', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-18 02:40:00+05:30'),
('3D000000-0000-0000-0000-0000000000A0', 'New Arrivals Spotlight — social / standard (160)', 'social', 'standard', 'pending_approval', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 87124.87, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-17 09:13:47+05:30'),
('3D000000-0000-0000-0000-0000000000A1', 'Clearance Blast — email / regular (161)', 'email', 'regular', 'pending_approval', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 447732.59, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-09 07:49:27+05:30'),
('3D000000-0000-0000-0000-0000000000A2', 'Re-engagement Comeback Offer — email / all (162)', 'email', 'all', 'pending_approval', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 888986.61, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-02 06:11:20+05:30'),
('3D000000-0000-0000-0000-0000000000A3', 'Diwali Mega Sale — re_engagement / vip (163)', 're_engagement', 'vip', 'pending_approval', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 267983.09, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-03 18:21:13+05:30'),
('3D000000-0000-0000-0000-0000000000A4', 'Monsoon Gadget Deals — re_engagement / at_risk (164)', 're_engagement', 'at_risk', 'pending_approval', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 287214.9, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-26 18:21:38+05:30'),
('3D000000-0000-0000-0000-0000000000A5', 'Loyalty Reward Campaign — email / all (165)', 'email', 'all', 'pending_approval', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 633246.02, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-21 07:02:28+05:30'),
('3D000000-0000-0000-0000-0000000000A6', 'Cart Abandonment Winback — re_engagement / standard (166)', 're_engagement', 'standard', 'pending_approval', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 871629.31, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-04 19:22:14+05:30'),
('3D000000-0000-0000-0000-0000000000A7', 'Festive Audio Week — social / at_risk (167)', 'social', 'at_risk', 'pending_approval', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-12 21:33:36+05:30'),
('3D000000-0000-0000-0000-0000000000A8', 'Back-to-Office Tech Drive — social / vip (168)', 'social', 'vip', 'pending_approval', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 269832.73, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-17 21:15:20+05:30'),
('3D000000-0000-0000-0000-0000000000A9', 'Festive Electronics Sale — social / vip (169)', 'social', 'vip', 'pending_approval', 'Big Savings — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 77274.29, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-16 01:14:22+05:30'),
('3D000000-0000-0000-0000-0000000000AA', 'Weekend Flash Deal — email / standard (170)', 'email', 'standard', 'pending_approval', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 200895.72, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-22 12:16:07+05:30'),
('3D000000-0000-0000-0000-0000000000AB', 'VIP Early Access Drop — clearance / regular (171)', 'clearance', 'regular', 'pending_approval', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 337649.82, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-22 16:03:26+05:30'),
('3D000000-0000-0000-0000-0000000000AC', 'New Arrivals Spotlight — email / regular (172)', 'email', 'regular', 'pending_approval', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 602304.24, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-07 23:42:14+05:30'),
('3D000000-0000-0000-0000-0000000000AD', 'Clearance Blast — social / vip (173)', 'social', 'vip', 'pending_approval', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 587180.78, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-16 19:34:28+05:30'),
('3D000000-0000-0000-0000-0000000000AE', 'Re-engagement Comeback Offer — re_engagement / standard (174)', 're_engagement', 'standard', 'pending_approval', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 532363.73, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-04 04:42:50+05:30'),
('3D000000-0000-0000-0000-0000000000AF', 'Diwali Mega Sale — email / regular (175)', 'email', 'regular', 'pending_approval', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 703716.55, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-16 15:33:19+05:30'),
('3D000000-0000-0000-0000-0000000000B0', 'Monsoon Gadget Deals — clearance / vip (176)', 'clearance', 'vip', 'pending_approval', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 711002.19, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-14 16:17:53+05:30'),
('3D000000-0000-0000-0000-0000000000B1', 'Loyalty Reward Campaign — clearance / all (177)', 'clearance', 'all', 'pending_approval', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 702288.12, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-23 10:25:12+05:30'),
('3D000000-0000-0000-0000-0000000000B2', 'Cart Abandonment Winback — clearance / vip (178)', 'clearance', 'vip', 'pending_approval', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-14 09:07:32+05:30'),
('3D000000-0000-0000-0000-0000000000B3', 'Festive Audio Week — clearance / vip (179)', 'clearance', 'vip', 'pending_approval', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 220871.63, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-08 19:53:58+05:30'),
('3D000000-0000-0000-0000-0000000000B4', 'Back-to-Office Tech Drive — clearance / regular (180)', 'clearance', 'regular', 'pending_approval', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 582962.75, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-07 19:55:28+05:30'),
('3D000000-0000-0000-0000-0000000000B5', 'Festive Electronics Sale — re_engagement / vip (181)', 're_engagement', 'vip', 'pending_approval', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-13 17:56:36+05:30'),
('3D000000-0000-0000-0000-0000000000B6', 'Weekend Flash Deal — social / at_risk (182)', 'social', 'at_risk', 'pending_approval', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 875055.03, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-01 13:46:48+05:30'),
('3D000000-0000-0000-0000-0000000000B7', 'VIP Early Access Drop — social / regular (183)', 'social', 'regular', 'pending_approval', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 413637.74, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-19 10:40:44+05:30'),
('3D000000-0000-0000-0000-0000000000B8', 'New Arrivals Spotlight — social / standard (184)', 'social', 'standard', 'pending_approval', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 612054.66, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-15 18:38:51+05:30'),
('3D000000-0000-0000-0000-0000000000B9', 'Clearance Blast — social / regular (185)', 'social', 'regular', 'pending_approval', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-22 09:08:01+05:30'),
('3D000000-0000-0000-0000-0000000000BA', 'Re-engagement Comeback Offer — re_engagement / at_risk (186)', 're_engagement', 'at_risk', 'pending_approval', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 723834.24, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-04 04:33:16+05:30'),
('3D000000-0000-0000-0000-0000000000BB', 'Diwali Mega Sale — social / standard (187)', 'social', 'standard', 'pending_approval', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 769755.46, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-16 06:24:42+05:30'),
('3D000000-0000-0000-0000-0000000000BC', 'Monsoon Gadget Deals — social / all (188)', 'social', 'all', 'pending_approval', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-30 18:13:00+05:30'),
('3D000000-0000-0000-0000-0000000000BD', 'Loyalty Reward Campaign — social / all (189)', 'social', 'all', 'pending_approval', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 185353.05, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-15 05:21:20+05:30'),
('3D000000-0000-0000-0000-0000000000BE', 'Cart Abandonment Winback — clearance / vip (190)', 'clearance', 'vip', 'pending_approval', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 612113.63, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-17 09:03:25+05:30'),
('3D000000-0000-0000-0000-0000000000BF', 'Festive Audio Week — re_engagement / regular (191)', 're_engagement', 'regular', 'pending_approval', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 186675.52, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-27 11:34:41+05:30'),
('3D000000-0000-0000-0000-0000000000C0', 'Back-to-Office Tech Drive — email / all (192)', 'email', 'all', 'pending_approval', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 245768.68, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-23 07:34:38+05:30'),
('3D000000-0000-0000-0000-0000000000C1', 'Festive Electronics Sale — clearance / vip (193)', 'clearance', 'vip', 'pending_approval', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-17 23:18:31+05:30'),
('3D000000-0000-0000-0000-0000000000C2', 'Weekend Flash Deal — clearance / standard (194)', 'clearance', 'standard', 'pending_approval', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 678865.52, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-16 21:23:30+05:30'),
('3D000000-0000-0000-0000-0000000000C3', 'VIP Early Access Drop — social / all (195)', 'social', 'all', 'pending_approval', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-12 11:08:52+05:30'),
('3D000000-0000-0000-0000-0000000000C4', 'New Arrivals Spotlight — clearance / all (196)', 'clearance', 'all', 'pending_approval', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-03 22:59:39+05:30'),
('3D000000-0000-0000-0000-0000000000C5', 'Clearance Blast — re_engagement / standard (197)', 're_engagement', 'standard', 'pending_approval', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 125277.9, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-13 06:03:37+05:30'),
('3D000000-0000-0000-0000-0000000000C6', 'Re-engagement Comeback Offer — social / standard (198)', 'social', 'standard', 'pending_approval', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-17 09:59:49+05:30'),
('3D000000-0000-0000-0000-0000000000C7', 'Diwali Mega Sale — social / all (199)', 'social', 'all', 'pending_approval', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 571775.57, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-13 17:46:27+05:30'),
('3D000000-0000-0000-0000-0000000000C8', 'Monsoon Gadget Deals — email / regular (200)', 'email', 'regular', 'pending_approval', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 363476.89, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-15 10:43:25+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-0000000000C9', 'Loyalty Reward Campaign — clearance / regular (201)', 'clearance', 'regular', 'pending_approval', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 505218.05, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-27 11:14:29+05:30'),
('3D000000-0000-0000-0000-0000000000CA', 'Cart Abandonment Winback — clearance / standard (202)', 'clearance', 'standard', 'pending_approval', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 102315.1, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-04 17:23:14+05:30'),
('3D000000-0000-0000-0000-0000000000CB', 'Festive Audio Week — email / all (203)', 'email', 'all', 'pending_approval', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-12 18:46:38+05:30'),
('3D000000-0000-0000-0000-0000000000CC', 'Back-to-Office Tech Drive — re_engagement / standard (204)', 're_engagement', 'standard', 'pending_approval', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-04 15:47:14+05:30'),
('3D000000-0000-0000-0000-0000000000CD', 'Festive Electronics Sale — email / at_risk (205)', 'email', 'at_risk', 'pending_approval', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 544851.95, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-05 14:46:51+05:30'),
('3D000000-0000-0000-0000-0000000000CE', 'Weekend Flash Deal — social / all (206)', 'social', 'all', 'pending_approval', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 738940.65, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-12 02:48:13+05:30'),
('3D000000-0000-0000-0000-0000000000CF', 'VIP Early Access Drop — email / at_risk (207)', 'email', 'at_risk', 'pending_approval', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-17 07:34:39+05:30'),
('3D000000-0000-0000-0000-0000000000D0', 'New Arrivals Spotlight — re_engagement / vip (208)', 're_engagement', 'vip', 'pending_approval', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 265830.03, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-26 19:07:12+05:30'),
('3D000000-0000-0000-0000-0000000000D1', 'Clearance Blast — social / all (209)', 'social', 'all', 'pending_approval', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 372216.93, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-15 22:27:43+05:30'),
('3D000000-0000-0000-0000-0000000000D2', 'Re-engagement Comeback Offer — email / regular (210)', 'email', 'regular', 'pending_approval', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 476185.82, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-21 22:10:03+05:30'),
('3D000000-0000-0000-0000-0000000000D3', 'Diwali Mega Sale — re_engagement / at_risk (211)', 're_engagement', 'at_risk', 'pending_approval', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-28 11:35:07+05:30'),
('3D000000-0000-0000-0000-0000000000D4', 'Monsoon Gadget Deals — re_engagement / regular (212)', 're_engagement', 'regular', 'pending_approval', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-27 04:53:58+05:30'),
('3D000000-0000-0000-0000-0000000000D5', 'Loyalty Reward Campaign — clearance / all (213)', 'clearance', 'all', 'pending_approval', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 193806.92, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-09 16:36:55+05:30'),
('3D000000-0000-0000-0000-0000000000D6', 'Cart Abandonment Winback — social / regular (214)', 'social', 'regular', 'pending_approval', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 693263.55, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-08 11:44:28+05:30'),
('3D000000-0000-0000-0000-0000000000D7', 'Festive Audio Week — re_engagement / all (215)', 're_engagement', 'all', 'pending_approval', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 512825.73, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-03 10:01:10+05:30'),
('3D000000-0000-0000-0000-0000000000D8', 'Back-to-Office Tech Drive — clearance / regular (216)', 'clearance', 'regular', 'pending_approval', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 741173.42, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-14 08:16:29+05:30'),
('3D000000-0000-0000-0000-0000000000D9', 'Festive Electronics Sale — clearance / at_risk (217)', 'clearance', 'at_risk', 'pending_approval', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 435564.81, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-14 01:56:58+05:30'),
('3D000000-0000-0000-0000-0000000000DA', 'Weekend Flash Deal — re_engagement / vip (218)', 're_engagement', 'vip', 'pending_approval', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-06 02:43:16+05:30'),
('3D000000-0000-0000-0000-0000000000DB', 'VIP Early Access Drop — clearance / all (219)', 'clearance', 'all', 'pending_approval', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 217700.06, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-27 10:34:14+05:30'),
('3D000000-0000-0000-0000-0000000000DC', 'New Arrivals Spotlight — clearance / at_risk (220)', 'clearance', 'at_risk', 'pending_approval', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 232498.65, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-21 18:53:17+05:30'),
('3D000000-0000-0000-0000-0000000000DD', 'Clearance Blast — social / at_risk (221)', 'social', 'at_risk', 'pending_approval', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-24 01:03:52+05:30'),
('3D000000-0000-0000-0000-0000000000DE', 'Re-engagement Comeback Offer — social / regular (222)', 'social', 'regular', 'pending_approval', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 82847.82, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-30 07:39:44+05:30'),
('3D000000-0000-0000-0000-0000000000DF', 'Diwali Mega Sale — email / at_risk (223)', 'email', 'at_risk', 'pending_approval', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-05 01:27:40+05:30'),
('3D000000-0000-0000-0000-0000000000E0', 'Monsoon Gadget Deals — re_engagement / regular (224)', 're_engagement', 'regular', 'pending_approval', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-03 19:20:40+05:30'),
('3D000000-0000-0000-0000-0000000000E1', 'Loyalty Reward Campaign — email / vip (225)', 'email', 'vip', 'pending_approval', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-15 21:57:11+05:30'),
('3D000000-0000-0000-0000-0000000000E2', 'Cart Abandonment Winback — clearance / vip (226)', 'clearance', 'vip', 'pending_approval', 'Big Savings — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 122235.64, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-24 23:55:09+05:30'),
('3D000000-0000-0000-0000-0000000000E3', 'Festive Audio Week — email / at_risk (227)', 'email', 'at_risk', 'pending_approval', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-15 00:55:29+05:30'),
('3D000000-0000-0000-0000-0000000000E4', 'Back-to-Office Tech Drive — social / regular (228)', 'social', 'regular', 'pending_approval', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 595226.93, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-04 22:57:09+05:30'),
('3D000000-0000-0000-0000-0000000000E5', 'Festive Electronics Sale — social / at_risk (229)', 'social', 'at_risk', 'pending_approval', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 833278.44, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-29 08:45:37+05:30'),
('3D000000-0000-0000-0000-0000000000E6', 'Weekend Flash Deal — social / at_risk (230)', 'social', 'at_risk', 'pending_approval', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-18 13:16:42+05:30'),
('3D000000-0000-0000-0000-0000000000E7', 'VIP Early Access Drop — email / at_risk (231)', 'email', 'at_risk', 'pending_approval', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-18 11:12:02+05:30'),
('3D000000-0000-0000-0000-0000000000E8', 'New Arrivals Spotlight — social / all (232)', 'social', 'all', 'pending_approval', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-08 22:44:23+05:30'),
('3D000000-0000-0000-0000-0000000000E9', 'Clearance Blast — re_engagement / at_risk (233)', 're_engagement', 'at_risk', 'pending_approval', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 306543.03, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-24 04:01:25+05:30'),
('3D000000-0000-0000-0000-0000000000EA', 'Re-engagement Comeback Offer — email / all (234)', 'email', 'all', 'pending_approval', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 456505.1, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-15 14:58:24+05:30'),
('3D000000-0000-0000-0000-0000000000EB', 'Diwali Mega Sale — email / vip (235)', 'email', 'vip', 'pending_approval', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-06 01:23:18+05:30'),
('3D000000-0000-0000-0000-0000000000EC', 'Monsoon Gadget Deals — clearance / regular (236)', 'clearance', 'regular', 'pending_approval', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 611318, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-11 09:07:05+05:30'),
('3D000000-0000-0000-0000-0000000000ED', 'Loyalty Reward Campaign — social / at_risk (237)', 'social', 'at_risk', 'pending_approval', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 806090.26, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-30 00:29:24+05:30'),
('3D000000-0000-0000-0000-0000000000EE', 'Cart Abandonment Winback — email / standard (238)', 'email', 'standard', 'pending_approval', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 722569.96, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-15 10:42:07+05:30'),
('3D000000-0000-0000-0000-0000000000EF', 'Festive Audio Week — social / standard (239)', 'social', 'standard', 'pending_approval', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-24 22:22:59+05:30'),
('3D000000-0000-0000-0000-0000000000F0', 'Back-to-Office Tech Drive — email / at_risk (240)', 'email', 'at_risk', 'pending_approval', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 844564.56, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-09 18:32:29+05:30'),
('3D000000-0000-0000-0000-0000000000F1', 'Festive Electronics Sale — re_engagement / regular (241)', 're_engagement', 'regular', 'pending_approval', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-07 00:42:44+05:30'),
('3D000000-0000-0000-0000-0000000000F2', 'Weekend Flash Deal — social / all (242)', 'social', 'all', 'pending_approval', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 448678.98, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-06 00:09:41+05:30'),
('3D000000-0000-0000-0000-0000000000F3', 'VIP Early Access Drop — social / vip (243)', 'social', 'vip', 'pending_approval', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 67644.32, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-15 01:07:01+05:30'),
('3D000000-0000-0000-0000-0000000000F4', 'New Arrivals Spotlight — re_engagement / regular (244)', 're_engagement', 'regular', 'pending_approval', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-07-20 18:06:05+05:30'),
('3D000000-0000-0000-0000-0000000000F5', 'Clearance Blast — email / vip (245)', 'email', 'vip', 'pending_approval', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-19 23:49:57+05:30'),
('3D000000-0000-0000-0000-0000000000F6', 'Re-engagement Comeback Offer — email / regular (246)', 'email', 'regular', 'pending_approval', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 745892.18, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-26 22:35:09+05:30'),
('3D000000-0000-0000-0000-0000000000F7', 'Diwali Mega Sale — clearance / standard (247)', 'clearance', 'standard', 'pending_approval', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 58482.25, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-02 05:08:23+05:30'),
('3D000000-0000-0000-0000-0000000000F8', 'Monsoon Gadget Deals — clearance / all (248)', 'clearance', 'all', 'pending_approval', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-22 11:28:50+05:30'),
('3D000000-0000-0000-0000-0000000000F9', 'Loyalty Reward Campaign — social / regular (249)', 'social', 'regular', 'pending_approval', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 258581.23, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-04 20:01:47+05:30'),
('3D000000-0000-0000-0000-0000000000FA', 'Cart Abandonment Winback — social / regular (250)', 'social', 'regular', 'pending_approval', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 594222.78, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-17 11:43:10+05:30'),
('3D000000-0000-0000-0000-0000000000FB', 'Festive Audio Week — clearance / standard (251)', 'clearance', 'standard', 'pending_approval', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-29 23:39:24+05:30'),
('3D000000-0000-0000-0000-0000000000FC', 'Back-to-Office Tech Drive — email / standard (252)', 'email', 'standard', 'pending_approval', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 476941.37, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-10 04:47:00+05:30'),
('3D000000-0000-0000-0000-0000000000FD', 'Festive Electronics Sale — social / at_risk (253)', 'social', 'at_risk', 'pending_approval', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 627005.85, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-16 15:14:40+05:30'),
('3D000000-0000-0000-0000-0000000000FE', 'Weekend Flash Deal — re_engagement / vip (254)', 're_engagement', 'vip', 'pending_approval', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 446024.11, 0, 'marketing_agent', NULL, NULL, NULL, '2026-03-07 04:19:07+05:30'),
('3D000000-0000-0000-0000-0000000000FF', 'VIP Early Access Drop — re_engagement / at_risk (255)', 're_engagement', 'at_risk', 'pending_approval', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 710913.27, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-06 16:29:06+05:30'),
('3D000000-0000-0000-0000-000000000100', 'New Arrivals Spotlight — re_engagement / at_risk (256)', 're_engagement', 'at_risk', 'pending_approval', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 704968.42, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-21 09:12:35+05:30'),
('3D000000-0000-0000-0000-000000000101', 'Clearance Blast — social / all (257)', 'social', 'all', 'pending_approval', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 477117.63, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-17 11:43:51+05:30'),
('3D000000-0000-0000-0000-000000000102', 'Re-engagement Comeback Offer — re_engagement / standard (258)', 're_engagement', 'standard', 'pending_approval', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 607793.39, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-14 23:08:10+05:30'),
('3D000000-0000-0000-0000-000000000103', 'Diwali Mega Sale — re_engagement / at_risk (259)', 're_engagement', 'at_risk', 'pending_approval', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 836497.29, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-12 17:45:38+05:30'),
('3D000000-0000-0000-0000-000000000104', 'Monsoon Gadget Deals — re_engagement / regular (260)', 're_engagement', 'regular', 'pending_approval', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 89590.21, 0, 'marketing_agent', NULL, NULL, NULL, '2025-10-19 21:09:48+05:30'),
('3D000000-0000-0000-0000-000000000105', 'Loyalty Reward Campaign — social / regular (261)', 'social', 'regular', 'pending_approval', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 685877.87, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-23 07:17:09+05:30'),
('3D000000-0000-0000-0000-000000000106', 'Cart Abandonment Winback — clearance / all (262)', 'clearance', 'all', 'pending_approval', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-20 22:00:12+05:30'),
('3D000000-0000-0000-0000-000000000107', 'Festive Audio Week — social / regular (263)', 'social', 'regular', 'pending_approval', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 726071.62, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-14 17:47:55+05:30'),
('3D000000-0000-0000-0000-000000000108', 'Back-to-Office Tech Drive — clearance / regular (264)', 'clearance', 'regular', 'pending_approval', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-19 18:35:17+05:30'),
('3D000000-0000-0000-0000-000000000109', 'Festive Electronics Sale — email / standard (265)', 'email', 'standard', 'pending_approval', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 62108.25, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-20 07:07:29+05:30'),
('3D000000-0000-0000-0000-00000000010A', 'Weekend Flash Deal — social / standard (266)', 'social', 'standard', 'pending_approval', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 64612.79, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-31 08:01:13+05:30'),
('3D000000-0000-0000-0000-00000000010B', 'VIP Early Access Drop — social / vip (267)', 'social', 'vip', 'pending_approval', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 32262.94, 0, 'marketing_agent', NULL, NULL, NULL, '2026-02-17 01:52:17+05:30'),
('3D000000-0000-0000-0000-00000000010C', 'New Arrivals Spotlight — email / all (268)', 'email', 'all', 'pending_approval', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 44170.26, 0, 'marketing_agent', NULL, NULL, NULL, '2025-08-28 21:39:56+05:30'),
('3D000000-0000-0000-0000-00000000010D', 'Clearance Blast — re_engagement / vip (269)', 're_engagement', 'vip', 'pending_approval', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 840818.43, 0, 'marketing_agent', NULL, NULL, NULL, '2026-06-28 06:23:57+05:30'),
('3D000000-0000-0000-0000-00000000010E', 'Re-engagement Comeback Offer — email / vip (270)', 'email', 'vip', 'pending_approval', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 353395.06, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-11 23:46:11+05:30'),
('3D000000-0000-0000-0000-00000000010F', 'Diwali Mega Sale — social / vip (271)', 'social', 'vip', 'pending_approval', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 45116.65, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-17 12:33:35+05:30'),
('3D000000-0000-0000-0000-000000000110', 'Monsoon Gadget Deals — social / all (272)', 'social', 'all', 'pending_approval', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-16 03:04:48+05:30'),
('3D000000-0000-0000-0000-000000000111', 'Loyalty Reward Campaign — re_engagement / vip (273)', 're_engagement', 'vip', 'pending_approval', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 107744.84, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-30 05:43:10+05:30'),
('3D000000-0000-0000-0000-000000000112', 'Cart Abandonment Winback — email / all (274)', 'email', 'all', 'pending_approval', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 157622.09, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-23 16:45:45+05:30'),
('3D000000-0000-0000-0000-000000000113', 'Festive Audio Week — email / standard (275)', 'email', 'standard', 'pending_approval', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 668330.81, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-01 21:25:10+05:30'),
('3D000000-0000-0000-0000-000000000114', 'Back-to-Office Tech Drive — re_engagement / regular (276)', 're_engagement', 'regular', 'pending_approval', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 875190.67, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-09 20:13:06+05:30'),
('3D000000-0000-0000-0000-000000000115', 'Festive Electronics Sale — clearance / all (277)', 'clearance', 'all', 'pending_approval', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-07-06 13:59:06+05:30'),
('3D000000-0000-0000-0000-000000000116', 'Weekend Flash Deal — re_engagement / vip (278)', 're_engagement', 'vip', 'pending_approval', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 421915.91, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-27 14:00:10+05:30'),
('3D000000-0000-0000-0000-000000000117', 'VIP Early Access Drop — email / all (279)', 'email', 'all', 'pending_approval', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 87697.87, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-01 09:21:33+05:30'),
('3D000000-0000-0000-0000-000000000118', 'New Arrivals Spotlight — clearance / standard (280)', 'clearance', 'standard', 'pending_approval', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 762797.85, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-06 15:32:15+05:30'),
('3D000000-0000-0000-0000-000000000119', 'Clearance Blast — re_engagement / regular (281)', 're_engagement', 'regular', 'pending_approval', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-04-24 23:03:22+05:30'),
('3D000000-0000-0000-0000-00000000011A', 'Re-engagement Comeback Offer — re_engagement / vip (282)', 're_engagement', 'vip', 'pending_approval', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 562784.38, 0, 'marketing_agent', NULL, NULL, NULL, '2025-09-08 23:18:08+05:30'),
('3D000000-0000-0000-0000-00000000011B', 'Diwali Mega Sale — clearance / standard (283)', 'clearance', 'standard', 'pending_approval', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 64333.95, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-31 19:28:04+05:30'),
('3D000000-0000-0000-0000-00000000011C', 'Monsoon Gadget Deals — email / all (284)', 'email', 'all', 'pending_approval', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 409312.13, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-03 15:45:35+05:30'),
('3D000000-0000-0000-0000-00000000011D', 'Loyalty Reward Campaign — email / standard (285)', 'email', 'standard', 'pending_approval', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-19 15:39:13+05:30'),
('3D000000-0000-0000-0000-00000000011E', 'Cart Abandonment Winback — social / all (286)', 'social', 'all', 'pending_approval', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 636835.19, 0, 'marketing_agent', NULL, NULL, NULL, '2026-05-22 20:23:25+05:30'),
('3D000000-0000-0000-0000-00000000011F', 'Festive Audio Week — clearance / vip (287)', 'clearance', 'vip', 'pending_approval', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-08 07:58:49+05:30'),
('3D000000-0000-0000-0000-000000000120', 'Back-to-Office Tech Drive — email / standard (288)', 'email', 'standard', 'pending_approval', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 458627.45, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-19 16:23:49+05:30'),
('3D000000-0000-0000-0000-000000000121', 'Festive Electronics Sale — clearance / standard (289)', 'clearance', 'standard', 'pending_approval', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-01-03 02:06:06+05:30'),
('3D000000-0000-0000-0000-000000000122', 'Weekend Flash Deal — re_engagement / regular (290)', 're_engagement', 'regular', 'pending_approval', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 675886.7, 0, 'marketing_agent', NULL, NULL, NULL, '2025-02-25 12:00:19+05:30'),
('3D000000-0000-0000-0000-000000000123', 'VIP Early Access Drop — email / standard (291)', 'email', 'standard', 'pending_approval', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 711705.56, 0, 'marketing_agent', NULL, NULL, NULL, '2025-06-08 07:30:39+05:30'),
('3D000000-0000-0000-0000-000000000124', 'New Arrivals Spotlight — re_engagement / regular (292)', 're_engagement', 'regular', 'pending_approval', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 513002.51, 0, 'marketing_agent', NULL, NULL, NULL, '2025-04-21 23:59:39+05:30'),
('3D000000-0000-0000-0000-000000000125', 'Clearance Blast — email / all (293)', 'email', 'all', 'pending_approval', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-27 13:24:49+05:30'),
('3D000000-0000-0000-0000-000000000126', 'Re-engagement Comeback Offer — clearance / regular (294)', 'clearance', 'regular', 'pending_approval', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 428421.7, 0, 'marketing_agent', NULL, NULL, NULL, '2025-12-27 05:57:10+05:30'),
('3D000000-0000-0000-0000-000000000127', 'Diwali Mega Sale — email / all (295)', 'email', 'all', 'pending_approval', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-13 13:09:11+05:30'),
('3D000000-0000-0000-0000-000000000128', 'Monsoon Gadget Deals — re_engagement / at_risk (296)', 're_engagement', 'at_risk', 'pending_approval', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 121954.67, 0, 'marketing_agent', NULL, NULL, NULL, '2026-08-08 05:15:10+05:30'),
('3D000000-0000-0000-0000-000000000129', 'Loyalty Reward Campaign — clearance / regular (297)', 'clearance', 'regular', 'pending_approval', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-11-22 12:40:32+05:30'),
('3D000000-0000-0000-0000-00000000012A', 'Cart Abandonment Winback — email / standard (298)', 'email', 'standard', 'pending_approval', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2025-03-25 16:58:02+05:30'),
('3D000000-0000-0000-0000-00000000012B', 'Festive Audio Week — social / at_risk (299)', 'social', 'at_risk', 'pending_approval', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 27519.27, 0, 'marketing_agent', NULL, NULL, NULL, '2025-05-06 06:26:41+05:30'),
('3D000000-0000-0000-0000-00000000012C', 'Back-to-Office Tech Drive — clearance / vip (300)', 'clearance', 'vip', 'pending_approval', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', NULL, NULL, NULL, '2026-01-25 22:02:48+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-00000000012D', 'Festive Electronics Sale — social / all (301)', 'social', 'all', 'approved', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 619576.35, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2026-03-08 01:09:59+05:30'),
('3D000000-0000-0000-0000-00000000012E', 'Weekend Flash Deal — social / at_risk (302)', 'social', 'at_risk', 'approved', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 765798.48, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-06-27 09:39:18+05:30'),
('3D000000-0000-0000-0000-00000000012F', 'VIP Early Access Drop — social / at_risk (303)', 'social', 'at_risk', 'approved', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 30166.14, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2025-09-18 06:13:22+05:30'),
('3D000000-0000-0000-0000-000000000130', 'New Arrivals Spotlight — re_engagement / all (304)', 're_engagement', 'all', 'approved', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-07-20 12:26:41+05:30'),
('3D000000-0000-0000-0000-000000000131', 'Clearance Blast — re_engagement / standard (305)', 're_engagement', 'standard', 'approved', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-04-20 14:53:07+05:30'),
('3D000000-0000-0000-0000-000000000132', 'Re-engagement Comeback Offer — clearance / at_risk (306)', 'clearance', 'at_risk', 'approved', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 603114.67, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2026-06-30 12:05:27+05:30'),
('3D000000-0000-0000-0000-000000000133', 'Diwali Mega Sale — email / at_risk (307)', 'email', 'at_risk', 'approved', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2026-03-30 15:53:05+05:30'),
('3D000000-0000-0000-0000-000000000134', 'Monsoon Gadget Deals — re_engagement / vip (308)', 're_engagement', 'vip', 'approved', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-11-29 19:27:14+05:30'),
('3D000000-0000-0000-0000-000000000135', 'Loyalty Reward Campaign — email / regular (309)', 'email', 'regular', 'approved', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2026-06-15 21:03:10+05:30'),
('3D000000-0000-0000-0000-000000000136', 'Cart Abandonment Winback — social / standard (310)', 'social', 'standard', 'approved', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 333025.64, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2026-01-15 05:28:19+05:30'),
('3D000000-0000-0000-0000-000000000137', 'Festive Audio Week — clearance / all (311)', 'clearance', 'all', 'approved', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 199552.26, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-02-03 10:35:34+05:30'),
('3D000000-0000-0000-0000-000000000138', 'Back-to-Office Tech Drive — re_engagement / all (312)', 're_engagement', 'all', 'approved', 'Just For You — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 623867.91, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-02-27 14:52:21+05:30'),
('3D000000-0000-0000-0000-000000000139', 'Festive Electronics Sale — social / regular (313)', 'social', 'regular', 'approved', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-03-20 19:55:54+05:30'),
('3D000000-0000-0000-0000-00000000013A', 'Weekend Flash Deal — re_engagement / vip (314)', 're_engagement', 'vip', 'approved', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 463965.04, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-12-02 20:10:54+05:30'),
('3D000000-0000-0000-0000-00000000013B', 'VIP Early Access Drop — social / regular (315)', 'social', 'regular', 'approved', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 55487.37, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2025-07-31 16:01:05+05:30'),
('3D000000-0000-0000-0000-00000000013C', 'New Arrivals Spotlight — email / standard (316)', 'email', 'standard', 'approved', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 287934.37, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-04-26 21:26:15+05:30'),
('3D000000-0000-0000-0000-00000000013D', 'Clearance Blast — social / standard (317)', 'social', 'standard', 'approved', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-04-14 05:30:00+05:30'),
('3D000000-0000-0000-0000-00000000013E', 'Re-engagement Comeback Offer — re_engagement / at_risk (318)', 're_engagement', 'at_risk', 'approved', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-06-03 18:59:43+05:30'),
('3D000000-0000-0000-0000-00000000013F', 'Diwali Mega Sale — re_engagement / vip (319)', 're_engagement', 'vip', 'approved', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 789013.03, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2026-07-24 09:04:13+05:30'),
('3D000000-0000-0000-0000-000000000140', 'Monsoon Gadget Deals — social / regular (320)', 'social', 'regular', 'approved', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 114987.32, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2025-10-20 03:25:10+05:30'),
('3D000000-0000-0000-0000-000000000141', 'Loyalty Reward Campaign — clearance / at_risk (321)', 'clearance', 'at_risk', 'approved', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 487046.34, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2026-02-07 05:59:56+05:30'),
('3D000000-0000-0000-0000-000000000142', 'Cart Abandonment Winback — re_engagement / at_risk (322)', 're_engagement', 'at_risk', 'approved', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-03-29 03:43:56+05:30'),
('3D000000-0000-0000-0000-000000000143', 'Festive Audio Week — re_engagement / vip (323)', 're_engagement', 'vip', 'approved', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 609669.87, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-10-26 05:19:28+05:30'),
('3D000000-0000-0000-0000-000000000144', 'Back-to-Office Tech Drive — social / vip (324)', 'social', 'vip', 'approved', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 823131.25, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-11-11 23:21:12+05:30'),
('3D000000-0000-0000-0000-000000000145', 'Festive Electronics Sale — re_engagement / all (325)', 're_engagement', 'all', 'approved', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 117741.41, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-11-11 06:14:30+05:30'),
('3D000000-0000-0000-0000-000000000146', 'Weekend Flash Deal — re_engagement / vip (326)', 're_engagement', 'vip', 'approved', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-03-11 04:33:31+05:30'),
('3D000000-0000-0000-0000-000000000147', 'VIP Early Access Drop — social / all (327)', 'social', 'all', 'approved', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2025-12-30 12:17:57+05:30'),
('3D000000-0000-0000-0000-000000000148', 'New Arrivals Spotlight — email / at_risk (328)', 'email', 'at_risk', 'approved', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2026-05-04 19:43:07+05:30'),
('3D000000-0000-0000-0000-000000000149', 'Clearance Blast — re_engagement / regular (329)', 're_engagement', 'regular', 'approved', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-03-02 07:43:40+05:30'),
('3D000000-0000-0000-0000-00000000014A', 'Re-engagement Comeback Offer — re_engagement / vip (330)', 're_engagement', 'vip', 'approved', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-05-30 08:55:17+05:30'),
('3D000000-0000-0000-0000-00000000014B', 'Diwali Mega Sale — re_engagement / all (331)', 're_engagement', 'all', 'approved', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2026-06-15 18:05:43+05:30'),
('3D000000-0000-0000-0000-00000000014C', 'Monsoon Gadget Deals — social / all (332)', 'social', 'all', 'approved', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2025-12-15 01:00:50+05:30'),
('3D000000-0000-0000-0000-00000000014D', 'Loyalty Reward Campaign — email / at_risk (333)', 'email', 'at_risk', 'approved', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 857727.44, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-12-29 19:01:08+05:30'),
('3D000000-0000-0000-0000-00000000014E', 'Cart Abandonment Winback — social / standard (334)', 'social', 'standard', 'approved', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 144627.95, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-05-10 17:55:50+05:30'),
('3D000000-0000-0000-0000-00000000014F', 'Festive Audio Week — email / all (335)', 'email', 'all', 'approved', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 137539.68, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2026-03-19 11:16:55+05:30'),
('3D000000-0000-0000-0000-000000000150', 'Back-to-Office Tech Drive — email / standard (336)', 'email', 'standard', 'approved', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 548251.5, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2026-04-18 22:55:31+05:30'),
('3D000000-0000-0000-0000-000000000151', 'Festive Electronics Sale — email / at_risk (337)', 'email', 'at_risk', 'approved', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 41027.71, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-02-18 05:42:48+05:30'),
('3D000000-0000-0000-0000-000000000152', 'Weekend Flash Deal — email / regular (338)', 'email', 'regular', 'approved', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 821277.16, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-12-08 21:04:29+05:30'),
('3D000000-0000-0000-0000-000000000153', 'VIP Early Access Drop — re_engagement / standard (339)', 're_engagement', 'standard', 'approved', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 25065.78, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-04-22 08:31:46+05:30'),
('3D000000-0000-0000-0000-000000000154', 'New Arrivals Spotlight — re_engagement / regular (340)', 're_engagement', 'regular', 'approved', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 98724.17, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2025-09-15 07:47:26+05:30'),
('3D000000-0000-0000-0000-000000000155', 'Clearance Blast — re_engagement / at_risk (341)', 're_engagement', 'at_risk', 'approved', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 450878.28, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-07-06 07:18:43+05:30'),
('3D000000-0000-0000-0000-000000000156', 'Re-engagement Comeback Offer — email / standard (342)', 'email', 'standard', 'approved', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2025-05-03 11:57:36+05:30'),
('3D000000-0000-0000-0000-000000000157', 'Diwali Mega Sale — clearance / at_risk (343)', 'clearance', 'at_risk', 'approved', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-05-13 12:24:54+05:30'),
('3D000000-0000-0000-0000-000000000158', 'Monsoon Gadget Deals — re_engagement / regular (344)', 're_engagement', 'regular', 'approved', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 289167.21, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2025-01-26 23:25:13+05:30'),
('3D000000-0000-0000-0000-000000000159', 'Loyalty Reward Campaign — social / standard (345)', 'social', 'standard', 'approved', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 131669.79, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2026-05-17 08:13:06+05:30'),
('3D000000-0000-0000-0000-00000000015A', 'Cart Abandonment Winback — social / at_risk (346)', 'social', 'at_risk', 'approved', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 223986.01, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-03-10 03:53:39+05:30'),
('3D000000-0000-0000-0000-00000000015B', 'Festive Audio Week — social / vip (347)', 'social', 'vip', 'approved', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2026-04-24 01:28:26+05:30'),
('3D000000-0000-0000-0000-00000000015C', 'Back-to-Office Tech Drive — re_engagement / standard (348)', 're_engagement', 'standard', 'approved', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2026-06-17 16:07:17+05:30'),
('3D000000-0000-0000-0000-00000000015D', 'Festive Electronics Sale — re_engagement / vip (349)', 're_engagement', 'vip', 'approved', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 446824.3, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-01-29 09:25:56+05:30'),
('3D000000-0000-0000-0000-00000000015E', 'Weekend Flash Deal — social / at_risk (350)', 'social', 'at_risk', 'approved', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 237725.49, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-01-16 22:11:41+05:30'),
('3D000000-0000-0000-0000-00000000015F', 'VIP Early Access Drop — social / standard (351)', 'social', 'standard', 'approved', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 490145.6, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-07-14 02:14:29+05:30'),
('3D000000-0000-0000-0000-000000000160', 'New Arrivals Spotlight — clearance / all (352)', 'clearance', 'all', 'approved', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 270620.78, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2026-01-25 08:18:16+05:30'),
('3D000000-0000-0000-0000-000000000161', 'Clearance Blast — re_engagement / regular (353)', 're_engagement', 'regular', 'approved', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 759075.28, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2026-01-29 08:40:49+05:30'),
('3D000000-0000-0000-0000-000000000162', 'Re-engagement Comeback Offer — email / vip (354)', 'email', 'vip', 'approved', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 759071.94, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-02-28 00:35:05+05:30'),
('3D000000-0000-0000-0000-000000000163', 'Diwali Mega Sale — re_engagement / vip (355)', 're_engagement', 'vip', 'approved', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 163319.73, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2025-03-21 19:23:14+05:30'),
('3D000000-0000-0000-0000-000000000164', 'Monsoon Gadget Deals — re_engagement / all (356)', 're_engagement', 'all', 'approved', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 765957.39, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2025-02-24 11:17:26+05:30'),
('3D000000-0000-0000-0000-000000000165', 'Loyalty Reward Campaign — social / all (357)', 'social', 'all', 'approved', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 611072.79, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-04-23 02:30:39+05:30'),
('3D000000-0000-0000-0000-000000000166', 'Cart Abandonment Winback — email / all (358)', 'email', 'all', 'approved', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 29442.56, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2026-06-01 12:04:46+05:30'),
('3D000000-0000-0000-0000-000000000167', 'Festive Audio Week — clearance / at_risk (359)', 'clearance', 'at_risk', 'approved', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 622175.88, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-02-27 08:45:47+05:30'),
('3D000000-0000-0000-0000-000000000168', 'Back-to-Office Tech Drive — social / at_risk (360)', 'social', 'at_risk', 'approved', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 221742.35, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2026-06-05 08:08:33+05:30'),
('3D000000-0000-0000-0000-000000000169', 'Festive Electronics Sale — email / vip (361)', 'email', 'vip', 'approved', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 217193.66, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2026-02-13 13:35:28+05:30'),
('3D000000-0000-0000-0000-00000000016A', 'Weekend Flash Deal — social / regular (362)', 'social', 'regular', 'approved', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 752831.43, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2026-06-08 09:14:26+05:30'),
('3D000000-0000-0000-0000-00000000016B', 'VIP Early Access Drop — re_engagement / vip (363)', 're_engagement', 'vip', 'approved', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 455970.8, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-10-04 07:50:25+05:30'),
('3D000000-0000-0000-0000-00000000016C', 'New Arrivals Spotlight — clearance / vip (364)', 'clearance', 'vip', 'approved', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 445519.53, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-03-13 15:39:57+05:30'),
('3D000000-0000-0000-0000-00000000016D', 'Clearance Blast — clearance / vip (365)', 'clearance', 'vip', 'approved', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-02-19 17:12:26+05:30'),
('3D000000-0000-0000-0000-00000000016E', 'Re-engagement Comeback Offer — re_engagement / vip (366)', 're_engagement', 'vip', 'approved', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', NULL, '2025-09-01 16:34:19+05:30'),
('3D000000-0000-0000-0000-00000000016F', 'Diwali Mega Sale — clearance / vip (367)', 'clearance', 'vip', 'approved', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-02-09 22:15:11+05:30'),
('3D000000-0000-0000-0000-000000000170', 'Monsoon Gadget Deals — social / standard (368)', 'social', 'standard', 'approved', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 206923.34, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2026-06-11 01:12:28+05:30'),
('3D000000-0000-0000-0000-000000000171', 'Loyalty Reward Campaign — re_engagement / standard (369)', 're_engagement', 'standard', 'approved', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 809294.6, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-01-05 23:46:54+05:30'),
('3D000000-0000-0000-0000-000000000172', 'Cart Abandonment Winback — re_engagement / standard (370)', 're_engagement', 'standard', 'approved', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-06-03 23:32:27+05:30'),
('3D000000-0000-0000-0000-000000000173', 'Festive Audio Week — email / regular (371)', 'email', 'regular', 'approved', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 836991.05, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2025-09-09 02:23:48+05:30'),
('3D000000-0000-0000-0000-000000000174', 'Back-to-Office Tech Drive — re_engagement / vip (372)', 're_engagement', 'vip', 'approved', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 295035.48, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-02-07 06:04:33+05:30'),
('3D000000-0000-0000-0000-000000000175', 'Festive Electronics Sale — clearance / regular (373)', 'clearance', 'regular', 'approved', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 733289.49, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-03-16 22:37:46+05:30'),
('3D000000-0000-0000-0000-000000000176', 'Weekend Flash Deal — re_engagement / standard (374)', 're_engagement', 'standard', 'approved', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-07-15 04:03:18+05:30'),
('3D000000-0000-0000-0000-000000000177', 'VIP Early Access Drop — clearance / regular (375)', 'clearance', 'regular', 'approved', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-20 12:00:00+05:30', NULL, '2026-06-15 01:53:21+05:30'),
('3D000000-0000-0000-0000-000000000178', 'New Arrivals Spotlight — clearance / at_risk (376)', 'clearance', 'at_risk', 'approved', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 436058.45, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-18 12:00:00+05:30', NULL, '2025-11-22 12:17:40+05:30'),
('3D000000-0000-0000-0000-000000000179', 'Clearance Blast — email / vip (377)', 'email', 'vip', 'approved', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 401261.4, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-12-18 17:03:02+05:30'),
('3D000000-0000-0000-0000-00000000017A', 'Re-engagement Comeback Offer — re_engagement / all (378)', 're_engagement', 'all', 'approved', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 57394.33, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-06-30 05:05:10+05:30'),
('3D000000-0000-0000-0000-00000000017B', 'Diwali Mega Sale — email / standard (379)', 'email', 'standard', 'approved', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 774247.11, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-07-08 14:20:42+05:30'),
('3D000000-0000-0000-0000-00000000017C', 'Monsoon Gadget Deals — email / all (380)', 'email', 'all', 'approved', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 767892.88, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-01-05 17:18:04+05:30'),
('3D000000-0000-0000-0000-00000000017D', 'Loyalty Reward Campaign — social / at_risk (381)', 'social', 'at_risk', 'approved', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 589152.35, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-05-17 03:49:20+05:30'),
('3D000000-0000-0000-0000-00000000017E', 'Cart Abandonment Winback — re_engagement / all (382)', 're_engagement', 'all', 'approved', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 828094.21, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', NULL, '2025-07-18 14:21:29+05:30'),
('3D000000-0000-0000-0000-00000000017F', 'Festive Audio Week — social / standard (383)', 'social', 'standard', 'approved', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 31873.96, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-02-12 11:55:42+05:30'),
('3D000000-0000-0000-0000-000000000180', 'Back-to-Office Tech Drive — re_engagement / standard (384)', 're_engagement', 'standard', 'approved', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 599766.61, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-05-02 22:26:06+05:30'),
('3D000000-0000-0000-0000-000000000181', 'Festive Electronics Sale — social / at_risk (385)', 'social', 'at_risk', 'approved', 'Limited Time — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 33181.46, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-05-14 17:50:30+05:30'),
('3D000000-0000-0000-0000-000000000182', 'Weekend Flash Deal — clearance / standard (386)', 'clearance', 'standard', 'approved', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 491433.58, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-10-25 20:48:18+05:30'),
('3D000000-0000-0000-0000-000000000183', 'VIP Early Access Drop — re_engagement / standard (387)', 're_engagement', 'standard', 'approved', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 134037.24, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-06-06 23:43:02+05:30'),
('3D000000-0000-0000-0000-000000000184', 'New Arrivals Spotlight — re_engagement / standard (388)', 're_engagement', 'standard', 'approved', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 215335.47, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-05-20 12:15:35+05:30'),
('3D000000-0000-0000-0000-000000000185', 'Clearance Blast — clearance / vip (389)', 'clearance', 'vip', 'approved', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 709411.82, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-07-05 10:26:34+05:30'),
('3D000000-0000-0000-0000-000000000186', 'Re-engagement Comeback Offer — re_engagement / regular (390)', 're_engagement', 'regular', 'approved', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 492284.59, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-10-27 00:55:53+05:30'),
('3D000000-0000-0000-0000-000000000187', 'Diwali Mega Sale — clearance / regular (391)', 'clearance', 'regular', 'approved', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-04-06 22:14:38+05:30'),
('3D000000-0000-0000-0000-000000000188', 'Monsoon Gadget Deals — social / standard (392)', 'social', 'standard', 'approved', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 519640.98, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2026-04-10 23:17:28+05:30'),
('3D000000-0000-0000-0000-000000000189', 'Loyalty Reward Campaign — clearance / vip (393)', 'clearance', 'vip', 'approved', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 129974.55, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-21 12:00:00+05:30', NULL, '2025-10-26 05:21:58+05:30'),
('3D000000-0000-0000-0000-00000000018A', 'Cart Abandonment Winback — clearance / vip (394)', 'clearance', 'vip', 'approved', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-15 12:00:00+05:30', NULL, '2025-03-22 23:30:03+05:30'),
('3D000000-0000-0000-0000-00000000018B', 'Festive Audio Week — social / regular (395)', 'social', 'regular', 'approved', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 180031.63, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-02-20 11:42:50+05:30'),
('3D000000-0000-0000-0000-00000000018C', 'Back-to-Office Tech Drive — re_engagement / regular (396)', 're_engagement', 'regular', 'approved', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 483319.29, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-17 12:00:00+05:30', NULL, '2025-05-08 02:17:59+05:30'),
('3D000000-0000-0000-0000-00000000018D', 'Festive Electronics Sale — social / standard (397)', 'social', 'standard', 'approved', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 53169.27, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-19 12:00:00+05:30', NULL, '2025-03-09 08:45:15+05:30'),
('3D000000-0000-0000-0000-00000000018E', 'Weekend Flash Deal — social / all (398)', 'social', 'all', 'approved', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 795908.29, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-16 12:00:00+05:30', NULL, '2025-04-18 16:09:48+05:30'),
('3D000000-0000-0000-0000-00000000018F', 'VIP Early Access Drop — social / regular (399)', 'social', 'regular', 'approved', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 147913.92, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-08-24 03:50:59+05:30'),
('3D000000-0000-0000-0000-000000000190', 'New Arrivals Spotlight — clearance / standard (400)', 'clearance', 'standard', 'approved', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', NULL, '2025-02-27 10:34:24+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000191', 'Clearance Blast — clearance / at_risk (401)', 'clearance', 'at_risk', 'active', 'Limited Time — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 851561.29, 170312.26, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-07 12:00:00+05:30', '2026-08-07 18:00:00+05:30', '2025-07-22 11:17:50+05:30'),
('3D000000-0000-0000-0000-000000000192', 'Re-engagement Comeback Offer — re_engagement / all (402)', 're_engagement', 'all', 'active', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 193559.04, 65810.07, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 23:00:00+05:30', '2025-01-10 19:24:48+05:30'),
('3D000000-0000-0000-0000-000000000193', 'Diwali Mega Sale — email / at_risk (403)', 'email', 'at_risk', 'active', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 676899.14, 433215.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-04 12:00:00+05:30', '2026-08-05 09:00:00+05:30', '2025-03-25 12:17:39+05:30'),
('3D000000-0000-0000-0000-000000000194', 'Monsoon Gadget Deals — social / at_risk (404)', 'social', 'at_risk', 'active', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 11:00:00+05:30', '2026-04-04 17:11:18+05:30'),
('3D000000-0000-0000-0000-000000000195', 'Loyalty Reward Campaign — re_engagement / standard (405)', 're_engagement', 'standard', 'active', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 638623.43, 83021.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-16 19:00:00+05:30', '2026-01-15 22:48:17+05:30'),
('3D000000-0000-0000-0000-000000000196', 'Cart Abandonment Winback — social / standard (406)', 'social', 'standard', 'active', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-02 08:00:00+05:30', '2025-11-06 02:02:42+05:30'),
('3D000000-0000-0000-0000-000000000197', 'Festive Audio Week — clearance / regular (407)', 'clearance', 'regular', 'active', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-10 13:00:00+05:30', '2025-08-18 13:53:25+05:30'),
('3D000000-0000-0000-0000-000000000198', 'Back-to-Office Tech Drive — clearance / regular (408)', 'clearance', 'regular', 'active', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-12 09:00:00+05:30', '2026-03-10 19:30:31+05:30'),
('3D000000-0000-0000-0000-000000000199', 'Festive Electronics Sale — clearance / vip (409)', 'clearance', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 106584.32, 17053.49, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-26 07:00:00+05:30', '2025-08-18 18:51:44+05:30'),
('3D000000-0000-0000-0000-00000000019A', 'Weekend Flash Deal — clearance / standard (410)', 'clearance', 'standard', 'active', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 209455.95, 94255.18, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-18 16:00:00+05:30', '2025-12-03 05:52:36+05:30'),
('3D000000-0000-0000-0000-00000000019B', 'VIP Early Access Drop — social / standard (411)', 'social', 'standard', 'active', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 124465.53, 79657.94, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-10 12:00:00+05:30', '2026-08-06 16:14:06+05:30'),
('3D000000-0000-0000-0000-00000000019C', 'New Arrivals Spotlight — clearance / vip (412)', 'clearance', 'vip', 'active', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 361539.99, 206077.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 00:00:00+05:30', '2026-02-14 02:01:55+05:30'),
('3D000000-0000-0000-0000-00000000019D', 'Clearance Blast — social / at_risk (413)', 'social', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 295752.13, 79853.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 06:00:00+05:30', '2025-03-12 02:27:28+05:30'),
('3D000000-0000-0000-0000-00000000019E', 'Re-engagement Comeback Offer — re_engagement / vip (414)', 're_engagement', 'vip', 'active', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-31 00:00:00+05:30', '2025-08-19 01:20:31+05:30'),
('3D000000-0000-0000-0000-00000000019F', 'Diwali Mega Sale — social / at_risk (415)', 'social', 'at_risk', 'active', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 25837.61, 5684.27, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-11 22:00:00+05:30', '2025-01-21 01:52:21+05:30'),
('3D000000-0000-0000-0000-0000000001A0', 'Monsoon Gadget Deals — clearance / all (416)', 'clearance', 'all', 'active', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 187774.28, 112664.57, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', '2026-08-14 05:00:00+05:30', '2026-04-11 07:50:45+05:30'),
('3D000000-0000-0000-0000-0000000001A1', 'Loyalty Reward Campaign — social / vip (417)', 'social', 'vip', 'active', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-13 12:00:00+05:30', '2025-07-02 02:44:41+05:30'),
('3D000000-0000-0000-0000-0000000001A2', 'Cart Abandonment Winback — clearance / all (418)', 'clearance', 'all', 'active', 'Just For You — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 859884.93, 507332.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-09 04:00:00+05:30', '2025-04-28 22:47:28+05:30'),
('3D000000-0000-0000-0000-0000000001A3', 'Festive Audio Week — re_engagement / at_risk (419)', 're_engagement', 'at_risk', 'active', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 280994.68, 191076.38, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 11:00:00+05:30', '2025-01-08 15:25:54+05:30'),
('3D000000-0000-0000-0000-0000000001A4', 'Back-to-Office Tech Drive — clearance / standard (420)', 'clearance', 'standard', 'active', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 00:00:00+05:30', '2026-01-28 17:40:00+05:30'),
('3D000000-0000-0000-0000-0000000001A5', 'Festive Electronics Sale — social / at_risk (421)', 'social', 'at_risk', 'active', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 837479.74, 117247.16, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-14 01:00:00+05:30', '2025-11-04 12:07:32+05:30'),
('3D000000-0000-0000-0000-0000000001A6', 'Weekend Flash Deal — email / at_risk (422)', 'email', 'at_risk', 'active', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 06:00:00+05:30', '2025-12-10 22:42:07+05:30'),
('3D000000-0000-0000-0000-0000000001A7', 'VIP Early Access Drop — email / at_risk (423)', 'email', 'at_risk', 'active', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 674568.64, 134913.73, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 15:00:00+05:30', '2025-07-06 20:02:20+05:30'),
('3D000000-0000-0000-0000-0000000001A8', 'New Arrivals Spotlight — clearance / at_risk (424)', 'clearance', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-11 19:00:00+05:30', '2026-01-17 01:07:24+05:30'),
('3D000000-0000-0000-0000-0000000001A9', 'Clearance Blast — clearance / standard (425)', 'clearance', 'standard', 'active', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 150601.92, 94879.21, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-12 15:00:00+05:30', '2026-06-17 21:50:42+05:30'),
('3D000000-0000-0000-0000-0000000001AA', 'Re-engagement Comeback Offer — social / standard (426)', 'social', 'standard', 'active', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 648830.44, 175184.22, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-11 03:00:00+05:30', '2025-09-25 01:26:10+05:30'),
('3D000000-0000-0000-0000-0000000001AB', 'Diwali Mega Sale — email / all (427)', 'email', 'all', 'active', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 00:00:00+05:30', '2026-06-25 10:38:30+05:30'),
('3D000000-0000-0000-0000-0000000001AC', 'Monsoon Gadget Deals — email / all (428)', 'email', 'all', 'active', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', '2026-08-14 20:00:00+05:30', '2025-05-31 22:38:08+05:30'),
('3D000000-0000-0000-0000-0000000001AD', 'Loyalty Reward Campaign — email / at_risk (429)', 'email', 'at_risk', 'active', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 385098.9, 269569.23, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-30 00:00:00+05:30', '2025-05-18 22:21:45+05:30'),
('3D000000-0000-0000-0000-0000000001AE', 'Cart Abandonment Winback — re_engagement / at_risk (430)', 're_engagement', 'at_risk', 'active', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 860371.96, 301130.19, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 06:00:00+05:30', '2025-03-07 14:52:04+05:30'),
('3D000000-0000-0000-0000-0000000001AF', 'Festive Audio Week — re_engagement / standard (431)', 're_engagement', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 655808.02, 124603.52, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 12:00:00+05:30', '2025-11-07 19:48:07+05:30'),
('3D000000-0000-0000-0000-0000000001B0', 'Back-to-Office Tech Drive — social / at_risk (432)', 'social', 'at_risk', 'active', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-11 20:00:00+05:30', '2026-01-14 17:15:23+05:30'),
('3D000000-0000-0000-0000-0000000001B1', 'Festive Electronics Sale — re_engagement / vip (433)', 're_engagement', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 510232.81, 275525.72, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 00:00:00+05:30', '2025-12-02 08:09:42+05:30'),
('3D000000-0000-0000-0000-0000000001B2', 'Weekend Flash Deal — clearance / vip (434)', 'clearance', 'vip', 'active', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-12 12:00:00+05:30', '2026-01-29 08:59:54+05:30'),
('3D000000-0000-0000-0000-0000000001B3', 'VIP Early Access Drop — social / vip (435)', 'social', 'vip', 'active', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 188225.77, 109170.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-27 08:00:00+05:30', '2025-07-21 17:29:09+05:30'),
('3D000000-0000-0000-0000-0000000001B4', 'New Arrivals Spotlight — re_engagement / standard (436)', 're_engagement', 'standard', 'active', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 157968.95, 20535.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-09 15:00:00+05:30', '2025-02-15 22:10:59+05:30'),
('3D000000-0000-0000-0000-0000000001B5', 'Clearance Blast — re_engagement / standard (437)', 're_engagement', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-05 19:00:00+05:30', '2026-01-06 05:47:00+05:30'),
('3D000000-0000-0000-0000-0000000001B6', 'Re-engagement Comeback Offer — social / regular (438)', 'social', 'regular', 'active', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 291812.97, 154660.87, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-13 09:00:00+05:30', '2026-05-24 20:25:12+05:30'),
('3D000000-0000-0000-0000-0000000001B7', 'Diwali Mega Sale — email / all (439)', 'email', 'all', 'active', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 429875.87, 249328, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 02:00:00+05:30', '2026-08-09 21:39:05+05:30'),
('3D000000-0000-0000-0000-0000000001B8', 'Monsoon Gadget Deals — email / at_risk (440)', 'email', 'at_risk', 'active', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 440228.51, 140873.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 19:00:00+05:30', '2026-03-02 15:39:01+05:30'),
('3D000000-0000-0000-0000-0000000001B9', 'Loyalty Reward Campaign — clearance / standard (441)', 'clearance', 'standard', 'active', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 510777.83, 56185.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 08:00:00+05:30', '2026-06-07 11:44:19+05:30'),
('3D000000-0000-0000-0000-0000000001BA', 'Cart Abandonment Winback — email / regular (442)', 'email', 'regular', 'active', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-09 11:00:00+05:30', '2025-04-18 04:16:00+05:30'),
('3D000000-0000-0000-0000-0000000001BB', 'Festive Audio Week — clearance / regular (443)', 'clearance', 'regular', 'active', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', '2026-08-15 00:00:00+05:30', '2026-06-25 16:28:05+05:30'),
('3D000000-0000-0000-0000-0000000001BC', 'Back-to-Office Tech Drive — re_engagement / at_risk (444)', 're_engagement', 'at_risk', 'active', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 508711.45, 325575.33, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 13:00:00+05:30', '2026-01-09 11:04:08+05:30'),
('3D000000-0000-0000-0000-0000000001BD', 'Festive Electronics Sale — email / regular (445)', 'email', 'regular', 'active', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 348012.69, 163565.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 04:00:00+05:30', '2026-02-10 17:02:45+05:30'),
('3D000000-0000-0000-0000-0000000001BE', 'Weekend Flash Deal — social / vip (446)', 'social', 'vip', 'active', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 524737.09, 225636.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-10 23:00:00+05:30', '2026-05-21 04:09:02+05:30'),
('3D000000-0000-0000-0000-0000000001BF', 'VIP Early Access Drop — social / vip (447)', 'social', 'vip', 'active', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-31 11:00:00+05:30', '2026-05-05 13:45:12+05:30'),
('3D000000-0000-0000-0000-0000000001C0', 'New Arrivals Spotlight — re_engagement / at_risk (448)', 're_engagement', 'at_risk', 'active', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-12 19:00:00+05:30', '2026-06-04 18:46:11+05:30'),
('3D000000-0000-0000-0000-0000000001C1', 'Clearance Blast — clearance / vip (449)', 'clearance', 'vip', 'active', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 12:00:00+05:30', '2025-11-09 15:00:46+05:30'),
('3D000000-0000-0000-0000-0000000001C2', 'Re-engagement Comeback Offer — social / at_risk (450)', 'social', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 634530.57, 387063.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-06 15:00:00+05:30', '2025-01-19 23:31:56+05:30'),
('3D000000-0000-0000-0000-0000000001C3', 'Diwali Mega Sale — re_engagement / all (451)', 're_engagement', 'all', 'active', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 550707.17, 275353.59, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-14 06:00:00+05:30', '2025-08-01 02:52:08+05:30'),
('3D000000-0000-0000-0000-0000000001C4', 'Monsoon Gadget Deals — email / regular (452)', 'email', 'regular', 'active', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-13 07:00:00+05:30', '2026-04-13 21:00:40+05:30'),
('3D000000-0000-0000-0000-0000000001C5', 'Loyalty Reward Campaign — social / regular (453)', 'social', 'regular', 'active', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 769068.07, 153813.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 22:00:00+05:30', '2025-08-24 13:21:58+05:30'),
('3D000000-0000-0000-0000-0000000001C6', 'Cart Abandonment Winback — email / standard (454)', 'email', 'standard', 'active', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 351001.04, 235170.7, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 04:00:00+05:30', '2025-09-18 05:51:53+05:30'),
('3D000000-0000-0000-0000-0000000001C7', 'Festive Audio Week — social / at_risk (455)', 'social', 'at_risk', 'active', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 114082.29, 61604.44, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-21 19:00:00+05:30', '2025-06-21 20:37:37+05:30'),
('3D000000-0000-0000-0000-0000000001C8', 'Back-to-Office Tech Drive — clearance / vip (456)', 'clearance', 'vip', 'active', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 869680.97, 226117.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-26 17:00:00+05:30', '2025-01-23 23:14:24+05:30'),
('3D000000-0000-0000-0000-0000000001C9', 'Festive Electronics Sale — social / vip (457)', 'social', 'vip', 'active', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 645296.5, 283930.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-04 12:00:00+05:30', '2026-08-05 12:00:00+05:30', '2025-06-07 10:02:44+05:30'),
('3D000000-0000-0000-0000-0000000001CA', 'Weekend Flash Deal — social / at_risk (458)', 'social', 'at_risk', 'active', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-09 01:00:00+05:30', '2025-09-15 18:26:59+05:30'),
('3D000000-0000-0000-0000-0000000001CB', 'VIP Early Access Drop — email / at_risk (459)', 'email', 'at_risk', 'active', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 533194.99, 282593.34, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-14 05:00:00+05:30', '2026-07-29 06:18:17+05:30'),
('3D000000-0000-0000-0000-0000000001CC', 'New Arrivals Spotlight — clearance / regular (460)', 'clearance', 'regular', 'active', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 344921.18, 62085.81, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 20:00:00+05:30', '2026-01-19 13:21:02+05:30'),
('3D000000-0000-0000-0000-0000000001CD', 'Clearance Blast — clearance / vip (461)', 'clearance', 'vip', 'active', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 587032.11, 264164.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 02:00:00+05:30', '2025-07-29 04:57:18+05:30'),
('3D000000-0000-0000-0000-0000000001CE', 'Re-engagement Comeback Offer — email / regular (462)', 'email', 'regular', 'active', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 627824.43, 62782.44, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-19 05:00:00+05:30', '2025-10-27 12:14:49+05:30'),
('3D000000-0000-0000-0000-0000000001CF', 'Diwali Mega Sale — clearance / all (463)', 'clearance', 'all', 'active', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 52568.37, 9987.99, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-16 12:00:00+05:30', '2025-05-08 18:03:02+05:30'),
('3D000000-0000-0000-0000-0000000001D0', 'Monsoon Gadget Deals — social / standard (464)', 'social', 'standard', 'active', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 857090.64, 291410.82, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-14 00:00:00+05:30', '2025-07-01 16:21:25+05:30'),
('3D000000-0000-0000-0000-0000000001D1', 'Loyalty Reward Campaign — re_engagement / at_risk (465)', 're_engagement', 'at_risk', 'active', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 764594.06, 435818.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 23:00:00+05:30', '2025-03-05 15:34:19+05:30'),
('3D000000-0000-0000-0000-0000000001D2', 'Cart Abandonment Winback — social / at_risk (466)', 'social', 'at_risk', 'active', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 96700.48, 31911.16, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-21 12:00:00+05:30', '2026-05-23 13:46:27+05:30'),
('3D000000-0000-0000-0000-0000000001D3', 'Festive Audio Week — social / regular (467)', 'social', 'regular', 'active', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 21:00:00+05:30', '2025-12-31 02:54:58+05:30'),
('3D000000-0000-0000-0000-0000000001D4', 'Back-to-Office Tech Drive — social / all (468)', 'social', 'all', 'active', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 131389.82, 38103.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-11 23:00:00+05:30', '2026-06-20 19:40:02+05:30'),
('3D000000-0000-0000-0000-0000000001D5', 'Festive Electronics Sale — email / regular (469)', 'email', 'regular', 'active', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-03 23:00:00+05:30', '2025-10-25 20:27:15+05:30'),
('3D000000-0000-0000-0000-0000000001D6', 'Weekend Flash Deal — re_engagement / all (470)', 're_engagement', 'all', 'active', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 20:00:00+05:30', '2025-02-02 19:18:02+05:30'),
('3D000000-0000-0000-0000-0000000001D7', 'VIP Early Access Drop — clearance / at_risk (471)', 'clearance', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 106432.31, 69181, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-10 03:00:00+05:30', '2026-05-03 21:32:07+05:30'),
('3D000000-0000-0000-0000-0000000001D8', 'New Arrivals Spotlight — re_engagement / at_risk (472)', 're_engagement', 'at_risk', 'active', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-19 22:00:00+05:30', '2026-05-29 19:35:43+05:30'),
('3D000000-0000-0000-0000-0000000001D9', 'Clearance Blast — re_engagement / all (473)', 're_engagement', 'all', 'active', 'Just For You — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 02:00:00+05:30', '2025-02-21 20:16:21+05:30'),
('3D000000-0000-0000-0000-0000000001DA', 'Re-engagement Comeback Offer — re_engagement / standard (474)', 're_engagement', 'standard', 'active', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', '2026-08-14 05:00:00+05:30', '2026-03-31 20:03:57+05:30'),
('3D000000-0000-0000-0000-0000000001DB', 'Diwali Mega Sale — social / at_risk (475)', 'social', 'at_risk', 'active', 'Just For You — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 141985.7, 70992.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 09:00:00+05:30', '2026-02-28 09:53:50+05:30'),
('3D000000-0000-0000-0000-0000000001DC', 'Monsoon Gadget Deals — social / vip (476)', 'social', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 488035.95, 126889.35, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-05 12:00:00+05:30', '2026-05-17 11:15:22+05:30'),
('3D000000-0000-0000-0000-0000000001DD', 'Loyalty Reward Campaign — clearance / regular (477)', 'clearance', 'regular', 'active', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-02 18:00:00+05:30', '2026-05-10 01:06:06+05:30'),
('3D000000-0000-0000-0000-0000000001DE', 'Cart Abandonment Winback — email / at_risk (478)', 'email', 'at_risk', 'active', 'Just For You — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 563940.94, 146624.64, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-10 19:00:00+05:30', '2025-03-03 03:50:43+05:30'),
('3D000000-0000-0000-0000-0000000001DF', 'Festive Audio Week — re_engagement / regular (479)', 're_engagement', 'regular', 'active', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 115515.78, 21948, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-11 04:00:00+05:30', '2026-04-25 01:29:11+05:30'),
('3D000000-0000-0000-0000-0000000001E0', 'Back-to-Office Tech Drive — re_engagement / standard (480)', 're_engagement', 'standard', 'active', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 888651.25, 604282.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 09:00:00+05:30', '2026-03-31 19:25:16+05:30'),
('3D000000-0000-0000-0000-0000000001E1', 'Festive Electronics Sale — re_engagement / vip (481)', 're_engagement', 'vip', 'active', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 879190, 492346.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-26 14:00:00+05:30', '2026-03-20 17:05:11+05:30'),
('3D000000-0000-0000-0000-0000000001E2', 'Weekend Flash Deal — email / vip (482)', 'email', 'vip', 'active', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 594267.66, 130738.89, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-31 02:00:00+05:30', '2026-06-25 01:12:39+05:30'),
('3D000000-0000-0000-0000-0000000001E3', 'VIP Early Access Drop — re_engagement / all (483)', 're_engagement', 'all', 'active', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 528510.29, 200833.91, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-26 09:00:00+05:30', '2026-06-11 06:00:02+05:30'),
('3D000000-0000-0000-0000-0000000001E4', 'New Arrivals Spotlight — email / regular (484)', 'email', 'regular', 'active', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 477453.47, 57294.42, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 00:00:00+05:30', '2025-12-04 11:09:52+05:30'),
('3D000000-0000-0000-0000-0000000001E5', 'Clearance Blast — re_engagement / vip (485)', 're_engagement', 'vip', 'active', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 121044.75, 12104.48, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 02:00:00+05:30', '2025-01-23 17:56:33+05:30'),
('3D000000-0000-0000-0000-0000000001E6', 'Re-engagement Comeback Offer — email / at_risk (486)', 'email', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 278988.17, 41848.23, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-26 04:00:00+05:30', '2026-02-11 07:00:31+05:30'),
('3D000000-0000-0000-0000-0000000001E7', 'Diwali Mega Sale — clearance / standard (487)', 'clearance', 'standard', 'active', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 43177.11, 9067.19, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 06:00:00+05:30', '2026-06-01 22:05:25+05:30'),
('3D000000-0000-0000-0000-0000000001E8', 'Monsoon Gadget Deals — clearance / vip (488)', 'clearance', 'vip', 'active', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 269578.54, 175226.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-31 06:00:00+05:30', '2025-11-18 12:09:25+05:30'),
('3D000000-0000-0000-0000-0000000001E9', 'Loyalty Reward Campaign — clearance / regular (489)', 'clearance', 'regular', 'active', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 52431.77, 14156.58, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-12 15:00:00+05:30', '2026-02-11 16:42:45+05:30'),
('3D000000-0000-0000-0000-0000000001EA', 'Cart Abandonment Winback — email / vip (490)', 'email', 'vip', 'active', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 303745.55, 103273.49, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-30 05:00:00+05:30', '2026-07-13 07:07:15+05:30'),
('3D000000-0000-0000-0000-0000000001EB', 'Festive Audio Week — email / standard (491)', 'email', 'standard', 'active', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 739846.39, 510494.01, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-07 12:00:00+05:30', '2026-08-08 09:00:00+05:30', '2026-05-21 17:43:07+05:30'),
('3D000000-0000-0000-0000-0000000001EC', 'Back-to-Office Tech Drive — social / all (492)', 'social', 'all', 'active', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-15 12:00:00+05:30', '2026-01-28 10:07:15+05:30'),
('3D000000-0000-0000-0000-0000000001ED', 'Festive Electronics Sale — email / vip (493)', 'email', 'vip', 'active', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 283548.66, 45367.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-10 00:00:00+05:30', '2026-06-14 06:51:28+05:30'),
('3D000000-0000-0000-0000-0000000001EE', 'Weekend Flash Deal — clearance / vip (494)', 'clearance', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 303519.5, 97126.24, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-17 12:00:00+05:30', '2025-10-25 19:28:43+05:30'),
('3D000000-0000-0000-0000-0000000001EF', 'VIP Early Access Drop — social / vip (495)', 'social', 'vip', 'active', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 421477.5, 67436.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-17 17:00:00+05:30', '2025-03-05 07:42:40+05:30'),
('3D000000-0000-0000-0000-0000000001F0', 'New Arrivals Spotlight — social / all (496)', 'social', 'all', 'active', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 307067.83, 85978.99, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 05:00:00+05:30', '2026-03-18 20:54:27+05:30'),
('3D000000-0000-0000-0000-0000000001F1', 'Clearance Blast — re_engagement / vip (497)', 're_engagement', 'vip', 'active', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 742697.76, 200528.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-10 04:00:00+05:30', '2026-04-30 17:33:12+05:30'),
('3D000000-0000-0000-0000-0000000001F2', 'Re-engagement Comeback Offer — re_engagement / standard (498)', 're_engagement', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 12:00:00+05:30', '2026-07-05 12:36:39+05:30'),
('3D000000-0000-0000-0000-0000000001F3', 'Diwali Mega Sale — social / standard (499)', 'social', 'standard', 'active', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 48841.84, 33212.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-18 21:00:00+05:30', '2026-01-18 03:27:15+05:30'),
('3D000000-0000-0000-0000-0000000001F4', 'Monsoon Gadget Deals — email / vip (500)', 'email', 'vip', 'active', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 261953.22, 123118.01, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 12:00:00+05:30', '2025-04-29 15:27:20+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-0000000001F5', 'Loyalty Reward Campaign — email / standard (501)', 'email', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 197416.58, 102656.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-07 07:00:00+05:30', '2025-08-29 21:32:03+05:30'),
('3D000000-0000-0000-0000-0000000001F6', 'Cart Abandonment Winback — clearance / all (502)', 'clearance', 'all', 'active', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 798484.29, 367302.77, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-08 23:00:00+05:30', '2025-03-09 14:43:29+05:30'),
('3D000000-0000-0000-0000-0000000001F7', 'Festive Audio Week — clearance / all (503)', 'clearance', 'all', 'active', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 53300.16, 34112.1, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', '2026-08-15 07:00:00+05:30', '2026-02-03 15:13:17+05:30'),
('3D000000-0000-0000-0000-0000000001F8', 'Back-to-Office Tech Drive — social / at_risk (504)', 'social', 'at_risk', 'active', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 187350.72, 123651.48, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 23:00:00+05:30', '2025-02-14 22:48:05+05:30'),
('3D000000-0000-0000-0000-0000000001F9', 'Festive Electronics Sale — re_engagement / standard (505)', 're_engagement', 'standard', 'active', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-17 23:00:00+05:30', '2026-06-22 22:02:32+05:30'),
('3D000000-0000-0000-0000-0000000001FA', 'Weekend Flash Deal — email / standard (506)', 'email', 'standard', 'active', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 465374.42, 232687.21, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-20 10:00:00+05:30', '2025-05-12 21:16:16+05:30'),
('3D000000-0000-0000-0000-0000000001FB', 'VIP Early Access Drop — social / regular (507)', 'social', 'regular', 'active', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 491752.17, 250793.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 02:00:00+05:30', '2026-06-07 02:11:10+05:30'),
('3D000000-0000-0000-0000-0000000001FC', 'New Arrivals Spotlight — email / vip (508)', 'email', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 192751.69, 48187.92, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-18 01:00:00+05:30', '2025-12-22 05:54:51+05:30'),
('3D000000-0000-0000-0000-0000000001FD', 'Clearance Blast — clearance / regular (509)', 'clearance', 'regular', 'active', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 82589.78, 25602.83, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 04:00:00+05:30', '2026-04-23 19:55:28+05:30'),
('3D000000-0000-0000-0000-0000000001FE', 'Re-engagement Comeback Offer — email / at_risk (510)', 'email', 'at_risk', 'active', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 870648.67, 478856.77, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-09 00:00:00+05:30', '2025-09-27 18:56:06+05:30'),
('3D000000-0000-0000-0000-0000000001FF', 'Diwali Mega Sale — social / all (511)', 'social', 'all', 'active', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 167264.09, 102031.09, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-26 20:00:00+05:30', '2025-11-11 08:06:26+05:30'),
('3D000000-0000-0000-0000-000000000200', 'Monsoon Gadget Deals — email / regular (512)', 'email', 'regular', 'active', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-02 15:00:00+05:30', '2025-06-17 09:12:53+05:30'),
('3D000000-0000-0000-0000-000000000201', 'Loyalty Reward Campaign — clearance / all (513)', 'clearance', 'all', 'active', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 309038.88, 108163.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-11 21:00:00+05:30', '2026-06-26 22:37:32+05:30'),
('3D000000-0000-0000-0000-000000000202', 'Cart Abandonment Winback — email / at_risk (514)', 'email', 'at_risk', 'active', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 673740.75, 451406.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-04 05:00:00+05:30', '2025-03-28 05:48:47+05:30'),
('3D000000-0000-0000-0000-000000000203', 'Festive Audio Week — email / standard (515)', 'email', 'standard', 'active', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 96317.9, 29858.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-02 07:00:00+05:30', '2025-11-25 00:21:03+05:30'),
('3D000000-0000-0000-0000-000000000204', 'Back-to-Office Tech Drive — social / standard (516)', 'social', 'standard', 'active', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 160650.43, 30523.58, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 12:00:00+05:30', '2026-08-09 11:32:04+05:30'),
('3D000000-0000-0000-0000-000000000205', 'Festive Electronics Sale — re_engagement / all (517)', 're_engagement', 'all', 'active', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-13 11:00:00+05:30', '2026-06-16 21:02:57+05:30'),
('3D000000-0000-0000-0000-000000000206', 'Weekend Flash Deal — clearance / regular (518)', 'clearance', 'regular', 'active', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 307619.25, 49219.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-11 12:00:00+05:30', '2026-08-12 10:00:00+05:30', '2026-01-01 02:58:57+05:30'),
('3D000000-0000-0000-0000-000000000207', 'VIP Early Access Drop — re_engagement / standard (519)', 're_engagement', 'standard', 'active', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 01:00:00+05:30', '2026-06-03 03:44:30+05:30'),
('3D000000-0000-0000-0000-000000000208', 'New Arrivals Spotlight — re_engagement / all (520)', 're_engagement', 'all', 'active', 'Just For You — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 131030.4, 82549.15, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-19 01:00:00+05:30', '2025-07-21 12:42:18+05:30'),
('3D000000-0000-0000-0000-000000000209', 'Clearance Blast — email / standard (521)', 'email', 'standard', 'active', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 545423.06, 169081.15, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-30 11:00:00+05:30', '2025-08-24 18:48:19+05:30'),
('3D000000-0000-0000-0000-00000000020A', 'Re-engagement Comeback Offer — clearance / at_risk (522)', 'clearance', 'at_risk', 'active', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 220938.29, 88375.32, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-12 21:00:00+05:30', '2025-07-26 11:12:26+05:30'),
('3D000000-0000-0000-0000-00000000020B', 'Diwali Mega Sale — re_engagement / standard (523)', 're_engagement', 'standard', 'active', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 294981.26, 100293.63, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 02:00:00+05:30', '2025-04-06 00:16:37+05:30'),
('3D000000-0000-0000-0000-00000000020C', 'Monsoon Gadget Deals — re_engagement / all (524)', 're_engagement', 'all', 'active', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-03 16:00:00+05:30', '2026-06-06 10:17:15+05:30'),
('3D000000-0000-0000-0000-00000000020D', 'Loyalty Reward Campaign — re_engagement / at_risk (525)', 're_engagement', 'at_risk', 'active', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 208245.68, 93710.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-20 06:00:00+05:30', '2026-02-17 11:54:22+05:30'),
('3D000000-0000-0000-0000-00000000020E', 'Cart Abandonment Winback — social / at_risk (526)', 'social', 'at_risk', 'active', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 454082.05, 54489.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 03:00:00+05:30', '2025-06-02 01:32:48+05:30'),
('3D000000-0000-0000-0000-00000000020F', 'Festive Audio Week — clearance / vip (527)', 'clearance', 'vip', 'active', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 530805.77, 345023.75, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-06 04:00:00+05:30', '2025-01-15 22:09:03+05:30'),
('3D000000-0000-0000-0000-000000000210', 'Back-to-Office Tech Drive — re_engagement / vip (528)', 're_engagement', 'vip', 'active', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 67362.65, 37049.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 03:00:00+05:30', '2026-03-14 14:11:12+05:30'),
('3D000000-0000-0000-0000-000000000211', 'Festive Electronics Sale — clearance / at_risk (529)', 'clearance', 'at_risk', 'active', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 196149.25, 84344.18, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 17:00:00+05:30', '2026-01-29 08:45:38+05:30'),
('3D000000-0000-0000-0000-000000000212', 'Weekend Flash Deal — clearance / all (530)', 'clearance', 'all', 'active', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 443109.79, 225985.99, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 16:00:00+05:30', '2026-06-08 01:18:38+05:30'),
('3D000000-0000-0000-0000-000000000213', 'VIP Early Access Drop — email / at_risk (531)', 'email', 'at_risk', 'active', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 273714.48, 142331.53, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 22:00:00+05:30', '2025-05-16 14:14:48+05:30'),
('3D000000-0000-0000-0000-000000000214', 'New Arrivals Spotlight — social / regular (532)', 'social', 'regular', 'active', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-27 12:00:00+05:30', '2026-07-28 02:00:00+05:30', '2025-06-25 22:12:15+05:30'),
('3D000000-0000-0000-0000-000000000215', 'Clearance Blast — re_engagement / vip (533)', 're_engagement', 'vip', 'active', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-18 13:00:00+05:30', '2025-05-28 06:18:10+05:30'),
('3D000000-0000-0000-0000-000000000216', 'Re-engagement Comeback Offer — social / at_risk (534)', 'social', 'at_risk', 'active', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-07 12:00:00+05:30', '2026-08-07 16:00:00+05:30', '2025-01-21 05:44:24+05:30'),
('3D000000-0000-0000-0000-000000000217', 'Diwali Mega Sale — email / vip (535)', 'email', 'vip', 'active', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 703600.66, 436232.41, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-10 15:00:00+05:30', '2026-08-07 06:49:45+05:30'),
('3D000000-0000-0000-0000-000000000218', 'Monsoon Gadget Deals — email / standard (536)', 'email', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 350787.62, 157854.43, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-09 18:00:00+05:30', '2026-01-18 00:46:36+05:30'),
('3D000000-0000-0000-0000-000000000219', 'Loyalty Reward Campaign — clearance / regular (537)', 'clearance', 'regular', 'active', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 125723.86, 33945.44, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-04 05:00:00+05:30', '2026-07-16 08:03:59+05:30'),
('3D000000-0000-0000-0000-00000000021A', 'Cart Abandonment Winback — social / standard (538)', 'social', 'standard', 'active', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 392540.23, 90284.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-14 12:00:00+05:30', '2026-08-14 22:00:00+05:30', '2025-01-08 20:39:51+05:30'),
('3D000000-0000-0000-0000-00000000021B', 'Festive Audio Week — re_engagement / regular (539)', 're_engagement', 'regular', 'active', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 351663.33, 66816.03, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-03 08:00:00+05:30', '2026-01-19 15:42:36+05:30'),
('3D000000-0000-0000-0000-00000000021C', 'Back-to-Office Tech Drive — email / all (540)', 'email', 'all', 'active', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 21:00:00+05:30', '2025-10-27 18:51:14+05:30'),
('3D000000-0000-0000-0000-00000000021D', 'Festive Electronics Sale — clearance / regular (541)', 'clearance', 'regular', 'active', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-04 03:00:00+05:30', '2025-12-11 04:07:42+05:30'),
('3D000000-0000-0000-0000-00000000021E', 'Weekend Flash Deal — social / standard (542)', 'social', 'standard', 'active', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 693488.3, 319004.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 02:00:00+05:30', '2025-12-19 04:40:58+05:30'),
('3D000000-0000-0000-0000-00000000021F', 'VIP Early Access Drop — clearance / regular (543)', 'clearance', 'regular', 'active', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 458850.27, 64239.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-09 12:00:00+05:30', '2026-08-09 23:00:00+05:30', '2025-02-18 05:08:36+05:30'),
('3D000000-0000-0000-0000-000000000220', 'New Arrivals Spotlight — social / all (544)', 'social', 'all', 'active', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 507005.36, 172381.82, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 00:00:00+05:30', '2025-12-16 12:48:09+05:30'),
('3D000000-0000-0000-0000-000000000221', 'Clearance Blast — re_engagement / regular (545)', 're_engagement', 'regular', 'active', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 473195.97, 80443.31, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 00:00:00+05:30', '2025-06-26 22:29:49+05:30'),
('3D000000-0000-0000-0000-000000000222', 'Re-engagement Comeback Offer — clearance / all (546)', 'clearance', 'all', 'active', 'Just For You — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 213326.04, 119462.58, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 18:00:00+05:30', '2026-02-02 13:59:10+05:30'),
('3D000000-0000-0000-0000-000000000223', 'Diwali Mega Sale — social / vip (547)', 'social', 'vip', 'active', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 827928.52, 554712.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-08 12:00:00+05:30', '2026-08-09 11:00:00+05:30', '2025-07-10 21:12:25+05:30'),
('3D000000-0000-0000-0000-000000000224', 'Monsoon Gadget Deals — re_engagement / vip (548)', 're_engagement', 'vip', 'active', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 386675.02, 204937.76, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 01:00:00+05:30', '2025-11-24 21:36:27+05:30'),
('3D000000-0000-0000-0000-000000000225', 'Loyalty Reward Campaign — re_engagement / regular (549)', 're_engagement', 'regular', 'active', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-24 14:00:00+05:30', '2025-12-30 15:19:45+05:30'),
('3D000000-0000-0000-0000-000000000226', 'Cart Abandonment Winback — re_engagement / regular (550)', 're_engagement', 'regular', 'active', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 310035.68, 189121.76, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-29 16:00:00+05:30', '2025-07-05 09:11:47+05:30'),
('3D000000-0000-0000-0000-000000000227', 'Festive Audio Week — social / standard (551)', 'social', 'standard', 'active', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 394728.85, 55262.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-04 04:00:00+05:30', '2025-01-04 17:25:10+05:30'),
('3D000000-0000-0000-0000-000000000228', 'Back-to-Office Tech Drive — email / at_risk (552)', 'email', 'at_risk', 'active', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 549930.91, 357455.09, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-07-31 16:00:00+05:30', '2025-05-16 00:11:48+05:30'),
('3D000000-0000-0000-0000-000000000229', 'Festive Electronics Sale — email / at_risk (553)', 'email', 'at_risk', 'active', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 853726.26, 392714.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 17:00:00+05:30', '2025-02-07 14:18:53+05:30'),
('3D000000-0000-0000-0000-00000000022A', 'Weekend Flash Deal — email / vip (554)', 'email', 'vip', 'active', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-02 06:00:00+05:30', '2025-02-22 10:07:57+05:30'),
('3D000000-0000-0000-0000-00000000022B', 'VIP Early Access Drop — clearance / at_risk (555)', 'clearance', 'at_risk', 'active', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 724515.69, 463690.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', '2026-08-13 13:00:00+05:30', '2026-06-18 22:34:41+05:30'),
('3D000000-0000-0000-0000-00000000022C', 'New Arrivals Spotlight — social / vip (556)', 'social', 'vip', 'active', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 870520, 261156, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 08:00:00+05:30', '2025-06-02 03:03:49+05:30'),
('3D000000-0000-0000-0000-00000000022D', 'Clearance Blast — re_engagement / regular (557)', 're_engagement', 'regular', 'active', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 885796.13, 540335.64, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-04 12:00:00+05:30', '2026-08-04 16:00:00+05:30', '2025-02-09 02:18:39+05:30'),
('3D000000-0000-0000-0000-00000000022E', 'Re-engagement Comeback Offer — email / vip (558)', 'email', 'vip', 'active', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-07 12:00:00+05:30', '2026-08-07 19:00:00+05:30', '2026-07-27 00:24:55+05:30'),
('3D000000-0000-0000-0000-00000000022F', 'Diwali Mega Sale — email / regular (559)', 'email', 'regular', 'active', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 320528.15, 144237.67, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 00:00:00+05:30', '2025-04-28 11:57:21+05:30'),
('3D000000-0000-0000-0000-000000000230', 'Monsoon Gadget Deals — email / all (560)', 'email', 'all', 'active', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 778149.56, 311259.82, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-17 19:00:00+05:30', '2025-03-05 20:57:20+05:30'),
('3D000000-0000-0000-0000-000000000231', 'Loyalty Reward Campaign — clearance / at_risk (561)', 'clearance', 'at_risk', 'active', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-25 19:00:00+05:30', '2026-08-05 14:53:10+05:30'),
('3D000000-0000-0000-0000-000000000232', 'Cart Abandonment Winback — email / at_risk (562)', 'email', 'at_risk', 'active', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 417559.37, 267238, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 12:00:00+05:30', '2025-11-26 12:30:10+05:30'),
('3D000000-0000-0000-0000-000000000233', 'Festive Audio Week — re_engagement / vip (563)', 're_engagement', 'vip', 'active', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 330175.68, 49526.35, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 07:00:00+05:30', '2025-12-13 22:42:55+05:30'),
('3D000000-0000-0000-0000-000000000234', 'Back-to-Office Tech Drive — social / at_risk (564)', 'social', 'at_risk', 'active', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-11 00:00:00+05:30', '2025-06-22 23:12:23+05:30'),
('3D000000-0000-0000-0000-000000000235', 'Festive Electronics Sale — social / vip (565)', 'social', 'vip', 'active', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 348775.76, 198802.18, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-27 01:00:00+05:30', '2025-11-28 10:22:16+05:30'),
('3D000000-0000-0000-0000-000000000236', 'Weekend Flash Deal — email / at_risk (566)', 'email', 'at_risk', 'active', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 661606.04, 410195.74, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-17 05:00:00+05:30', '2025-03-20 05:04:43+05:30'),
('3D000000-0000-0000-0000-000000000237', 'VIP Early Access Drop — re_engagement / regular (567)', 're_engagement', 'regular', 'active', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 403314.46, 56464.02, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-07 12:00:00+05:30', '2026-08-08 10:00:00+05:30', '2025-07-25 20:57:14+05:30'),
('3D000000-0000-0000-0000-000000000238', 'New Arrivals Spotlight — email / at_risk (568)', 'email', 'at_risk', 'active', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 21502.34, 9891.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-03 00:00:00+05:30', '2026-02-27 01:22:47+05:30'),
('3D000000-0000-0000-0000-000000000239', 'Clearance Blast — clearance / standard (569)', 'clearance', 'standard', 'active', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-05 20:00:00+05:30', '2025-11-13 00:33:59+05:30'),
('3D000000-0000-0000-0000-00000000023A', 'Re-engagement Comeback Offer — re_engagement / regular (570)', 're_engagement', 'regular', 'active', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 840437.88, 546284.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 12:00:00+05:30', '2025-08-12 09:23:31+05:30'),
('3D000000-0000-0000-0000-00000000023B', 'Diwali Mega Sale — clearance / standard (571)', 'clearance', 'standard', 'active', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 19172.68, 9969.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 03:00:00+05:30', '2025-01-06 06:00:37+05:30'),
('3D000000-0000-0000-0000-00000000023C', 'Monsoon Gadget Deals — re_engagement / vip (572)', 're_engagement', 'vip', 'active', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-07-31 19:00:00+05:30', '2026-03-17 17:26:12+05:30'),
('3D000000-0000-0000-0000-00000000023D', 'Loyalty Reward Campaign — clearance / vip (573)', 'clearance', 'vip', 'active', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-13 12:00:00+05:30', '2026-08-13 23:00:00+05:30', '2025-11-15 20:15:36+05:30'),
('3D000000-0000-0000-0000-00000000023E', 'Cart Abandonment Winback — email / all (574)', 'email', 'all', 'active', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 232231.14, 155594.86, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-27 12:00:00+05:30', '2026-07-27 21:00:00+05:30', '2025-09-09 07:11:13+05:30'),
('3D000000-0000-0000-0000-00000000023F', 'Festive Audio Week — social / all (575)', 'social', 'all', 'active', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 82163.18, 37795.06, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 21:00:00+05:30', '2025-10-12 05:30:38+05:30'),
('3D000000-0000-0000-0000-000000000240', 'Back-to-Office Tech Drive — email / regular (576)', 'email', 'regular', 'active', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 381882.65, 118383.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-18 21:00:00+05:30', '2025-03-21 17:36:51+05:30'),
('3D000000-0000-0000-0000-000000000241', 'Festive Electronics Sale — re_engagement / vip (577)', 're_engagement', 'vip', 'active', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 356960.07, 103518.42, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-18 11:00:00+05:30', '2025-08-03 21:57:45+05:30'),
('3D000000-0000-0000-0000-000000000242', 'Weekend Flash Deal — clearance / regular (578)', 'clearance', 'regular', 'active', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 155793.46, 73222.93, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-10 12:00:00+05:30', '2026-08-11 03:00:00+05:30', '2025-02-07 09:00:17+05:30'),
('3D000000-0000-0000-0000-000000000243', 'VIP Early Access Drop — email / regular (579)', 'email', 'regular', 'active', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 674843.93, 141717.23, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-22 23:00:00+05:30', '2026-01-09 22:49:53+05:30'),
('3D000000-0000-0000-0000-000000000244', 'New Arrivals Spotlight — clearance / all (580)', 'clearance', 'all', 'active', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 271583.63, 78759.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 22:00:00+05:30', '2026-07-23 18:44:54+05:30'),
('3D000000-0000-0000-0000-000000000245', 'Clearance Blast — re_engagement / at_risk (581)', 're_engagement', 'at_risk', 'active', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-28 12:00:00+05:30', '2026-06-30 07:48:55+05:30'),
('3D000000-0000-0000-0000-000000000246', 'Re-engagement Comeback Offer — social / regular (582)', 'social', 'regular', 'active', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-07 11:00:00+05:30', '2025-08-27 14:12:20+05:30'),
('3D000000-0000-0000-0000-000000000247', 'Diwali Mega Sale — clearance / vip (583)', 'clearance', 'vip', 'active', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-17 12:00:00+05:30', '2026-07-18 09:00:00+05:30', '2026-02-25 07:42:40+05:30'),
('3D000000-0000-0000-0000-000000000248', 'Monsoon Gadget Deals — re_engagement / standard (584)', 're_engagement', 'standard', 'active', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 619753.86, 365654.78, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-22 22:00:00+05:30', '2026-05-23 05:46:17+05:30'),
('3D000000-0000-0000-0000-000000000249', 'Loyalty Reward Campaign — re_engagement / standard (585)', 're_engagement', 'standard', 'active', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 600054.94, 420038.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-07-31 13:00:00+05:30', '2025-12-12 14:28:33+05:30'),
('3D000000-0000-0000-0000-00000000024A', 'Cart Abandonment Winback — re_engagement / regular (586)', 're_engagement', 'regular', 'active', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-22 19:00:00+05:30', '2025-05-27 03:53:23+05:30'),
('3D000000-0000-0000-0000-00000000024B', 'Festive Audio Week — email / standard (587)', 'email', 'standard', 'active', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 302006.36, 72481.53, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 21:00:00+05:30', '2026-03-20 03:36:22+05:30'),
('3D000000-0000-0000-0000-00000000024C', 'Back-to-Office Tech Drive — clearance / regular (588)', 'clearance', 'regular', 'active', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 715464.91, 472206.84, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-20 02:00:00+05:30', '2025-05-25 03:32:04+05:30'),
('3D000000-0000-0000-0000-00000000024D', 'Festive Electronics Sale — email / all (589)', 'email', 'all', 'active', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 06:00:00+05:30', '2025-11-13 00:32:26+05:30'),
('3D000000-0000-0000-0000-00000000024E', 'Weekend Flash Deal — clearance / at_risk (590)', 'clearance', 'at_risk', 'active', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 10:00:00+05:30', '2026-05-02 15:19:51+05:30'),
('3D000000-0000-0000-0000-00000000024F', 'VIP Early Access Drop — clearance / standard (591)', 'clearance', 'standard', 'active', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 562895.33, 264560.81, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-16 12:00:00+05:30', '2025-08-20 05:57:56+05:30'),
('3D000000-0000-0000-0000-000000000250', 'New Arrivals Spotlight — social / all (592)', 'social', 'all', 'active', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 12:00:00+05:30', '2025-03-12 13:07:14+05:30'),
('3D000000-0000-0000-0000-000000000251', 'Clearance Blast — clearance / standard (593)', 'clearance', 'standard', 'active', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-21 00:00:00+05:30', '2026-06-16 09:31:56+05:30'),
('3D000000-0000-0000-0000-000000000252', 'Re-engagement Comeback Offer — social / standard (594)', 'social', 'standard', 'active', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 89286.45, 33928.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-12 13:00:00+05:30', '2025-04-15 09:28:12+05:30'),
('3D000000-0000-0000-0000-000000000253', 'Diwali Mega Sale — clearance / vip (595)', 'clearance', 'vip', 'active', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 03:00:00+05:30', '2026-04-21 09:29:13+05:30'),
('3D000000-0000-0000-0000-000000000254', 'Monsoon Gadget Deals — email / at_risk (596)', 'email', 'at_risk', 'active', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 67000.4, 44220.26, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-02 12:00:00+05:30', '2025-12-20 05:04:50+05:30'),
('3D000000-0000-0000-0000-000000000255', 'Loyalty Reward Campaign — social / all (597)', 'social', 'all', 'active', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 574561.13, 126403.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-13 14:00:00+05:30', '2026-07-08 20:08:12+05:30'),
('3D000000-0000-0000-0000-000000000256', 'Cart Abandonment Winback — re_engagement / vip (598)', 're_engagement', 'vip', 'active', 'Big Savings — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 699859.54, 293941.01, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-27 12:00:00+05:30', '2026-07-28 07:00:00+05:30', '2025-01-05 10:43:16+05:30'),
('3D000000-0000-0000-0000-000000000257', 'Festive Audio Week — re_engagement / standard (599)', 're_engagement', 'standard', 'active', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 06:00:00+05:30', '2025-02-22 01:04:58+05:30'),
('3D000000-0000-0000-0000-000000000258', 'Back-to-Office Tech Drive — clearance / regular (600)', 'clearance', 'regular', 'active', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 176501.96, 100606.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-12 12:00:00+05:30', '2026-08-12 15:00:00+05:30', '2026-02-26 08:01:35+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000259', 'Festive Electronics Sale — re_engagement / vip (601)', 're_engagement', 'vip', 'completed', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 83748.28, 83748.28, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-20 12:00:00+05:30', '2026-07-20 12:00:00+05:30', '2026-06-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025A', 'Weekend Flash Deal — re_engagement / at_risk (602)', 're_engagement', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 352441.93, 338344.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-02 12:00:00+05:30', '2026-07-03 06:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025B', 'VIP Early Access Drop — re_engagement / vip (603)', 're_engagement', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 02:00:00+05:30', '2026-05-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025C', 'New Arrivals Spotlight — clearance / vip (604)', 'clearance', 'vip', 'completed', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 360557.63, 310079.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-09 12:00:00+05:30', '2026-06-09 22:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025D', 'Clearance Blast — clearance / regular (605)', 'clearance', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-27 12:00:00+05:30', '2026-06-28 03:00:00+05:30', '2026-03-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025E', 'Re-engagement Comeback Offer — email / at_risk (606)', 'email', 'at_risk', 'completed', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 205289.59, 199130.9, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-25 12:00:00+05:30', '2026-06-25 20:00:00+05:30', '2026-05-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000025F', 'Diwali Mega Sale — re_engagement / vip (607)', 're_engagement', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 550712.42, 539698.17, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-09 12:00:00+05:30', '2026-05-10 04:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000260', 'Monsoon Gadget Deals — re_engagement / at_risk (608)', 're_engagement', 'at_risk', 'completed', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 570843.84, 559426.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 08:00:00+05:30', '2026-04-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000261', 'Loyalty Reward Campaign — social / standard (609)', 'social', 'standard', 'completed', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 18526.8, 17415.19, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-28 12:00:00+05:30', '2026-05-29 11:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000262', 'Cart Abandonment Winback — email / vip (610)', 'email', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 169475.73, 147443.89, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 09:00:00+05:30', '2026-05-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000263', 'Festive Audio Week — email / regular (611)', 'email', 'regular', 'completed', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 215630.64, 189754.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-12 12:00:00+05:30', '2026-05-12 16:00:00+05:30', '2026-04-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000264', 'Back-to-Office Tech Drive — re_engagement / at_risk (612)', 're_engagement', 'at_risk', 'completed', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 860076.86, 791270.71, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 11:00:00+05:30', '2026-06-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000265', 'Festive Electronics Sale — re_engagement / vip (613)', 're_engagement', 'vip', 'completed', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 476058.84, 409410.6, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-27 12:00:00+05:30', '2026-04-28 05:00:00+05:30', '2026-04-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000266', 'Weekend Flash Deal — social / all (614)', 'social', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 753340.57, 647872.89, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-05 12:00:00+05:30', '2026-07-05 18:00:00+05:30', '2026-06-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000267', 'VIP Early Access Drop — clearance / all (615)', 'clearance', 'all', 'completed', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-04 12:00:00+05:30', '2026-07-05 06:00:00+05:30', '2026-03-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000268', 'New Arrivals Spotlight — clearance / at_risk (616)', 'clearance', 'at_risk', 'completed', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-11 12:00:00+05:30', '2026-05-12 00:00:00+05:30', '2026-05-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000269', 'Clearance Blast — re_engagement / at_risk (617)', 're_engagement', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-06 18:00:00+05:30', '2026-05-22 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026A', 'Re-engagement Comeback Offer — email / regular (618)', 'email', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 166422.77, 143123.58, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-14 12:00:00+05:30', '2026-05-15 03:00:00+05:30', '2026-03-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026B', 'Diwali Mega Sale — re_engagement / regular (619)', 're_engagement', 'regular', 'completed', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 788897.7, 710007.93, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-21 12:00:00+05:30', '2026-06-21 22:00:00+05:30', '2026-05-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026C', 'Monsoon Gadget Deals — social / regular (620)', 'social', 'regular', 'completed', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 468997.17, 431477.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-18 23:00:00+05:30', '2026-05-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026D', 'Loyalty Reward Campaign — clearance / at_risk (621)', 'clearance', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 34985.83, 34286.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-13 19:00:00+05:30', '2026-05-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026E', 'Cart Abandonment Winback — clearance / all (622)', 'clearance', 'all', 'completed', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 564977.23, 497179.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-30 12:00:00+05:30', '2026-05-01 05:00:00+05:30', '2026-04-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000026F', 'Festive Audio Week — re_engagement / regular (623)', 're_engagement', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 881206.08, 881206.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-04 12:00:00+05:30', '2026-07-05 06:00:00+05:30', '2026-03-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000270', 'Back-to-Office Tech Drive — re_engagement / all (624)', 're_engagement', 'all', 'completed', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 680261.79, 666656.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-20 01:00:00+05:30', '2026-04-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000271', 'Festive Electronics Sale — clearance / vip (625)', 'clearance', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 371440.86, 326867.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-18 12:00:00+05:30', '2026-04-18 20:00:00+05:30', '2026-03-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000272', 'Weekend Flash Deal — social / standard (626)', 'social', 'standard', 'completed', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 185788.93, 167210.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-19 12:00:00+05:30', '2026-06-20 03:00:00+05:30', '2026-05-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000273', 'VIP Early Access Drop — re_engagement / regular (627)', 're_engagement', 'regular', 'completed', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 100220.83, 96212, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 16:00:00+05:30', '2026-03-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000274', 'New Arrivals Spotlight — clearance / at_risk (628)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-26 12:00:00+05:30', '2026-06-27 11:00:00+05:30', '2026-04-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000275', 'Clearance Blast — email / vip (629)', 'email', 'vip', 'completed', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-25 12:00:00+05:30', '2026-06-25 14:00:00+05:30', '2026-04-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000276', 'Re-engagement Comeback Offer — email / standard (630)', 'email', 'standard', 'completed', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 161344.41, 156504.08, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-06 12:00:00+05:30', '2026-05-07 03:00:00+05:30', '2026-04-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000277', 'Diwali Mega Sale — clearance / all (631)', 'clearance', 'all', 'completed', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-10 12:00:00+05:30', '2026-07-11 05:00:00+05:30', '2026-05-22 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000278', 'Monsoon Gadget Deals — social / standard (632)', 'social', 'standard', 'completed', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 17422.82, 16203.22, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-19 12:00:00+05:30', '2026-04-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000279', 'Loyalty Reward Campaign — social / vip (633)', 'social', 'vip', 'completed', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-02 12:00:00+05:30', '2026-05-03 07:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027A', 'Cart Abandonment Winback — social / regular (634)', 'social', 'regular', 'completed', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 765400.7, 727130.66, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-04 12:00:00+05:30', '2026-08-04 12:00:00+05:30', '2026-05-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027B', 'Festive Audio Week — clearance / vip (635)', 'clearance', 'vip', 'completed', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 726311.38, 682732.7, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-15 12:00:00+05:30', '2026-04-15 22:00:00+05:30', '2026-05-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027C', 'Back-to-Office Tech Drive — social / standard (636)', 'social', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 57060.02, 50783.42, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-11 12:00:00+05:30', '2026-06-12 11:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027D', 'Festive Electronics Sale — re_engagement / regular (637)', 're_engagement', 'regular', 'completed', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 829323.88, 771271.21, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 09:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027E', 'Weekend Flash Deal — re_engagement / at_risk (638)', 're_engagement', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-30 12:00:00+05:30', '2026-04-30 13:00:00+05:30', '2026-04-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000027F', 'VIP Early Access Drop — social / standard (639)', 'social', 'standard', 'completed', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 807064.52, 758640.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-19 08:00:00+05:30', '2026-04-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000280', 'New Arrivals Spotlight — re_engagement / all (640)', 're_engagement', 'all', 'completed', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 419344.51, 385796.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-10 12:00:00+05:30', '2026-07-10 17:00:00+05:30', '2026-03-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000281', 'Clearance Blast — social / regular (641)', 'social', 'regular', 'completed', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 373098.14, 324595.38, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-03 20:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000282', 'Re-engagement Comeback Offer — social / vip (642)', 'social', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-09 12:00:00+05:30', '2026-06-10 00:00:00+05:30', '2026-05-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000283', 'Diwali Mega Sale — email / standard (643)', 'email', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 732564.35, 681284.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 06:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000284', 'Monsoon Gadget Deals — email / all (644)', 'email', 'all', 'completed', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 147689.15, 128489.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-14 11:00:00+05:30', '2026-04-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000285', 'Loyalty Reward Campaign — email / vip (645)', 'email', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 610260.94, 549234.85, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-28 12:00:00+05:30', '2026-04-29 04:00:00+05:30', '2026-03-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000286', 'Cart Abandonment Winback — re_engagement / all (646)', 're_engagement', 'all', 'completed', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 09:00:00+05:30', '2026-06-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000287', 'Festive Audio Week — re_engagement / standard (647)', 're_engagement', 'standard', 'completed', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-06 12:00:00+05:30', '2026-06-07 06:00:00+05:30', '2026-04-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000288', 'Back-to-Office Tech Drive — social / regular (648)', 'social', 'regular', 'completed', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 687832.6, 680954.27, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-11 12:00:00+05:30', '2026-07-12 10:00:00+05:30', '2026-04-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000289', 'Festive Electronics Sale — re_engagement / vip (649)', 're_engagement', 'vip', 'completed', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 369701.49, 332731.34, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-16 12:00:00+05:30', '2026-04-17 09:00:00+05:30', '2026-05-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028A', 'Weekend Flash Deal — social / regular (650)', 'social', 'regular', 'completed', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 178855.92, 159181.77, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-22 12:00:00+05:30', '2026-06-22 16:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028B', 'VIP Early Access Drop — email / regular (651)', 'email', 'regular', 'completed', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 640269.06, 621060.99, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-30 17:00:00+05:30', '2026-06-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028C', 'New Arrivals Spotlight — social / vip (652)', 'social', 'vip', 'completed', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 287345.85, 270105.1, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-08 12:00:00+05:30', '2026-07-09 10:00:00+05:30', '2026-06-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028D', 'Clearance Blast — social / standard (653)', 'social', 'standard', 'completed', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 650581.08, 637569.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-03 12:00:00+05:30', '2026-05-04 08:00:00+05:30', '2026-05-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028E', 'Re-engagement Comeback Offer — re_engagement / regular (654)', 're_engagement', 'regular', 'completed', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 343641.56, 292095.33, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-21 12:00:00+05:30', '2026-04-22 11:00:00+05:30', '2026-05-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000028F', 'Diwali Mega Sale — social / all (655)', 'social', 'all', 'completed', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 87703.13, 78055.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-05 12:00:00+05:30', '2026-07-06 00:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000290', 'Monsoon Gadget Deals — re_engagement / standard (656)', 're_engagement', 'standard', 'completed', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 753000.13, 722880.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-20 12:00:00+05:30', '2026-05-20 21:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000291', 'Loyalty Reward Campaign — re_engagement / all (657)', 're_engagement', 'all', 'completed', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 523155.84, 465608.7, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-28 12:00:00+05:30', '2026-06-28 18:00:00+05:30', '2026-06-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000292', 'Cart Abandonment Winback — re_engagement / standard (658)', 're_engagement', 'standard', 'completed', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 05:00:00+05:30', '2026-05-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000293', 'Festive Audio Week — clearance / regular (659)', 'clearance', 'regular', 'completed', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-12 12:00:00+05:30', '2026-06-12 20:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000294', 'Back-to-Office Tech Drive — re_engagement / all (660)', 're_engagement', 'all', 'completed', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 25471.33, 25216.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-22 12:00:00+05:30', '2026-04-23 03:00:00+05:30', '2026-05-18 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000295', 'Festive Electronics Sale — email / all (661)', 'email', 'all', 'completed', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-01 12:00:00+05:30', '2026-07-01 14:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000296', 'Weekend Flash Deal — re_engagement / vip (662)', 're_engagement', 'vip', 'completed', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 728142.06, 691734.96, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-17 01:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000297', 'VIP Early Access Drop — re_engagement / all (663)', 're_engagement', 'all', 'completed', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 860906.22, 748988.41, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-23 12:00:00+05:30', '2026-05-23 23:00:00+05:30', '2026-06-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000298', 'New Arrivals Spotlight — clearance / vip (664)', 'clearance', 'vip', 'completed', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 427648.2, 367777.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-15 12:00:00+05:30', '2026-04-16 02:00:00+05:30', '2026-05-18 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000299', 'Clearance Blast — social / at_risk (665)', 'social', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 804897.91, 764653.01, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-12 12:00:00+05:30', '2026-05-13 09:00:00+05:30', '2026-05-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029A', 'Re-engagement Comeback Offer — social / all (666)', 'social', 'all', 'completed', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-19 12:00:00+05:30', '2026-04-20 11:00:00+05:30', '2026-06-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029B', 'Diwali Mega Sale — email / regular (667)', 'email', 'regular', 'completed', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 212090.63, 205727.91, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-25 12:00:00+05:30', '2026-04-26 10:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029C', 'Monsoon Gadget Deals — email / at_risk (668)', 'email', 'at_risk', 'completed', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-25 13:00:00+05:30', '2026-05-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029D', 'Loyalty Reward Campaign — email / standard (669)', 'email', 'standard', 'completed', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 91289.19, 84898.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-03 12:00:00+05:30', '2026-07-03 20:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029E', 'Cart Abandonment Winback — re_engagement / all (670)', 're_engagement', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 22:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000029F', 'Festive Audio Week — clearance / at_risk (671)', 'clearance', 'at_risk', 'completed', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-30 12:00:00+05:30', '2026-05-31 09:00:00+05:30', '2026-06-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A0', 'Back-to-Office Tech Drive — re_engagement / regular (672)', 're_engagement', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-07-31 12:00:00+05:30', '2026-05-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A1', 'Festive Electronics Sale — email / vip (673)', 'email', 'vip', 'completed', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-07 12:00:00+05:30', '2026-05-08 02:00:00+05:30', '2026-03-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A2', 'Weekend Flash Deal — clearance / vip (674)', 'clearance', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 810504.32, 729453.89, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-29 15:00:00+05:30', '2026-05-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A3', 'VIP Early Access Drop — email / standard (675)', 'email', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 369168.61, 358093.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-23 18:00:00+05:30', '2026-05-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A4', 'New Arrivals Spotlight — social / vip (676)', 'social', 'vip', 'completed', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 654238.56, 628069.02, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-10 12:00:00+05:30', '2026-07-10 22:00:00+05:30', '2026-05-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A5', 'Clearance Blast — re_engagement / all (677)', 're_engagement', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 891336.71, 784376.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-26 12:00:00+05:30', '2026-06-27 06:00:00+05:30', '2026-04-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A6', 'Re-engagement Comeback Offer — clearance / at_risk (678)', 'clearance', 'at_risk', 'completed', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-09 12:00:00+05:30', '2026-07-10 12:00:00+05:30', '2026-04-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A7', 'Diwali Mega Sale — social / regular (679)', 'social', 'regular', 'completed', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 311575.21, 305343.71, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-14 12:00:00+05:30', '2026-04-15 04:00:00+05:30', '2026-04-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A8', 'Monsoon Gadget Deals — email / at_risk (680)', 'email', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 314188.31, 270201.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-13 12:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002A9', 'Loyalty Reward Campaign — clearance / at_risk (681)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 127184.24, 109378.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-08 12:00:00+05:30', '2026-05-09 04:00:00+05:30', '2026-03-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AA', 'Cart Abandonment Winback — re_engagement / vip (682)', 're_engagement', 'vip', 'completed', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-11 12:00:00+05:30', '2026-06-11 12:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AB', 'Festive Audio Week — social / all (683)', 'social', 'all', 'completed', 'Limited Time — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-08 12:00:00+05:30', '2026-06-09 03:00:00+05:30', '2026-03-18 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AC', 'Back-to-Office Tech Drive — email / standard (684)', 'email', 'standard', 'completed', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 169488.29, 147454.81, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-11 12:00:00+05:30', '2026-07-12 06:00:00+05:30', '2026-05-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AD', 'Festive Electronics Sale — email / vip (685)', 'email', 'vip', 'completed', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 556527.48, 523135.83, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-07 12:00:00+05:30', '2026-07-08 03:00:00+05:30', '2026-04-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AE', 'Weekend Flash Deal — email / regular (686)', 'email', 'regular', 'completed', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-29 12:00:00+05:30', '2026-04-30 00:00:00+05:30', '2026-04-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002AF', 'VIP Early Access Drop — social / at_risk (687)', 'social', 'at_risk', 'completed', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 519957.99, 509558.83, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-26 12:00:00+05:30', '2026-06-26 13:00:00+05:30', '2026-04-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B0', 'New Arrivals Spotlight — email / standard (688)', 'email', 'standard', 'completed', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-28 20:00:00+05:30', '2026-03-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B1', 'Clearance Blast — email / regular (689)', 'email', 'regular', 'completed', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 247946.2, 238028.35, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-02 12:00:00+05:30', '2026-06-02 23:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B2', 'Re-engagement Comeback Offer — re_engagement / at_risk (690)', 're_engagement', 'at_risk', 'completed', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-18 12:00:00+05:30', '2026-06-18 20:00:00+05:30', '2026-05-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B3', 'Diwali Mega Sale — email / all (691)', 'email', 'all', 'completed', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 756493.88, 726234.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-26 12:00:00+05:30', '2026-05-27 01:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B4', 'Monsoon Gadget Deals — re_engagement / at_risk (692)', 're_engagement', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 712877.87, 634461.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 05:00:00+05:30', '2026-05-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B5', 'Loyalty Reward Campaign — re_engagement / all (693)', 're_engagement', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-16 12:00:00+05:30', '2026-05-16 19:00:00+05:30', '2026-05-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B6', 'Cart Abandonment Winback — social / regular (694)', 'social', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-25 14:00:00+05:30', '2026-05-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B7', 'Festive Audio Week — social / regular (695)', 'social', 'regular', 'completed', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 529628.76, 476665.88, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-15 12:00:00+05:30', '2026-05-16 09:00:00+05:30', '2026-04-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B8', 'Back-to-Office Tech Drive — email / at_risk (696)', 'email', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 787855.8, 701191.66, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-19 12:00:00+05:30', '2026-04-20 05:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002B9', 'Festive Electronics Sale — re_engagement / standard (697)', 're_engagement', 'standard', 'completed', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 652436.79, 639388.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-11 12:00:00+05:30', '2026-07-11 18:00:00+05:30', '2026-06-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002BA', 'Weekend Flash Deal — email / regular (698)', 'email', 'regular', 'completed', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-08 12:00:00+05:30', '2026-05-09 03:00:00+05:30', '2026-05-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002BB', 'VIP Early Access Drop — re_engagement / vip (699)', 're_engagement', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 491011.79, 481191.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-17 12:00:00+05:30', '2026-05-17 13:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002BC', 'New Arrivals Spotlight — email / regular (700)', 'email', 'regular', 'completed', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 108775.7, 101161.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-28 12:00:00+05:30', '2026-04-29 01:00:00+05:30', '2026-05-15 12:00:00+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-0000000002BD', 'Clearance Blast — email / at_risk (701)', 'email', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 782020.14, 680357.52, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-06 14:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002BE', 'Re-engagement Comeback Offer — clearance / vip (702)', 'clearance', 'vip', 'completed', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 363796.07, 352882.19, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-17 12:00:00+05:30', '2026-06-18 10:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002BF', 'Diwali Mega Sale — clearance / vip (703)', 'clearance', 'vip', 'completed', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 855293.26, 786869.8, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-19 13:00:00+05:30', '2026-04-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C0', 'Monsoon Gadget Deals — email / all (704)', 'email', 'all', 'completed', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 404711.76, 380429.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-09 12:00:00+05:30', '2026-06-09 17:00:00+05:30', '2026-04-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C1', 'Loyalty Reward Campaign — social / all (705)', 'social', 'all', 'completed', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 16868, 14675.16, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-09 12:00:00+05:30', '2026-07-10 03:00:00+05:30', '2026-06-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C2', 'Cart Abandonment Winback — re_engagement / all (706)', 're_engagement', 'all', 'completed', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-19 12:00:00+05:30', '2026-04-19 17:00:00+05:30', '2026-04-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C3', 'Festive Audio Week — clearance / standard (707)', 'clearance', 'standard', 'completed', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 303668.91, 294558.84, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-14 17:00:00+05:30', '2026-04-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C4', 'Back-to-Office Tech Drive — clearance / vip (708)', 'clearance', 'vip', 'completed', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-06 12:00:00+05:30', '2026-07-06 21:00:00+05:30', '2026-05-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C5', 'Festive Electronics Sale — email / at_risk (709)', 'email', 'at_risk', 'completed', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-18 12:00:00+05:30', '2026-05-18 23:00:00+05:30', '2026-04-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C6', 'Weekend Flash Deal — re_engagement / regular (710)', 're_engagement', 'regular', 'completed', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 470115.52, 470115.52, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-28 12:00:00+05:30', '2026-06-28 16:00:00+05:30', '2026-04-22 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C7', 'VIP Early Access Drop — re_engagement / vip (711)', 're_engagement', 'vip', 'completed', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 609477.86, 591193.52, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-24 12:00:00+05:30', '2026-05-24 12:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C8', 'New Arrivals Spotlight — email / all (712)', 'email', 'all', 'completed', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 09:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002C9', 'Clearance Blast — clearance / all (713)', 'clearance', 'all', 'completed', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 390147.05, 362836.76, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-28 12:00:00+05:30', '2026-07-29 06:00:00+05:30', '2026-05-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CA', 'Re-engagement Comeback Offer — clearance / regular (714)', 'clearance', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 705848.34, 691731.37, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-11 12:00:00+05:30', '2026-05-12 03:00:00+05:30', '2026-05-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CB', 'Diwali Mega Sale — social / at_risk (715)', 'social', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 00:00:00+05:30', '2026-05-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CC', 'Monsoon Gadget Deals — email / all (716)', 'email', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 682232.46, 675410.14, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-09 12:00:00+05:30', '2026-06-10 06:00:00+05:30', '2026-05-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CD', 'Loyalty Reward Campaign — email / at_risk (717)', 'email', 'at_risk', 'completed', 'Just For You — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 177582.39, 150945.03, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-02 12:00:00+05:30', '2026-06-03 03:00:00+05:30', '2026-05-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CE', 'Cart Abandonment Winback — email / regular (718)', 'email', 'regular', 'completed', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 716637.93, 687972.41, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-24 10:00:00+05:30', '2026-05-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002CF', 'Festive Audio Week — re_engagement / all (719)', 're_engagement', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 407265.94, 390975.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-28 12:00:00+05:30', '2026-06-29 03:00:00+05:30', '2026-03-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D0', 'Back-to-Office Tech Drive — re_engagement / all (720)', 're_engagement', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 152933.8, 131523.07, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-23 17:00:00+05:30', '2026-04-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D1', 'Festive Electronics Sale — clearance / all (721)', 'clearance', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 262845.56, 228675.64, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-16 12:00:00+05:30', '2026-05-17 06:00:00+05:30', '2026-03-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D2', 'Weekend Flash Deal — re_engagement / at_risk (722)', 're_engagement', 'at_risk', 'completed', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-02 12:00:00+05:30', '2026-06-02 19:00:00+05:30', '2026-05-18 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D3', 'VIP Early Access Drop — email / standard (723)', 'email', 'standard', 'completed', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 804364.77, 731971.94, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-29 12:00:00+05:30', '2026-06-29 18:00:00+05:30', '2026-05-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D4', 'New Arrivals Spotlight — re_engagement / regular (724)', 're_engagement', 'regular', 'completed', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 137703.67, 122556.27, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-03 07:00:00+05:30', '2026-05-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D5', 'Clearance Blast — clearance / all (725)', 'clearance', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 66728.07, 57386.14, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-01 12:00:00+05:30', '2026-05-01 12:00:00+05:30', '2026-05-31 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D6', 'Re-engagement Comeback Offer — clearance / regular (726)', 'clearance', 'regular', 'completed', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 859185.42, 773266.88, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-17 12:00:00+05:30', '2026-05-18 11:00:00+05:30', '2026-04-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D7', 'Diwali Mega Sale — social / regular (727)', 'social', 'regular', 'completed', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-17 06:00:00+05:30', '2026-04-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D8', 'Monsoon Gadget Deals — re_engagement / vip (728)', 're_engagement', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-25 12:00:00+05:30', '2026-06-26 06:00:00+05:30', '2026-05-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002D9', 'Loyalty Reward Campaign — re_engagement / all (729)', 're_engagement', 'all', 'completed', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 123691.91, 105138.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-24 00:00:00+05:30', '2026-05-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DA', 'Cart Abandonment Winback — social / at_risk (730)', 'social', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 390248.68, 378541.22, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-17 12:00:00+05:30', '2026-06-17 16:00:00+05:30', '2026-05-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DB', 'Festive Audio Week — clearance / standard (731)', 'clearance', 'standard', 'completed', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 101875.23, 97800.22, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-03 12:00:00+05:30', '2026-07-03 18:00:00+05:30', '2026-04-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DC', 'Back-to-Office Tech Drive — re_engagement / vip (732)', 're_engagement', 'vip', 'completed', 'Just For You — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-03 12:00:00+05:30', '2026-05-04 11:00:00+05:30', '2026-03-31 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DD', 'Festive Electronics Sale — re_engagement / vip (733)', 're_engagement', 'vip', 'completed', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-21 15:00:00+05:30', '2026-04-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DE', 'Weekend Flash Deal — clearance / vip (734)', 'clearance', 'vip', 'completed', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 846059.4, 820677.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-10 12:00:00+05:30', '2026-07-11 11:00:00+05:30', '2026-04-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002DF', 'VIP Early Access Drop — clearance / all (735)', 'clearance', 'all', 'completed', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-18 12:00:00+05:30', '2026-06-19 02:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E0', 'New Arrivals Spotlight — email / vip (736)', 'email', 'vip', 'completed', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 08:00:00+05:30', '2026-04-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E1', 'Clearance Blast — email / vip (737)', 'email', 'vip', 'completed', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 735966.89, 691808.88, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-24 12:00:00+05:30', '2026-04-25 00:00:00+05:30', '2026-04-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E2', 'Re-engagement Comeback Offer — email / regular (738)', 'email', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 133926.24, 127229.93, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-03 12:00:00+05:30', '2026-08-04 03:00:00+05:30', '2026-04-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E3', 'Diwali Mega Sale — social / regular (739)', 'social', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 656563.18, 604038.13, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-29 19:00:00+05:30', '2026-05-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E4', 'Monsoon Gadget Deals — email / standard (740)', 'email', 'standard', 'completed', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 824438.32, 791460.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-05 12:00:00+05:30', '2026-06-06 00:00:00+05:30', '2026-05-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E5', 'Loyalty Reward Campaign — re_engagement / all (741)', 're_engagement', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-02 00:00:00+05:30', '2026-05-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E6', 'Cart Abandonment Winback — email / all (742)', 'email', 'all', 'completed', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-16 12:00:00+05:30', '2026-05-16 19:00:00+05:30', '2026-05-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E7', 'Festive Audio Week — email / all (743)', 'email', 'all', 'completed', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-27 08:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E8', 'Back-to-Office Tech Drive — clearance / standard (744)', 'clearance', 'standard', 'completed', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 677145.41, 650059.59, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-15 12:00:00+05:30', '2026-05-15 13:00:00+05:30', '2026-06-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002E9', 'Festive Electronics Sale — email / regular (745)', 'email', 'regular', 'completed', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 312336.18, 293596.01, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-05 12:00:00+05:30', '2026-06-06 02:00:00+05:30', '2026-06-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002EA', 'Weekend Flash Deal — re_engagement / standard (746)', 're_engagement', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-24 12:00:00+05:30', '2026-05-24 15:00:00+05:30', '2026-06-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002EB', 'VIP Early Access Drop — email / all (747)', 'email', 'all', 'completed', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 456498.24, 392588.49, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-27 12:00:00+05:30', '2026-06-27 16:00:00+05:30', '2026-05-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002EC', 'New Arrivals Spotlight — email / all (748)', 'email', 'all', 'completed', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 58358.63, 57775.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-20 12:00:00+05:30', '2026-06-21 08:00:00+05:30', '2026-04-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002ED', 'Clearance Blast — clearance / standard (749)', 'clearance', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-01 12:00:00+05:30', '2026-06-01 13:00:00+05:30', '2026-05-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002EE', 'Re-engagement Comeback Offer — clearance / at_risk (750)', 'clearance', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 44916.33, 39975.53, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 04:00:00+05:30', '2026-04-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002EF', 'Diwali Mega Sale — clearance / standard (751)', 'clearance', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 229575.62, 218096.84, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-11 12:00:00+05:30', '2026-06-12 02:00:00+05:30', '2026-04-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F0', 'Monsoon Gadget Deals — email / vip (752)', 'email', 'vip', 'completed', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 579397.34, 556221.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-22 22:00:00+05:30', '2026-06-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F1', 'Loyalty Reward Campaign — social / at_risk (753)', 'social', 'at_risk', 'completed', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 838624.72, 771534.74, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 12:00:00+05:30', '2026-06-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F2', 'Cart Abandonment Winback — social / standard (754)', 'social', 'standard', 'completed', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-30 08:00:00+05:30', '2026-03-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F3', 'Festive Audio Week — re_engagement / standard (755)', 're_engagement', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 11:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F4', 'Back-to-Office Tech Drive — re_engagement / regular (756)', 're_engagement', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 718728.29, 682791.88, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-30 12:00:00+05:30', '2026-04-30 22:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F5', 'Festive Electronics Sale — clearance / regular (757)', 'clearance', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-04 12:00:00+05:30', '2026-05-05 04:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F6', 'Weekend Flash Deal — re_engagement / vip (758)', 're_engagement', 'vip', 'completed', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 680399.73, 625967.75, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-06 12:00:00+05:30', '2026-07-07 03:00:00+05:30', '2026-03-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F7', 'VIP Early Access Drop — re_engagement / regular (759)', 're_engagement', 'regular', 'completed', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 558104.44, 474388.77, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-14 12:00:00+05:30', '2026-06-14 20:00:00+05:30', '2026-03-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F8', 'New Arrivals Spotlight — re_engagement / at_risk (760)', 're_engagement', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 249316.95, 231864.76, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-07 10:00:00+05:30', '2026-05-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002F9', 'Clearance Blast — re_engagement / standard (761)', 're_engagement', 'standard', 'completed', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 438088.11, 403041.06, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-14 12:00:00+05:30', '2026-05-14 17:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FA', 'Re-engagement Comeback Offer — social / regular (762)', 'social', 'regular', 'completed', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 102643.75, 102643.75, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-17 12:00:00+05:30', '2026-04-17 23:00:00+05:30', '2026-06-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FB', 'Diwali Mega Sale — email / all (763)', 'email', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 376104.94, 357299.69, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 06:00:00+05:30', '2026-03-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FC', 'Monsoon Gadget Deals — social / standard (764)', 'social', 'standard', 'completed', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 655206.13, 635549.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-24 12:00:00+05:30', '2026-06-25 11:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FD', 'Loyalty Reward Campaign — email / all (765)', 'email', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-24 12:00:00+05:30', '2026-04-24 12:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FE', 'Cart Abandonment Winback — re_engagement / all (766)', 're_engagement', 'all', 'completed', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 313432.1, 272685.93, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-15 12:00:00+05:30', '2026-06-16 11:00:00+05:30', '2026-04-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-0000000002FF', 'Festive Audio Week — re_engagement / regular (767)', 're_engagement', 'regular', 'completed', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 251568.25, 249052.57, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-01 12:00:00+05:30', '2026-05-02 02:00:00+05:30', '2026-05-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000300', 'Back-to-Office Tech Drive — re_engagement / regular (768)', 're_engagement', 'regular', 'completed', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 572186.81, 549299.34, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-16 12:00:00+05:30', '2026-04-17 02:00:00+05:30', '2026-05-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000301', 'Festive Electronics Sale — re_engagement / all (769)', 're_engagement', 'all', 'completed', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 686730.25, 672995.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-24 12:00:00+05:30', '2026-05-24 19:00:00+05:30', '2026-03-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000302', 'Weekend Flash Deal — clearance / all (770)', 'clearance', 'all', 'completed', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 162361.46, 147748.93, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-18 12:00:00+05:30', '2026-04-18 16:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000303', 'VIP Early Access Drop — re_engagement / standard (771)', 're_engagement', 'standard', 'completed', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 466229.53, 396295.1, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-26 11:00:00+05:30', '2026-05-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000304', 'New Arrivals Spotlight — clearance / at_risk (772)', 'clearance', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 838307.62, 746093.78, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-14 11:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000305', 'Clearance Blast — clearance / at_risk (773)', 'clearance', 'at_risk', 'completed', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 62539.25, 54409.15, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-16 12:00:00+05:30', '2026-04-16 21:00:00+05:30', '2026-05-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000306', 'Re-engagement Comeback Offer — re_engagement / all (774)', 're_engagement', 'all', 'completed', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 713279.33, 691880.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 00:00:00+05:30', '2026-05-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000307', 'Diwali Mega Sale — re_engagement / standard (775)', 're_engagement', 'standard', 'completed', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-01 12:00:00+05:30', '2026-07-02 06:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000308', 'Monsoon Gadget Deals — email / vip (776)', 'email', 'vip', 'completed', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-08 12:00:00+05:30', '2026-06-09 01:00:00+05:30', '2026-04-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000309', 'Loyalty Reward Campaign — social / all (777)', 'social', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 526355.28, 457929.09, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 03:00:00+05:30', '2026-05-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030A', 'Cart Abandonment Winback — social / regular (778)', 'social', 'regular', 'completed', 'Limited Time — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 389286.33, 354250.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-15 12:00:00+05:30', '2026-05-16 01:00:00+05:30', '2026-03-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030B', 'Festive Audio Week — social / at_risk (779)', 'social', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-24 04:00:00+05:30', '2026-05-22 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030C', 'Back-to-Office Tech Drive — re_engagement / vip (780)', 're_engagement', 'vip', 'completed', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 607168.61, 570738.49, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-01 12:00:00+05:30', '2026-06-01 12:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030D', 'Festive Electronics Sale — clearance / all (781)', 'clearance', 'all', 'completed', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 266888.67, 240199.8, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-11 12:00:00+05:30', '2026-06-12 02:00:00+05:30', '2026-03-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030E', 'Weekend Flash Deal — social / at_risk (782)', 'social', 'at_risk', 'completed', 'Limited Time — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 557758.46, 501982.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-01 12:00:00+05:30', '2026-07-01 12:00:00+05:30', '2026-04-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000030F', 'VIP Early Access Drop — social / all (783)', 'social', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 637156.61, 567069.38, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-18 12:00:00+05:30', '2026-05-19 00:00:00+05:30', '2026-04-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000310', 'New Arrivals Spotlight — clearance / regular (784)', 'clearance', 'regular', 'completed', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-22 12:00:00+05:30', '2026-06-23 01:00:00+05:30', '2026-05-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000311', 'Clearance Blast — re_engagement / at_risk (785)', 're_engagement', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 601044.16, 577002.39, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-13 16:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000312', 'Re-engagement Comeback Offer — re_engagement / vip (786)', 're_engagement', 'vip', 'completed', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 868582.18, 816467.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-14 12:00:00+05:30', '2026-04-14 22:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000313', 'Diwali Mega Sale — email / regular (787)', 'email', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 16405.21, 16241.16, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-16 12:00:00+05:30', '2026-06-16 16:00:00+05:30', '2026-04-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000314', 'Monsoon Gadget Deals — email / vip (788)', 'email', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 859579.98, 730642.98, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-16 12:00:00+05:30', '2026-04-16 19:00:00+05:30', '2026-05-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000315', 'Loyalty Reward Campaign — email / regular (789)', 'email', 'regular', 'completed', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 630986.57, 580507.64, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-07 12:00:00+05:30', '2026-05-07 21:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000316', 'Cart Abandonment Winback — re_engagement / regular (790)', 're_engagement', 'regular', 'completed', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 782463.54, 774638.9, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-07 03:00:00+05:30', '2026-05-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000317', 'Festive Audio Week — clearance / at_risk (791)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 470323.78, 409181.69, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-07 12:00:00+05:30', '2026-07-08 03:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000318', 'Back-to-Office Tech Drive — re_engagement / standard (792)', 're_engagement', 'standard', 'completed', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-04 12:00:00+05:30', '2026-06-04 16:00:00+05:30', '2026-05-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000319', 'Festive Electronics Sale — clearance / regular (793)', 'clearance', 'regular', 'completed', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 585674.86, 579818.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-19 12:00:00+05:30', '2026-04-19 16:00:00+05:30', '2026-03-16 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031A', 'Weekend Flash Deal — email / standard (794)', 'email', 'standard', 'completed', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 628621.59, 572045.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 00:00:00+05:30', '2026-03-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031B', 'VIP Early Access Drop — email / at_risk (795)', 'email', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 04:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031C', 'New Arrivals Spotlight — clearance / all (796)', 'clearance', 'all', 'completed', 'Limited Time — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-10 12:00:00+05:30', '2026-06-11 03:00:00+05:30', '2026-06-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031D', 'Clearance Blast — email / all (797)', 'email', 'all', 'completed', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-11 12:00:00+05:30', '2026-06-12 05:00:00+05:30', '2026-04-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031E', 'Re-engagement Comeback Offer — clearance / at_risk (798)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 391173.23, 332497.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-14 12:00:00+05:30', '2026-07-15 07:00:00+05:30', '2026-03-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000031F', 'Diwali Mega Sale — email / standard (799)', 'email', 'standard', 'completed', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 420542.47, 386899.07, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-25 12:00:00+05:30', '2026-06-26 06:00:00+05:30', '2026-06-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000320', 'Monsoon Gadget Deals — clearance / all (800)', 'clearance', 'all', 'completed', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-05 12:00:00+05:30', '2026-05-06 09:00:00+05:30', '2026-06-01 12:00:00+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000321', 'Loyalty Reward Campaign — re_engagement / regular (801)', 're_engagement', 'regular', 'completed', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-25 12:00:00+05:30', '2026-05-26 08:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000322', 'Cart Abandonment Winback — social / at_risk (802)', 'social', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 99667.76, 93687.69, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-03 12:00:00+05:30', '2026-07-03 17:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000323', 'Festive Audio Week — clearance / regular (803)', 'clearance', 'regular', 'completed', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-27 12:00:00+05:30', '2026-07-27 15:00:00+05:30', '2026-06-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000324', 'Back-to-Office Tech Drive — social / all (804)', 'social', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-06 12:00:00+05:30', '2026-08-06 16:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000325', 'Festive Electronics Sale — clearance / regular (805)', 'clearance', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 643196.17, 643196.17, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-30 08:00:00+05:30', '2026-03-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000326', 'Weekend Flash Deal — clearance / vip (806)', 'clearance', 'vip', 'completed', 'Just For You — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 105146.06, 98837.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-16 12:00:00+05:30', '2026-07-16 12:00:00+05:30', '2026-03-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000327', 'VIP Early Access Drop — clearance / regular (807)', 'clearance', 'regular', 'completed', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 488835.38, 464393.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-15 12:00:00+05:30', '2026-06-16 00:00:00+05:30', '2026-03-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000328', 'New Arrivals Spotlight — social / regular (808)', 'social', 'regular', 'completed', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 616779.83, 530430.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-28 12:00:00+05:30', '2026-06-28 13:00:00+05:30', '2026-04-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000329', 'Clearance Blast — clearance / standard (809)', 'clearance', 'standard', 'completed', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 81426.83, 69212.81, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-24 06:00:00+05:30', '2026-03-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032A', 'Re-engagement Comeback Offer — clearance / all (810)', 'clearance', 'all', 'completed', 'Just For You — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 213452.07, 194241.38, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-01 12:00:00+05:30', '2026-05-02 00:00:00+05:30', '2026-05-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032B', 'Diwali Mega Sale — email / standard (811)', 'email', 'standard', 'completed', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 784502.51, 745277.38, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-29 12:00:00+05:30', '2026-04-30 04:00:00+05:30', '2026-04-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032C', 'Monsoon Gadget Deals — re_engagement / standard (812)', 're_engagement', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-06 12:00:00+05:30', '2026-06-06 21:00:00+05:30', '2026-03-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032D', 'Loyalty Reward Campaign — email / vip (813)', 'email', 'vip', 'completed', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 29159.67, 25952.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-03 12:00:00+05:30', '2026-05-04 05:00:00+05:30', '2026-04-17 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032E', 'Cart Abandonment Winback — clearance / at_risk (814)', 'clearance', 'at_risk', 'completed', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 97850.47, 85129.91, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 19:00:00+05:30', '2026-05-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000032F', 'Festive Audio Week — clearance / all (815)', 'clearance', 'all', 'completed', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 168138.75, 154687.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-23 12:00:00+05:30', '2026-07-23 13:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000330', 'Back-to-Office Tech Drive — re_engagement / standard (816)', 're_engagement', 'standard', 'completed', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 120945.83, 104013.41, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-17 12:00:00+05:30', '2026-04-17 21:00:00+05:30', '2026-04-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000331', 'Festive Electronics Sale — email / regular (817)', 'email', 'regular', 'completed', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 67979.52, 58462.39, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-14 12:00:00+05:30', '2026-04-15 01:00:00+05:30', '2026-06-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000332', 'Weekend Flash Deal — social / regular (818)', 'social', 'regular', 'completed', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 446728, 397587.92, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-06 12:00:00+05:30', '2026-07-07 08:00:00+05:30', '2026-05-24 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000333', 'VIP Early Access Drop — email / regular (819)', 'email', 'regular', 'completed', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 821301.78, 698106.51, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-25 18:00:00+05:30', '2026-06-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000334', 'New Arrivals Spotlight — email / standard (820)', 'email', 'standard', 'completed', 'Big Savings — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 307368.47, 270484.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-19 12:00:00+05:30', '2026-04-20 10:00:00+05:30', '2026-06-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000335', 'Clearance Blast — social / all (821)', 'social', 'all', 'completed', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-30 10:00:00+05:30', '2026-04-18 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000336', 'Re-engagement Comeback Offer — email / vip (822)', 'email', 'vip', 'completed', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 287296.04, 281550.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-24 12:00:00+05:30', '2026-07-25 09:00:00+05:30', '2026-04-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000337', 'Diwali Mega Sale — email / all (823)', 'email', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 369868.96, 321786, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-05 12:00:00+05:30', '2026-05-06 02:00:00+05:30', '2026-04-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000338', 'Monsoon Gadget Deals — social / standard (824)', 'social', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-01 12:00:00+05:30', '2026-05-01 14:00:00+05:30', '2026-04-09 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000339', 'Loyalty Reward Campaign — re_engagement / regular (825)', 're_engagement', 'regular', 'completed', 'Limited Time — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 335833.43, 325758.43, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-30 12:00:00+05:30', '2026-05-01 02:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033A', 'Cart Abandonment Winback — clearance / at_risk (826)', 'clearance', 'at_risk', 'completed', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 87087.28, 74895.06, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-04 12:00:00+05:30', '2026-08-05 09:00:00+05:30', '2026-04-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033B', 'Festive Audio Week — clearance / at_risk (827)', 'clearance', 'at_risk', 'completed', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-04 12:00:00+05:30', '2026-07-05 12:00:00+05:30', '2026-05-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033C', 'Back-to-Office Tech Drive — email / all (828)', 'email', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 48982.39, 42124.86, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-27 12:00:00+05:30', '2026-04-27 20:00:00+05:30', '2026-05-31 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033D', 'Festive Electronics Sale — re_engagement / at_risk (829)', 're_engagement', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-09 12:00:00+05:30', '2026-06-09 22:00:00+05:30', '2026-03-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033E', 'Weekend Flash Deal — email / at_risk (830)', 'email', 'at_risk', 'completed', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-12 12:00:00+05:30', '2026-05-13 10:00:00+05:30', '2026-05-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000033F', 'VIP Early Access Drop — email / at_risk (831)', 'email', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 704554.57, 662281.3, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-01 12:00:00+05:30', '2026-06-02 02:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000340', 'New Arrivals Spotlight — email / at_risk (832)', 'email', 'at_risk', 'completed', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 419880.13, 356898.11, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 09:00:00+05:30', '2026-06-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000341', 'Clearance Blast — social / regular (833)', 'social', 'regular', 'completed', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-02 12:00:00+05:30', '2026-08-03 05:00:00+05:30', '2026-05-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000342', 'Re-engagement Comeback Offer — email / standard (834)', 'email', 'standard', 'completed', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 553641.2, 503813.49, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-13 12:00:00+05:30', '2026-04-13 20:00:00+05:30', '2026-05-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000343', 'Diwali Mega Sale — email / all (835)', 'email', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-21 21:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000344', 'Monsoon Gadget Deals — clearance / standard (836)', 'clearance', 'standard', 'completed', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 878988.59, 764720.07, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-25 12:00:00+05:30', '2026-06-25 23:00:00+05:30', '2026-04-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000345', 'Loyalty Reward Campaign — clearance / at_risk (837)', 'clearance', 'at_risk', 'completed', 'Limited Time — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 196226.76, 170717.28, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-04 12:00:00+05:30', '2026-05-04 22:00:00+05:30', '2026-05-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000346', 'Cart Abandonment Winback — social / vip (838)', 'social', 'vip', 'completed', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 657223.5, 650651.27, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-31 10:00:00+05:30', '2026-05-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000347', 'Festive Audio Week — clearance / standard (839)', 'clearance', 'standard', 'completed', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 83736.09, 77874.56, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-13 12:00:00+05:30', '2026-04-14 03:00:00+05:30', '2026-04-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000348', 'Back-to-Office Tech Drive — social / vip (840)', 'social', 'vip', 'completed', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 762081.14, 762081.14, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-02 06:00:00+05:30', '2026-05-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000349', 'Festive Electronics Sale — clearance / standard (841)', 'clearance', 'standard', 'completed', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 280947.7, 250043.45, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-19 12:00:00+05:30', '2026-07-19 21:00:00+05:30', '2026-03-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034A', 'Weekend Flash Deal — clearance / at_risk (842)', 'clearance', 'at_risk', 'completed', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-27 12:00:00+05:30', '2026-06-28 01:00:00+05:30', '2026-03-22 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034B', 'VIP Early Access Drop — clearance / vip (843)', 'clearance', 'vip', 'completed', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 630049.02, 567044.12, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-30 12:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034C', 'New Arrivals Spotlight — re_engagement / standard (844)', 're_engagement', 'standard', 'completed', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-08-01 11:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034D', 'Clearance Blast — re_engagement / at_risk (845)', 're_engagement', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 896565.11, 762080.34, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-26 12:00:00+05:30', '2026-07-27 00:00:00+05:30', '2026-05-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034E', 'Re-engagement Comeback Offer — email / all (846)', 'email', 'all', 'completed', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-04 12:00:00+05:30', '2026-07-05 02:00:00+05:30', '2026-06-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000034F', 'Diwali Mega Sale — clearance / at_risk (847)', 'clearance', 'at_risk', 'completed', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-27 12:00:00+05:30', '2026-06-28 00:00:00+05:30', '2026-03-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000350', 'Monsoon Gadget Deals — email / standard (848)', 'email', 'standard', 'completed', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-29 12:00:00+05:30', '2026-07-29 14:00:00+05:30', '2026-03-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000351', 'Loyalty Reward Campaign — email / vip (849)', 'email', 'vip', 'completed', 'Just For You — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 765338.99, 719418.65, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-31 12:00:00+05:30', '2026-06-01 03:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000352', 'Cart Abandonment Winback — re_engagement / standard (850)', 're_engagement', 'standard', 'completed', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-25 19:00:00+05:30', '2026-04-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000353', 'Festive Audio Week — email / vip (851)', 'email', 'vip', 'completed', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-08 12:00:00+05:30', '2026-06-08 23:00:00+05:30', '2026-04-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000354', 'Back-to-Office Tech Drive — clearance / standard (852)', 'clearance', 'standard', 'completed', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 756144.78, 718337.54, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-05 12:00:00+05:30', '2026-05-05 19:00:00+05:30', '2026-06-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000355', 'Festive Electronics Sale — re_engagement / at_risk (853)', 're_engagement', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-24 12:00:00+05:30', '2026-05-24 23:00:00+05:30', '2026-04-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000356', 'Weekend Flash Deal — email / regular (854)', 'email', 'regular', 'completed', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-21 12:00:00+05:30', '2026-07-22 04:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000357', 'VIP Early Access Drop — clearance / regular (855)', 'clearance', 'regular', 'completed', 'Just For You — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 858589.91, 781316.82, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-29 12:00:00+05:30', '2026-05-30 04:00:00+05:30', '2026-06-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000358', 'New Arrivals Spotlight — social / standard (856)', 'social', 'standard', 'completed', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-25 12:00:00+05:30', '2026-07-26 12:00:00+05:30', '2026-05-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000359', 'Clearance Blast — email / all (857)', 'email', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 813154.52, 772496.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-05 12:00:00+05:30', '2026-08-05 14:00:00+05:30', '2026-05-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035A', 'Re-engagement Comeback Offer — clearance / vip (858)', 'clearance', 'vip', 'completed', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-01 12:00:00+05:30', '2026-06-02 12:00:00+05:30', '2026-05-01 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035B', 'Diwali Mega Sale — clearance / at_risk (859)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 434122.23, 425439.79, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-02 12:00:00+05:30', '2026-07-02 15:00:00+05:30', '2026-03-20 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035C', 'Monsoon Gadget Deals — email / regular (860)', 'email', 'regular', 'completed', 'Just For You — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 577901.76, 508553.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 03:00:00+05:30', '2026-04-13 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035D', 'Loyalty Reward Campaign — email / standard (861)', 'email', 'standard', 'completed', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 638218.57, 593543.27, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-24 12:00:00+05:30', '2026-05-25 01:00:00+05:30', '2026-05-31 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035E', 'Cart Abandonment Winback — clearance / standard (862)', 'clearance', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 520193.01, 499385.29, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-02 12:00:00+05:30', '2026-06-02 21:00:00+05:30', '2026-04-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000035F', 'Festive Audio Week — re_engagement / all (863)', 're_engagement', 'all', 'completed', 'Big Savings — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 461390.23, 429092.91, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-12 12:00:00+05:30', '2026-07-13 02:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000360', 'Back-to-Office Tech Drive — re_engagement / standard (864)', 're_engagement', 'standard', 'completed', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 397692.67, 393715.74, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-14 12:00:00+05:30', '2026-05-14 13:00:00+05:30', '2026-05-12 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000361', 'Festive Electronics Sale — clearance / at_risk (865)', 'clearance', 'at_risk', 'completed', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-19 12:00:00+05:30', '2026-05-20 02:00:00+05:30', '2026-04-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000362', 'Weekend Flash Deal — re_engagement / vip (866)', 're_engagement', 'vip', 'completed', 'Limited Time — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-23 12:00:00+05:30', '2026-05-24 09:00:00+05:30', '2026-04-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000363', 'VIP Early Access Drop — social / regular (867)', 'social', 'regular', 'completed', 'Exclusive Offer — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 654549.41, 602185.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-08-01 12:00:00+05:30', '2026-08-01 23:00:00+05:30', '2026-04-05 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000364', 'New Arrivals Spotlight — clearance / standard (868)', 'clearance', 'standard', 'completed', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 730021.68, 722721.46, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-13 12:00:00+05:30', '2026-06-14 01:00:00+05:30', '2026-05-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000365', 'Clearance Blast — email / vip (869)', 'email', 'vip', 'completed', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 320300.15, 301082.14, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-27 12:00:00+05:30', '2026-06-27 13:00:00+05:30', '2026-03-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000366', 'Re-engagement Comeback Offer — re_engagement / vip (870)', 're_engagement', 'vip', 'completed', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-20 12:00:00+05:30', '2026-04-20 23:00:00+05:30', '2026-03-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000367', 'Diwali Mega Sale — social / at_risk (871)', 'social', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 863173.82, 837278.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-14 12:00:00+05:30', '2026-05-15 11:00:00+05:30', '2026-05-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000368', 'Monsoon Gadget Deals — social / standard (872)', 'social', 'standard', 'completed', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-17 12:00:00+05:30', '2026-05-18 09:00:00+05:30', '2026-04-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000369', 'Loyalty Reward Campaign — social / all (873)', 'social', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 650557.99, 552974.29, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-17 12:00:00+05:30', '2026-06-18 01:00:00+05:30', '2026-05-29 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036A', 'Cart Abandonment Winback — re_engagement / at_risk (874)', 're_engagement', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-06 12:00:00+05:30', '2026-06-07 01:00:00+05:30', '2026-03-21 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036B', 'Festive Audio Week — re_engagement / regular (875)', 're_engagement', 'regular', 'completed', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 564810.68, 497033.4, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-30 12:00:00+05:30', '2026-07-30 17:00:00+05:30', '2026-03-30 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036C', 'Back-to-Office Tech Drive — email / standard (876)', 'email', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 398977.59, 347110.5, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-25 12:00:00+05:30', '2026-04-25 15:00:00+05:30', '2026-06-08 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036D', 'Festive Electronics Sale — email / regular (877)', 'email', 'regular', 'completed', 'Big Savings — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 313259.41, 291331.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-31 12:00:00+05:30', '2026-07-31 20:00:00+05:30', '2026-04-02 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036E', 'Weekend Flash Deal — clearance / at_risk (878)', 'clearance', 'at_risk', 'completed', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 710680.88, 696467.26, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-12 12:00:00+05:30', '2026-06-13 11:00:00+05:30', '2026-03-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000036F', 'VIP Early Access Drop — clearance / vip (879)', 'clearance', 'vip', 'completed', 'Big Savings — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 629552.57, 566597.31, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-12 12:00:00+05:30', '2026-06-13 12:00:00+05:30', '2026-05-25 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000370', 'New Arrivals Spotlight — email / all (880)', 'email', 'all', 'completed', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 36077.79, 33191.57, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-14 12:00:00+05:30', '2026-06-14 15:00:00+05:30', '2026-03-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000371', 'Clearance Blast — email / regular (881)', 'email', 'regular', 'completed', 'Just For You — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-29 12:00:00+05:30', '2026-04-30 10:00:00+05:30', '2026-06-07 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000372', 'Re-engagement Comeback Offer — email / at_risk (882)', 'email', 'at_risk', 'completed', 'Exclusive Offer — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 829649.52, 779870.55, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-02 12:00:00+05:30', '2026-06-03 09:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000373', 'Diwali Mega Sale — clearance / all (883)', 'clearance', 'all', 'completed', 'Exclusive Offer — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 453024.01, 407721.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-22 12:00:00+05:30', '2026-04-22 13:00:00+05:30', '2026-03-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000374', 'Monsoon Gadget Deals — clearance / at_risk (884)', 'clearance', 'at_risk', 'completed', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 59919.44, 54526.69, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-22 12:00:00+05:30', '2026-07-23 07:00:00+05:30', '2026-05-10 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000375', 'Loyalty Reward Campaign — clearance / at_risk (885)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 458997.48, 436047.61, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-23 12:00:00+05:30', '2026-06-23 16:00:00+05:30', '2026-03-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000376', 'Cart Abandonment Winback — email / at_risk (886)', 'email', 'at_risk', 'completed', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 58410.59, 54905.95, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-15 12:00:00+05:30', '2026-07-16 11:00:00+05:30', '2026-04-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000377', 'Festive Audio Week — email / at_risk (887)', 'email', 'at_risk', 'completed', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 487376.84, 428891.62, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-30 12:00:00+05:30', '2026-05-31 02:00:00+05:30', '2026-03-27 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000378', 'Back-to-Office Tech Drive — re_engagement / standard (888)', 're_engagement', 'standard', 'completed', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 679659.29, 672862.7, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-18 12:00:00+05:30', '2026-04-18 13:00:00+05:30', '2026-04-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000379', 'Festive Electronics Sale — clearance / regular (889)', 'clearance', 'regular', 'completed', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 337231.99, 323742.71, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-12 12:00:00+05:30', '2026-05-12 18:00:00+05:30', '2026-03-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037A', 'Weekend Flash Deal — clearance / standard (890)', 'clearance', 'standard', 'completed', 'Just For You — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 403230.57, 383069.04, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-27 12:00:00+05:30', '2026-07-28 02:00:00+05:30', '2026-04-03 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037B', 'VIP Early Access Drop — clearance / at_risk (891)', 'clearance', 'at_risk', 'completed', 'Exclusive Offer — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-19 09:00:00+05:30', '2026-05-14 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037C', 'New Arrivals Spotlight — clearance / regular (892)', 'clearance', 'regular', 'completed', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 352872.15, 303470.05, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-13 12:00:00+05:30', '2026-07-14 07:00:00+05:30', '2026-05-04 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037D', 'Clearance Blast — re_engagement / all (893)', 're_engagement', 'all', 'completed', 'Big Savings — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-05-18 12:00:00+05:30', '2026-05-19 12:00:00+05:30', '2026-05-26 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037E', 'Re-engagement Comeback Offer — social / standard (894)', 'social', 'standard', 'completed', 'Big Savings — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 122490.67, 111466.51, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-18 12:00:00+05:30', '2026-07-19 00:00:00+05:30', '2026-05-11 12:00:00+05:30'),
('3D000000-0000-0000-0000-00000000037F', 'Diwali Mega Sale — re_engagement / all (895)', 're_engagement', 'all', 'completed', 'Just For You — free shipping, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 302742.15, 260358.25, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-07-09 12:00:00+05:30', '2026-07-10 07:00:00+05:30', '2026-03-28 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000380', 'Monsoon Gadget Deals — re_engagement / regular (896)', 're_engagement', 'regular', 'completed', 'Exclusive Offer — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 310920.8, 267391.89, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-22 12:00:00+05:30', '2026-06-23 09:00:00+05:30', '2026-05-19 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000381', 'Loyalty Reward Campaign — clearance / standard (897)', 'clearance', 'standard', 'completed', 'Exclusive Offer — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 50632.88, 47088.58, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-23 12:00:00+05:30', '2026-04-24 04:00:00+05:30', '2026-05-15 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000382', 'Cart Abandonment Winback — re_engagement / all (898)', 're_engagement', 'all', 'completed', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 660496.33, 627471.51, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-21 12:00:00+05:30', '2026-04-21 20:00:00+05:30', '2026-04-06 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000383', 'Festive Audio Week — email / all (899)', 'email', 'all', 'completed', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-04-21 12:00:00+05:30', '2026-04-21 13:00:00+05:30', '2026-05-23 12:00:00+05:30'),
('3D000000-0000-0000-0000-000000000384', 'Back-to-Office Tech Drive — social / all (900)', 'social', 'all', 'completed', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 579033.23, 544291.24, 'marketing_agent', '20000000-0000-0000-0000-000000000001', '2026-06-01 12:00:00+05:30', '2026-06-01 15:00:00+05:30', '2026-05-30 12:00:00+05:30')
ON CONFLICT (campaign_id) DO NOTHING;

INSERT INTO campaigns (campaign_id, name, type, segment, status, content_subject, content_body, budget, spent, created_by_agent, approved_by, scheduled_at, sent_at, created_at) VALUES
('3D000000-0000-0000-0000-000000000385', 'Festive Electronics Sale — clearance / standard (901)', 'clearance', 'standard', 'rejected', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-03-28 04:00:01+05:30'),
('3D000000-0000-0000-0000-000000000386', 'Weekend Flash Deal — re_engagement / vip (902)', 're_engagement', 'vip', 'rejected', 'Big Savings — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 828410.44, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-08 10:44:55+05:30'),
('3D000000-0000-0000-0000-000000000387', 'VIP Early Access Drop — clearance / regular (903)', 'clearance', 'regular', 'rejected', 'Exclusive Offer — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 292285.12, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-09 20:28:33+05:30'),
('3D000000-0000-0000-0000-000000000388', 'New Arrivals Spotlight — re_engagement / regular (904)', 're_engagement', 'regular', 'rejected', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 455114.72, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-01-13 14:53:47+05:30'),
('3D000000-0000-0000-0000-000000000389', 'Clearance Blast — re_engagement / at_risk (905)', 're_engagement', 'at_risk', 'rejected', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 30331.02, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-01-25 00:50:04+05:30'),
('3D000000-0000-0000-0000-00000000038A', 'Re-engagement Comeback Offer — clearance / standard (906)', 'clearance', 'standard', 'rejected', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 595774.34, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-05-21 07:57:42+05:30'),
('3D000000-0000-0000-0000-00000000038B', 'Diwali Mega Sale — email / at_risk (907)', 'email', 'at_risk', 'rejected', 'Big Savings — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 403327.62, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-07-30 20:08:56+05:30'),
('3D000000-0000-0000-0000-00000000038C', 'Monsoon Gadget Deals — re_engagement / standard (908)', 're_engagement', 'standard', 'rejected', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 523073.44, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-12 12:51:48+05:30'),
('3D000000-0000-0000-0000-00000000038D', 'Loyalty Reward Campaign — re_engagement / at_risk (909)', 're_engagement', 'at_risk', 'rejected', 'Big Savings — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-10-12 05:43:50+05:30'),
('3D000000-0000-0000-0000-00000000038E', 'Cart Abandonment Winback — social / regular (910)', 'social', 'regular', 'rejected', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-07-03 02:07:39+05:30'),
('3D000000-0000-0000-0000-00000000038F', 'Festive Audio Week — re_engagement / standard (911)', 're_engagement', 'standard', 'rejected', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 266932.96, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-08-08 16:37:40+05:30'),
('3D000000-0000-0000-0000-000000000390', 'Back-to-Office Tech Drive — re_engagement / regular (912)', 're_engagement', 'regular', 'rejected', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 154013.35, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-18 00:20:39+05:30'),
('3D000000-0000-0000-0000-000000000391', 'Festive Electronics Sale — clearance / standard (913)', 'clearance', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 470454.12, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-02 07:03:28+05:30'),
('3D000000-0000-0000-0000-000000000392', 'Weekend Flash Deal — clearance / all (914)', 'clearance', 'all', 'rejected', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-04-06 17:47:24+05:30'),
('3D000000-0000-0000-0000-000000000393', 'VIP Early Access Drop — re_engagement / vip (915)', 're_engagement', 'vip', 'rejected', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 617710.27, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-09-22 04:50:22+05:30'),
('3D000000-0000-0000-0000-000000000394', 'New Arrivals Spotlight — email / at_risk (916)', 'email', 'at_risk', 'rejected', 'Big Savings — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 406344.88, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-07-03 19:36:54+05:30'),
('3D000000-0000-0000-0000-000000000395', 'Clearance Blast — email / at_risk (917)', 'email', 'at_risk', 'rejected', 'Limited Time — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 340393.19, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-08-13 03:53:08+05:30'),
('3D000000-0000-0000-0000-000000000396', 'Re-engagement Comeback Offer — social / standard (918)', 'social', 'standard', 'rejected', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 398902.06, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-11 20:43:22+05:30'),
('3D000000-0000-0000-0000-000000000397', 'Diwali Mega Sale — social / all (919)', 'social', 'all', 'rejected', 'Just For You — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 331002.83, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-19 01:47:47+05:30'),
('3D000000-0000-0000-0000-000000000398', 'Monsoon Gadget Deals — re_engagement / all (920)', 're_engagement', 'all', 'rejected', 'Just For You — up to 40% off, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-03-03 13:54:53+05:30'),
('3D000000-0000-0000-0000-000000000399', 'Loyalty Reward Campaign — email / vip (921)', 'email', 'vip', 'rejected', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 169453.07, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-11 19:00:19+05:30'),
('3D000000-0000-0000-0000-00000000039A', 'Cart Abandonment Winback — clearance / vip (922)', 'clearance', 'vip', 'rejected', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 301517.34, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-27 04:35:02+05:30'),
('3D000000-0000-0000-0000-00000000039B', 'Festive Audio Week — social / standard (923)', 'social', 'standard', 'rejected', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 796362.66, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-04-24 00:48:31+05:30'),
('3D000000-0000-0000-0000-00000000039C', 'Back-to-Office Tech Drive — email / at_risk (924)', 'email', 'at_risk', 'rejected', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 120279.41, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-07-11 09:02:35+05:30'),
('3D000000-0000-0000-0000-00000000039D', 'Festive Electronics Sale — social / standard (925)', 'social', 'standard', 'rejected', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 206960.19, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-06-01 23:20:36+05:30'),
('3D000000-0000-0000-0000-00000000039E', 'Weekend Flash Deal — social / standard (926)', 'social', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-01-22 13:22:50+05:30'),
('3D000000-0000-0000-0000-00000000039F', 'VIP Early Access Drop — social / regular (927)', 'social', 'regular', 'rejected', 'Big Savings — up to 40% off, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 600556.85, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-21 11:31:25+05:30'),
('3D000000-0000-0000-0000-0000000003A0', 'New Arrivals Spotlight — email / standard (928)', 'email', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 609847.97, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-06-22 05:00:47+05:30'),
('3D000000-0000-0000-0000-0000000003A1', 'Clearance Blast — re_engagement / vip (929)', 're_engagement', 'vip', 'rejected', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 740114.69, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-05-13 13:34:30+05:30'),
('3D000000-0000-0000-0000-0000000003A2', 'Re-engagement Comeback Offer — re_engagement / at_risk (930)', 're_engagement', 'at_risk', 'rejected', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 117205.46, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-05-16 01:20:07+05:30'),
('3D000000-0000-0000-0000-0000000003A3', 'Diwali Mega Sale — social / all (931)', 'social', 'all', 'rejected', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 667597.67, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-28 04:30:21+05:30'),
('3D000000-0000-0000-0000-0000000003A4', 'Monsoon Gadget Deals — email / at_risk (932)', 'email', 'at_risk', 'rejected', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 209873.44, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-27 21:40:39+05:30'),
('3D000000-0000-0000-0000-0000000003A5', 'Loyalty Reward Campaign — email / regular (933)', 'email', 'regular', 'rejected', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-23 17:55:53+05:30'),
('3D000000-0000-0000-0000-0000000003A6', 'Cart Abandonment Winback — re_engagement / at_risk (934)', 're_engagement', 'at_risk', 'rejected', 'Just For You — free shipping, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-26 15:20:42+05:30'),
('3D000000-0000-0000-0000-0000000003A7', 'Festive Audio Week — clearance / at_risk (935)', 'clearance', 'at_risk', 'rejected', 'Big Savings — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 545922.6, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-06-14 19:02:35+05:30'),
('3D000000-0000-0000-0000-0000000003A8', 'Back-to-Office Tech Drive — re_engagement / standard (936)', 're_engagement', 'standard', 'rejected', 'Just For You — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-17 09:19:52+05:30'),
('3D000000-0000-0000-0000-0000000003A9', 'Festive Electronics Sale — social / at_risk (937)', 'social', 'at_risk', 'rejected', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-02 22:59:50+05:30'),
('3D000000-0000-0000-0000-0000000003AA', 'Weekend Flash Deal — clearance / standard (938)', 'clearance', 'standard', 'rejected', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 715617.12, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-10-17 00:30:29+05:30'),
('3D000000-0000-0000-0000-0000000003AB', 'VIP Early Access Drop — re_engagement / at_risk (939)', 're_engagement', 'at_risk', 'rejected', 'Limited Time — up to 40% off, at_risk customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 729651.95, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-04-30 23:58:19+05:30'),
('3D000000-0000-0000-0000-0000000003AC', 'New Arrivals Spotlight — re_engagement / vip (940)', 're_engagement', 'vip', 'rejected', 'Limited Time — up to 40% off, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-09-22 12:15:35+05:30'),
('3D000000-0000-0000-0000-0000000003AD', 'Clearance Blast — email / standard (941)', 'email', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-30 23:10:44+05:30'),
('3D000000-0000-0000-0000-0000000003AE', 'Re-engagement Comeback Offer — re_engagement / regular (942)', 're_engagement', 'regular', 'rejected', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-02 10:22:42+05:30'),
('3D000000-0000-0000-0000-0000000003AF', 'Diwali Mega Sale — clearance / vip (943)', 'clearance', 'vip', 'rejected', 'Exclusive Offer — free shipping, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-04-08 19:10:49+05:30'),
('3D000000-0000-0000-0000-0000000003B0', 'Monsoon Gadget Deals — clearance / at_risk (944)', 'clearance', 'at_risk', 'rejected', 'Just For You — up to 40% off, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-07 07:37:33+05:30'),
('3D000000-0000-0000-0000-0000000003B1', 'Loyalty Reward Campaign — re_engagement / standard (945)', 're_engagement', 'standard', 'rejected', 'Limited Time — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 758342.86, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-03-06 18:50:18+05:30'),
('3D000000-0000-0000-0000-0000000003B2', 'Cart Abandonment Winback — re_engagement / all (946)', 're_engagement', 'all', 'rejected', 'Exclusive Offer — buy 1 get 1, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 427819.44, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-03 14:57:18+05:30'),
('3D000000-0000-0000-0000-0000000003B3', 'Festive Audio Week — social / vip (947)', 'social', 'vip', 'rejected', 'Exclusive Offer — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-22 11:30:24+05:30'),
('3D000000-0000-0000-0000-0000000003B4', 'Back-to-Office Tech Drive — re_engagement / standard (948)', 're_engagement', 'standard', 'rejected', 'Big Savings — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 608025.8, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-05-15 00:21:13+05:30'),
('3D000000-0000-0000-0000-0000000003B5', 'Festive Electronics Sale — social / regular (949)', 'social', 'regular', 'rejected', 'Exclusive Offer — extra 10% on first order, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-05-30 09:12:46+05:30'),
('3D000000-0000-0000-0000-0000000003B6', 'Weekend Flash Deal — clearance / at_risk (950)', 'clearance', 'at_risk', 'rejected', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-18 20:18:18+05:30'),
('3D000000-0000-0000-0000-0000000003B7', 'VIP Early Access Drop — social / standard (951)', 'social', 'standard', 'rejected', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 166126.49, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-05-23 19:40:41+05:30'),
('3D000000-0000-0000-0000-0000000003B8', 'New Arrivals Spotlight — social / all (952)', 'social', 'all', 'rejected', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 340596.65, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-04-11 14:00:40+05:30'),
('3D000000-0000-0000-0000-0000000003B9', 'Clearance Blast — clearance / regular (953)', 'clearance', 'regular', 'rejected', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 369453.11, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-08-05 15:17:00+05:30'),
('3D000000-0000-0000-0000-0000000003BA', 'Re-engagement Comeback Offer — social / vip (954)', 'social', 'vip', 'rejected', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 590056.68, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-05-22 19:31:01+05:30'),
('3D000000-0000-0000-0000-0000000003BB', 'Diwali Mega Sale — re_engagement / standard (955)', 're_engagement', 'standard', 'rejected', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-16 22:31:41+05:30'),
('3D000000-0000-0000-0000-0000000003BC', 'Monsoon Gadget Deals — re_engagement / regular (956)', 're_engagement', 'regular', 'rejected', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-10-26 16:00:14+05:30'),
('3D000000-0000-0000-0000-0000000003BD', 'Loyalty Reward Campaign — email / regular (957)', 'email', 'regular', 'rejected', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 824705.63, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-28 22:29:57+05:30'),
('3D000000-0000-0000-0000-0000000003BE', 'Cart Abandonment Winback — re_engagement / standard (958)', 're_engagement', 'standard', 'rejected', 'Exclusive Offer — extra 10% on first order, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 380466.96, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-21 23:25:53+05:30'),
('3D000000-0000-0000-0000-0000000003BF', 'Festive Audio Week — clearance / standard (959)', 'clearance', 'standard', 'rejected', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 682151.61, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-06-03 18:42:36+05:30'),
('3D000000-0000-0000-0000-0000000003C0', 'Back-to-Office Tech Drive — social / all (960)', 'social', 'all', 'rejected', 'Limited Time — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 213213.71, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-15 12:41:15+05:30'),
('3D000000-0000-0000-0000-0000000003C1', 'Festive Electronics Sale — email / standard (961)', 'email', 'standard', 'rejected', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-07-16 10:55:07+05:30'),
('3D000000-0000-0000-0000-0000000003C2', 'Weekend Flash Deal — email / all (962)', 'email', 'all', 'rejected', 'Limited Time — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 48480.54, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-10-16 18:57:01+05:30'),
('3D000000-0000-0000-0000-0000000003C3', 'VIP Early Access Drop — email / vip (963)', 'email', 'vip', 'rejected', 'Big Savings — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 486136.54, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-05 01:54:37+05:30'),
('3D000000-0000-0000-0000-0000000003C4', 'New Arrivals Spotlight — clearance / standard (964)', 'clearance', 'standard', 'rejected', 'Exclusive Offer — free shipping, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 378139.12, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-21 12:18:48+05:30'),
('3D000000-0000-0000-0000-0000000003C5', 'Clearance Blast — re_engagement / vip (965)', 're_engagement', 'vip', 'rejected', 'Exclusive Offer — buy 1 get 1, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 827977.81, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-15 04:49:06+05:30'),
('3D000000-0000-0000-0000-0000000003C6', 'Re-engagement Comeback Offer — email / standard (966)', 'email', 'standard', 'rejected', 'Just For You — up to 40% off, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 369043.82, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-05-11 11:15:19+05:30'),
('3D000000-0000-0000-0000-0000000003C7', 'Diwali Mega Sale — clearance / regular (967)', 'clearance', 'regular', 'rejected', 'Big Savings — buy 1 get 1, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 885638.96, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-04-17 03:20:19+05:30'),
('3D000000-0000-0000-0000-0000000003C8', 'Monsoon Gadget Deals — social / standard (968)', 'social', 'standard', 'rejected', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 252539.13, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-17 02:28:40+05:30'),
('3D000000-0000-0000-0000-0000000003C9', 'Loyalty Reward Campaign — email / at_risk (969)', 'email', 'at_risk', 'rejected', 'Limited Time — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-03-14 22:02:47+05:30'),
('3D000000-0000-0000-0000-0000000003CA', 'Cart Abandonment Winback — re_engagement / vip (970)', 're_engagement', 'vip', 'rejected', 'Limited Time — free shipping, vip customers', 'Hi VIP customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 752568.93, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-08-03 03:56:59+05:30'),
('3D000000-0000-0000-0000-0000000003CB', 'Festive Audio Week — clearance / standard (971)', 'clearance', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 206319.94, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-02-07 08:56:42+05:30'),
('3D000000-0000-0000-0000-0000000003CC', 'Back-to-Office Tech Drive — social / at_risk (972)', 'social', 'at_risk', 'rejected', 'Exclusive Offer — up to 40% off, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-04-11 19:21:55+05:30'),
('3D000000-0000-0000-0000-0000000003CD', 'Festive Electronics Sale — social / all (973)', 'social', 'all', 'rejected', 'Exclusive Offer — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 840333.08, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-04-21 08:39:52+05:30'),
('3D000000-0000-0000-0000-0000000003CE', 'Weekend Flash Deal — email / standard (974)', 'email', 'standard', 'rejected', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 390207.42, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-01-21 05:36:15+05:30'),
('3D000000-0000-0000-0000-0000000003CF', 'VIP Early Access Drop — social / standard (975)', 'social', 'standard', 'rejected', 'Limited Time — free shipping, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 265806.27, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-05-01 15:09:02+05:30'),
('3D000000-0000-0000-0000-0000000003D0', 'New Arrivals Spotlight — email / vip (976)', 'email', 'vip', 'rejected', 'Limited Time — extra 10% on first order, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 443597.36, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-08-07 15:00:06+05:30'),
('3D000000-0000-0000-0000-0000000003D1', 'Clearance Blast — clearance / vip (977)', 'clearance', 'vip', 'rejected', 'Exclusive Offer — up to 40% off, vip customers', 'Hi VIP customer,

We have curated clearance deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 413151.94, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-17 21:29:37+05:30'),
('3D000000-0000-0000-0000-0000000003D2', 'Re-engagement Comeback Offer — re_engagement / standard (978)', 're_engagement', 'standard', 'rejected', 'Big Savings — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-01-25 09:47:33+05:30'),
('3D000000-0000-0000-0000-0000000003D3', 'Diwali Mega Sale — social / vip (979)', 'social', 'vip', 'rejected', 'Big Savings — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 702303.86, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-21 23:10:54+05:30'),
('3D000000-0000-0000-0000-0000000003D4', 'Monsoon Gadget Deals — social / at_risk (980)', 'social', 'at_risk', 'rejected', 'Just For You — extra 10% on first order, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 867010.14, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-06-17 04:31:10+05:30'),
('3D000000-0000-0000-0000-0000000003D5', 'Loyalty Reward Campaign — re_engagement / standard (981)', 're_engagement', 'standard', 'rejected', 'Exclusive Offer — buy 1 get 1, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 671573.19, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-27 13:56:16+05:30'),
('3D000000-0000-0000-0000-0000000003D6', 'Cart Abandonment Winback — social / at_risk (982)', 'social', 'at_risk', 'rejected', 'Just For You — buy 1 get 1, at_risk customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-01 18:34:31+05:30'),
('3D000000-0000-0000-0000-0000000003D7', 'Festive Audio Week — re_engagement / standard (983)', 're_engagement', 'standard', 'rejected', 'Just For You — free shipping, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 573849.23, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-01-17 18:23:40+05:30'),
('3D000000-0000-0000-0000-0000000003D8', 'Back-to-Office Tech Drive — clearance / regular (984)', 'clearance', 'regular', 'rejected', 'Big Savings — extra 10% on first order, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-08-26 16:03:51+05:30'),
('3D000000-0000-0000-0000-0000000003D9', 'Festive Electronics Sale — clearance / all (985)', 'clearance', 'all', 'rejected', 'Just For You — buy 1 get 1, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 730244.29, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-04-03 11:10:52+05:30'),
('3D000000-0000-0000-0000-0000000003DA', 'Weekend Flash Deal — re_engagement / all (986)', 're_engagement', 'all', 'rejected', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated comeback deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-04-27 14:56:30+05:30'),
('3D000000-0000-0000-0000-0000000003DB', 'VIP Early Access Drop — re_engagement / standard (987)', 're_engagement', 'standard', 'rejected', 'Limited Time — up to 40% off, standard customers', 'Hi customer,

We have curated comeback deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 147733.68, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-06 00:53:41+05:30'),
('3D000000-0000-0000-0000-0000000003DC', 'New Arrivals Spotlight — email / all (988)', 'email', 'all', 'rejected', 'Just For You — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 383951.92, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-12 03:55:49+05:30'),
('3D000000-0000-0000-0000-0000000003DD', 'Clearance Blast — clearance / all (989)', 'clearance', 'all', 'rejected', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-01-13 17:35:35+05:30'),
('3D000000-0000-0000-0000-0000000003DE', 'Re-engagement Comeback Offer — email / standard (990)', 'email', 'standard', 'rejected', 'Limited Time — extra 10% on first order, standard customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-01-05 14:42:01+05:30'),
('3D000000-0000-0000-0000-0000000003DF', 'Diwali Mega Sale — clearance / at_risk (991)', 'clearance', 'at_risk', 'rejected', 'Exclusive Offer — free shipping, at_risk customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-03-07 13:11:14+05:30'),
('3D000000-0000-0000-0000-0000000003E0', 'Monsoon Gadget Deals — clearance / regular (992)', 'clearance', 'regular', 'rejected', 'Limited Time — free shipping, regular customers', 'Hi customer,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 97529.86, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-05 22:56:52+05:30'),
('3D000000-0000-0000-0000-0000000003E1', 'Loyalty Reward Campaign — clearance / all (993)', 'clearance', 'all', 'rejected', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated clearance deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 357829.97, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-03-07 19:29:23+05:30'),
('3D000000-0000-0000-0000-0000000003E2', 'Cart Abandonment Winback — social / all (994)', 'social', 'all', 'rejected', 'Big Savings — free shipping, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 57904.03, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-03-29 05:07:57+05:30'),
('3D000000-0000-0000-0000-0000000003E3', 'Festive Audio Week — email / all (995)', 'email', 'all', 'rejected', 'Big Savings — up to 40% off, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-12-24 21:07:27+05:30'),
('3D000000-0000-0000-0000-0000000003E4', 'Back-to-Office Tech Drive — social / regular (996)', 'social', 'regular', 'rejected', 'Limited Time — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-07-08 20:20:29+05:30'),
('3D000000-0000-0000-0000-0000000003E5', 'Festive Electronics Sale — social / all (997)', 'social', 'all', 'rejected', 'Exclusive Offer — extra 10% on first order, all customers', 'Hi there,

We have curated exciting deals across electronics at TechBazaar. Offers valid till stock lasts.

— Team TechBazaar', 416460.88, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-02-06 12:05:22+05:30'),
('3D000000-0000-0000-0000-0000000003E6', 'Weekend Flash Deal — email / regular (998)', 'email', 'regular', 'rejected', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Shop the collection now.

— Team TechBazaar', 0, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-03-12 13:23:41+05:30'),
('3D000000-0000-0000-0000-0000000003E7', 'VIP Early Access Drop — social / regular (999)', 'social', 'regular', 'rejected', 'Just For You — buy 1 get 1, regular customers', 'Hi customer,

We have curated exciting deals across electronics at TechBazaar. Use code TECH10 at checkout.

— Team TechBazaar', 329494.22, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2025-11-13 14:59:23+05:30'),
('3D000000-0000-0000-0000-0000000003E8', 'New Arrivals Spotlight — social / vip (1000)', 'social', 'vip', 'rejected', 'Just For You — free shipping, vip customers', 'Hi VIP customer,

We have curated exciting deals across electronics at TechBazaar. Limited stock — grab yours today.

— Team TechBazaar', 881945.45, 0, 'marketing_agent', '20000000-0000-0000-0000-000000000001', NULL, NULL, '2026-06-07 11:23:09+05:30')
ON CONFLICT (campaign_id) DO NOTHING;
