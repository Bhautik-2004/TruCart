-- ticket_messages (20 rows)
-- ----------------------------------------------------------------------------
INSERT INTO ticket_messages (message_id, ticket_id, sender_type, message_content, metadata, created_at) VALUES
('3a000000-0000-0000-0000-000000000001', '39000000-0000-0000-0000-000000000001', 'customer', 'I placed the order a while ago but tracking hasn''t updated. Please check.', NULL, '2026-09-06 13:04:02+05:30'),
('3a000000-0000-0000-0000-000000000002', '39000000-0000-0000-0000-000000000002', 'customer', 'The package contained a different item than what I ordered.', NULL, '2026-09-07 04:02:34+05:30'),
('3a000000-0000-0000-0000-000000000003', '39000000-0000-0000-0000-000000000003', 'customer', 'The product arrived with visible damage and does not power on.', NULL, '2026-09-08 05:19:45+05:30'),
('3a000000-0000-0000-0000-000000000004', '39000000-0000-0000-0000-000000000004', 'customer', 'I returned the item two weeks ago but haven''t received my refund.', NULL, '2026-09-10 09:40:06+05:30'),
('3a000000-0000-0000-0000-000000000005', '39000000-0000-0000-0000-000000000005', 'customer', 'Does the exchange discount apply automatically at checkout?', NULL, '2026-09-10 04:50:29+05:30'),
('3a000000-0000-0000-0000-000000000006', '39000000-0000-0000-0000-000000000006', 'customer', 'The device keeps disconnecting from WiFi randomly.', NULL, '2026-09-11 10:59:14+05:30'),
('3a000000-0000-0000-0000-000000000007', '39000000-0000-0000-0000-000000000007', 'customer', 'Could you resend the GST invoice for my last order?', NULL, '2026-09-09 21:15:12+05:30'),
('3a000000-0000-0000-0000-000000000008', '39000000-0000-0000-0000-000000000008', 'customer', 'I''d like to cancel an order that hasn''t shipped yet.', NULL, '2026-09-07 15:22:45+05:30'),
('3a000000-0000-0000-0000-000000000009', '39000000-0000-0000-0000-000000000009', 'customer', 'Is this product covered under manufacturer warranty?', NULL, '2026-09-11 06:48:36+05:30'),
('3a000000-0000-0000-0000-00000000000a', '39000000-0000-0000-0000-00000000000a', 'customer', 'My order is 5 days past the estimated delivery date.', NULL, '2026-09-07 04:17:20+05:30'),
('3a000000-0000-0000-0000-00000000000b', '39000000-0000-0000-0000-00000000000b', 'customer', 'I returned the item two weeks ago but haven''t received my refund.', NULL, '2026-09-03 19:18:04+05:30'),
('3a000000-0000-0000-0000-00000000000c', '39000000-0000-0000-0000-00000000000b', 'agent', 'This needs manual review by our team — escalating for further investigation.', NULL, '2026-08-25 17:22:53+05:30'),
('3a000000-0000-0000-0000-00000000000d', '39000000-0000-0000-0000-00000000000c', 'customer', 'Does the exchange discount apply automatically at checkout?', NULL, '2026-08-31 11:59:09+05:30'),
('3a000000-0000-0000-0000-00000000000e', '39000000-0000-0000-0000-00000000000c', 'agent', 'This needs manual review by our team — escalating for further investigation.', NULL, '2026-09-04 14:34:05+05:30'),
('3a000000-0000-0000-0000-00000000000f', '39000000-0000-0000-0000-00000000000d', 'customer', 'The device keeps disconnecting from WiFi randomly.', NULL, '2026-09-07 06:37:00+05:30'),
('3a000000-0000-0000-0000-000000000010', '39000000-0000-0000-0000-00000000000d', 'agent', 'This needs manual review by our team — escalating for further investigation.', NULL, '2026-08-27 08:19:55+05:30'),
('3a000000-0000-0000-0000-000000000011', '39000000-0000-0000-0000-00000000000e', 'customer', 'Could you resend the GST invoice for my last order?', NULL, '2026-08-30 05:13:28+05:30'),
('3a000000-0000-0000-0000-000000000012', '39000000-0000-0000-0000-00000000000e', 'agent', 'This needs manual review by our team — escalating for further investigation.', NULL, '2026-09-07 07:24:34+05:30'),
('3a000000-0000-0000-0000-000000000013', '39000000-0000-0000-0000-00000000000f', 'customer', 'I''d like to cancel an order that hasn''t shipped yet.', NULL, '2026-09-02 22:18:16+05:30'),
('3a000000-0000-0000-0000-000000000014', '39000000-0000-0000-0000-00000000000f', 'agent', 'This needs manual review by our team — escalating for further investigation.', NULL, '2026-08-24 23:40:10+05:30')
ON CONFLICT (message_id) DO NOTHING;
