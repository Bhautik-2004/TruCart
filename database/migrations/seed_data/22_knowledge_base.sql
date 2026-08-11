-- knowledge_base (1000 rows)
-- RAG documents. `reference_id` points to a product or ticket where applicable; `embedding` is intentionally NULL (embeddings are produced by an embedding model at runtime).
-- ----------------------------------------------------------------------------
INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000001', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-29 07:28:28+05:30'),
('42000000-0000-0000-0000-000000000002', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-03-12 06:16:50+05:30'),
('42000000-0000-0000-0000-000000000003', 'product', '33000000-0000-0000-0000-000000000003', 'Xiaomi iPad Air 11 256GB (Green)', 'Xiaomi iPad Air 11 256GB (Green) (TB-TAB-00003)
Category: Tablets

Xiaomi iPad Air 11 256GB (Green) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-05-30 13:48:18+05:30'),
('42000000-0000-0000-0000-000000000004', 'ticket_history', '39000000-0000-0000-0000-000000000004', 'Received damaged TP-Link AC10 AX3000 (Black)', 'Ticket: Received damaged TP-Link AC10 AX3000 (Black)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-03-18 04:38:18+05:30'),
('42000000-0000-0000-0000-000000000005', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-03 05:56:58+05:30'),
('42000000-0000-0000-0000-000000000006', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-10-02 23:25:47+05:30'),
('42000000-0000-0000-0000-000000000007', 'product', '33000000-0000-0000-0000-000000000007', 'Fujifilm X-T50 4K (Black)', 'Fujifilm X-T50 4K (Black) (TB-CAM-00007)
Category: Cameras

Fujifilm X-T50 4K (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-07-24 17:29:03+05:30'),
('42000000-0000-0000-0000-000000000008', 'ticket_history', '39000000-0000-0000-0000-000000000008', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-06-22 03:06:38+05:30'),
('42000000-0000-0000-0000-000000000009', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-03 08:22:18+05:30'),
('42000000-0000-0000-0000-00000000000A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-08-04 04:33:01+05:30'),
('42000000-0000-0000-0000-00000000000B', 'product', '33000000-0000-0000-0000-00000000000B', 'TVS Zeb Max Pro Gaming (White)', 'TVS Zeb Max Pro Gaming (White) (TB-KBM-00011)
Category: Keyboards & Mice

TVS Zeb Max Pro Gaming (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-07-01 11:12:49+05:30'),
('42000000-0000-0000-0000-00000000000C', 'ticket_history', '39000000-0000-0000-0000-00000000000C', 'Received damaged Xiaomi OnePlus Band AMOLED (Teal)', 'Ticket: Received damaged Xiaomi OnePlus Band AMOLED (Teal)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-03-16 05:43:50+05:30'),
('42000000-0000-0000-0000-00000000000D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-11 04:17:33+05:30'),
('42000000-0000-0000-0000-00000000000E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-12-14 14:29:05+05:30'),
('42000000-0000-0000-0000-00000000000F', 'product', '33000000-0000-0000-0000-00000000000F', 'Amazon Echo Dot 5th Gen Doorbell (Silver)', 'Amazon Echo Dot 5th Gen Doorbell (Silver) (TB-SMT-00015)
Category: Smart Home

Amazon Echo Dot 5th Gen Doorbell (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-11-27 19:03:40+05:30'),
('42000000-0000-0000-0000-000000000010', 'ticket_history', '39000000-0000-0000-0000-000000000010', 'Received damaged Xiaomi Honeywell Thermostat Plug (White)', 'Ticket: Received damaged Xiaomi Honeywell Thermostat Plug (White)
Category: defective
Status: escalated
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-01-03 07:54:49+05:30'),
('42000000-0000-0000-0000-000000000011', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-04 11:52:04+05:30'),
('42000000-0000-0000-0000-000000000012', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-02-15 12:20:16+05:30'),
('42000000-0000-0000-0000-000000000013', 'product', '33000000-0000-0000-0000-000000000013', 'OnePlus OnePlus 13R 128GB (White)', 'OnePlus OnePlus 13R 128GB (White) (TB-PHN-00019)
Category: Smartphones

OnePlus OnePlus 13R 128GB (White) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-03-05 08:19:24+05:30'),
('42000000-0000-0000-0000-000000000014', 'ticket_history', '39000000-0000-0000-0000-000000000014', 'Refund not received for TB-ORD-000169', 'Ticket: Refund not received for TB-ORD-000169
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-04-23 14:31:15+05:30'),
('42000000-0000-0000-0000-000000000015', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-13 08:11:27+05:30'),
('42000000-0000-0000-0000-000000000016', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-01-05 00:59:39+05:30'),
('42000000-0000-0000-0000-000000000017', 'product', '33000000-0000-0000-0000-000000000017', 'Apple OnePlus Watch 3 SpO2 (Silver)', 'Apple OnePlus Watch 3 SpO2 (Silver) (TB-WAT-00023)
Category: Smartwatches

Apple OnePlus Watch 3 SpO2 (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-06-17 12:39:05+05:30'),
('42000000-0000-0000-0000-000000000018', 'ticket_history', '39000000-0000-0000-0000-000000000018', 'Where is my order TB-ORD-000532?', 'Ticket: Where is my order TB-ORD-000532?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-07-19 14:44:34+05:30'),
('42000000-0000-0000-0000-000000000019', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-20 21:07:09+05:30'),
('42000000-0000-0000-0000-00000000001A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-05-25 02:38:35+05:30'),
('42000000-0000-0000-0000-00000000001B', 'product', '33000000-0000-0000-0000-00000000001B', 'JBL Ultron X1 TWS Pair (Black)', 'JBL Ultron X1 TWS Pair (Black) (TB-SPK-00027)
Category: Speakers

JBL Ultron X1 TWS Pair (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-03-19 14:36:00+05:30'),
('42000000-0000-0000-0000-00000000001C', 'ticket_history', '39000000-0000-0000-0000-00000000001C', 'Received damaged Nikon EOS R50 4K (Silver)', 'Ticket: Received damaged Nikon EOS R50 4K (Silver)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-03-12 06:00:55+05:30'),
('42000000-0000-0000-0000-00000000001D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-22 21:38:03+05:30'),
('42000000-0000-0000-0000-00000000001E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-10-18 22:33:03+05:30'),
('42000000-0000-0000-0000-00000000001F', 'product', '33000000-0000-0000-0000-00000000001F', 'HP Pixma MG3670 Inkjet (Grey)', 'HP Pixma MG3670 Inkjet (Grey) (TB-PRT-00031)
Category: Printers

HP Pixma MG3670 Inkjet (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-12-09 01:53:48+05:30'),
('42000000-0000-0000-0000-000000000020', 'ticket_history', '39000000-0000-0000-0000-000000000020', 'Refund not received for TB-ORD-000760', 'Ticket: Refund not received for TB-ORD-000760
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-07-20 19:56:27+05:30'),
('42000000-0000-0000-0000-000000000021', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-08 01:27:46+05:30'),
('42000000-0000-0000-0000-000000000022', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-06-10 16:47:52+05:30'),
('42000000-0000-0000-0000-000000000023', 'product', '33000000-0000-0000-0000-000000000023', 'Noise boAt Flex 5ATM (Black)', 'Noise boAt Flex 5ATM (Black) (TB-WRL-00035)
Category: Wearables

Noise boAt Flex 5ATM (Black) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-05-14 08:55:27+05:30'),
('42000000-0000-0000-0000-000000000024', 'ticket_history', '39000000-0000-0000-0000-000000000024', 'Received damaged Zebronics Keychron K2 Pro Mechanical (Grey)', 'Ticket: Received damaged Zebronics Keychron K2 Pro Mechanical (Grey)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-04-17 21:07:41+05:30'),
('42000000-0000-0000-0000-000000000025', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-04 03:06:37+05:30'),
('42000000-0000-0000-0000-000000000026', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-08-03 03:32:47+05:30'),
('42000000-0000-0000-0000-000000000027', 'product', '33000000-0000-0000-0000-000000000027', 'OnePlus iPad Air 11 64GB (Grey)', 'OnePlus iPad Air 11 64GB (Grey) (TB-TAB-00039)
Category: Tablets

OnePlus iPad Air 11 64GB (Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-09-05 06:53:25+05:30'),
('42000000-0000-0000-0000-000000000028', 'ticket_history', '39000000-0000-0000-0000-000000000028', 'Where is my order TB-ORD-000170?', 'Ticket: Where is my order TB-ORD-000170?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-07-13 13:28:54+05:30'),
('42000000-0000-0000-0000-000000000029', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-30 16:30:04+05:30'),
('42000000-0000-0000-0000-00000000002A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-02-04 16:54:22+05:30'),
('42000000-0000-0000-0000-00000000002B', 'product', '33000000-0000-0000-0000-00000000002B', 'Fujifilm EOS R50 Vlog (Silver)', 'Fujifilm EOS R50 Vlog (Silver) (TB-CAM-00043)
Category: Cameras

Fujifilm EOS R50 Vlog (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-07-22 10:22:01+05:30'),
('42000000-0000-0000-0000-00000000002C', 'ticket_history', '39000000-0000-0000-0000-00000000002C', 'Wrong item received for TB-ORD-000241', 'Ticket: Wrong item received for TB-ORD-000241
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-01-14 12:53:00+05:30'),
('42000000-0000-0000-0000-00000000002D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-16 08:49:22+05:30'),
('42000000-0000-0000-0000-00000000002E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-10-01 07:00:03+05:30'),
('42000000-0000-0000-0000-00000000002F', 'product', '33000000-0000-0000-0000-00000000002F', 'Corsair K70 Multimedia (White)', 'Corsair K70 Multimedia (White) (TB-KBM-00047)
Category: Keyboards & Mice

Corsair K70 Multimedia (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-05-02 22:44:16+05:30'),
('42000000-0000-0000-0000-000000000030', 'ticket_history', '39000000-0000-0000-0000-000000000030', 'Where is my order TB-ORD-000333?', 'Ticket: Where is my order TB-ORD-000333?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-10-10 23:04:24+05:30'),
('42000000-0000-0000-0000-000000000031', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-07 21:28:53+05:30'),
('42000000-0000-0000-0000-000000000032', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-04-08 05:15:06+05:30'),
('42000000-0000-0000-0000-000000000033', 'product', '33000000-0000-0000-0000-000000000033', 'Honeywell Tapo L510E Vacuum (Silver)', 'Honeywell Tapo L510E Vacuum (Silver) (TB-SMT-00051)
Category: Smart Home

Honeywell Tapo L510E Vacuum (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-03-17 13:24:51+05:30'),
('42000000-0000-0000-0000-000000000034', 'ticket_history', '39000000-0000-0000-0000-000000000034', 'Need help with order TB-ORD-000151', 'Ticket: Need help with order TB-ORD-000151
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-09-07 09:08:49+05:30'),
('42000000-0000-0000-0000-000000000035', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-01 13:34:35+05:30'),
('42000000-0000-0000-0000-000000000036', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-07-31 02:36:18+05:30'),
('42000000-0000-0000-0000-000000000037', 'product', '33000000-0000-0000-0000-000000000037', 'Xiaomi Pixel 9a 512GB (Silver)', 'Xiaomi Pixel 9a 512GB (Silver) (TB-PHN-00055)
Category: Smartphones

Xiaomi Pixel 9a 512GB (Silver) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-08-14 20:07:12+05:30'),
('42000000-0000-0000-0000-000000000038', 'ticket_history', '39000000-0000-0000-0000-000000000038', 'Need help with order TB-ORD-000328', 'Ticket: Need help with order TB-ORD-000328
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-08-29 02:08:56+05:30'),
('42000000-0000-0000-0000-000000000039', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-09 17:02:09+05:30'),
('42000000-0000-0000-0000-00000000003A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-08-09 23:12:56+05:30'),
('42000000-0000-0000-0000-00000000003B', 'product', '33000000-0000-0000-0000-00000000003B', 'Fire-Boltt OnePlus Watch 3 46mm (Silver)', 'Fire-Boltt OnePlus Watch 3 46mm (Silver) (TB-WAT-00059)
Category: Smartwatches

Fire-Boltt OnePlus Watch 3 46mm (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-12-08 08:49:41+05:30'),
('42000000-0000-0000-0000-00000000003C', 'ticket_history', '39000000-0000-0000-0000-00000000003C', 'Refund not received for TB-ORD-000768', 'Ticket: Refund not received for TB-ORD-000768
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-11-12 19:30:54+05:30'),
('42000000-0000-0000-0000-00000000003D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-22 05:28:41+05:30'),
('42000000-0000-0000-0000-00000000003E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-02-06 11:37:11+05:30'),
('42000000-0000-0000-0000-00000000003F', 'product', '33000000-0000-0000-0000-00000000003F', 'ZEBRONICS ZEB-Alexa Wireless (Black)', 'ZEBRONICS ZEB-Alexa Wireless (Black) (TB-SPK-00063)
Category: Speakers

ZEBRONICS ZEB-Alexa Wireless (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-11-03 08:13:30+05:30'),
('42000000-0000-0000-0000-000000000040', 'ticket_history', '39000000-0000-0000-0000-000000000040', 'Where is my order TB-ORD-000507?', 'Ticket: Where is my order TB-ORD-000507?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-12-02 11:20:54+05:30'),
('42000000-0000-0000-0000-000000000041', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-02 13:26:34+05:30'),
('42000000-0000-0000-0000-000000000042', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-03-30 19:49:46+05:30'),
('42000000-0000-0000-0000-000000000043', 'product', '33000000-0000-0000-0000-000000000043', 'Epson DeskJet 2700 Tank (Black)', 'Epson DeskJet 2700 Tank (Black) (TB-PRT-00067)
Category: Printers

Epson DeskJet 2700 Tank (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-01-20 10:45:50+05:30'),
('42000000-0000-0000-0000-000000000044', 'ticket_history', '39000000-0000-0000-0000-000000000044', 'Need help with order TB-ORD-000205', 'Ticket: Need help with order TB-ORD-000205
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-08-17 19:21:38+05:30'),
('42000000-0000-0000-0000-000000000045', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-15 18:59:26+05:30'),
('42000000-0000-0000-0000-000000000046', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-09-24 15:46:57+05:30'),
('42000000-0000-0000-0000-000000000047', 'product', '33000000-0000-0000-0000-000000000047', 'boAt OnePlus Band 5ATM (Coral)', 'boAt OnePlus Band 5ATM (Coral) (TB-WRL-00071)
Category: Wearables

boAt OnePlus Band 5ATM (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-05-11 07:51:32+05:30'),
('42000000-0000-0000-0000-000000000048', 'ticket_history', '39000000-0000-0000-0000-000000000048', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-01-20 06:00:45+05:30'),
('42000000-0000-0000-0000-000000000049', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-09 06:45:39+05:30'),
('42000000-0000-0000-0000-00000000004A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-11-29 05:33:46+05:30'),
('42000000-0000-0000-0000-00000000004B', 'product', '33000000-0000-0000-0000-00000000004B', 'Lenovo Galaxy Tab S9 FE 64GB (Silver)', 'Lenovo Galaxy Tab S9 FE 64GB (Silver) (TB-TAB-00075)
Category: Tablets

Lenovo Galaxy Tab S9 FE 64GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-12-21 02:16:36+05:30'),
('42000000-0000-0000-0000-00000000004C', 'ticket_history', '39000000-0000-0000-0000-00000000004C', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-04-30 19:00:13+05:30'),
('42000000-0000-0000-0000-00000000004D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-26 08:01:38+05:30'),
('42000000-0000-0000-0000-00000000004E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-12-13 19:08:01+05:30'),
('42000000-0000-0000-0000-00000000004F', 'product', '33000000-0000-0000-0000-00000000004F', 'Sony Alpha ZV-E10 Vlog (Black)', 'Sony Alpha ZV-E10 Vlog (Black) (TB-CAM-00079)
Category: Cameras

Sony Alpha ZV-E10 Vlog (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-02-03 15:56:56+05:30'),
('42000000-0000-0000-0000-000000000050', 'ticket_history', '39000000-0000-0000-0000-000000000050', 'Received damaged Panasonic PowerShot SX740 Kit 50mm (Black)', 'Ticket: Received damaged Panasonic PowerShot SX740 Kit 50mm (Black)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-05-29 19:52:42+05:30'),
('42000000-0000-0000-0000-000000000051', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-04-19 04:58:09+05:30'),
('42000000-0000-0000-0000-000000000052', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-01-14 18:46:53+05:30'),
('42000000-0000-0000-0000-000000000053', 'product', '33000000-0000-0000-0000-000000000053', 'TVS K380 RGB (Grey)', 'TVS K380 RGB (Grey) (TB-KBM-00083)
Category: Keyboards & Mice

TVS K380 RGB (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-06-26 19:41:37+05:30'),
('42000000-0000-0000-0000-000000000054', 'ticket_history', '39000000-0000-0000-0000-000000000054', 'Need help', 'Ticket: Need help
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-09-14 05:16:32+05:30'),
('42000000-0000-0000-0000-000000000055', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-25 13:09:01+05:30'),
('42000000-0000-0000-0000-000000000056', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-02-17 03:40:21+05:30'),
('42000000-0000-0000-0000-000000000057', 'product', '33000000-0000-0000-0000-000000000057', 'TP-Link Tapo L510E Camera (Black)', 'TP-Link Tapo L510E Camera (Black) (TB-SMT-00087)
Category: Smart Home

TP-Link Tapo L510E Camera (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-02-16 02:22:12+05:30'),
('42000000-0000-0000-0000-000000000058', 'ticket_history', '39000000-0000-0000-0000-000000000058', 'Need help with order TB-ORD-000604', 'Ticket: Need help with order TB-ORD-000604
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-07-05 21:27:00+05:30'),
('42000000-0000-0000-0000-000000000059', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-20 04:57:31+05:30'),
('42000000-0000-0000-0000-00000000005A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-06-21 12:53:31+05:30'),
('42000000-0000-0000-0000-00000000005B', 'product', '33000000-0000-0000-0000-00000000005B', 'Google Redmi 14C 128GB (Ocean Teal)', 'Google Redmi 14C 128GB (Ocean Teal) (TB-PHN-00091)
Category: Smartphones

Google Redmi 14C 128GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-04-17 01:53:53+05:30'),
('42000000-0000-0000-0000-00000000005C', 'ticket_history', '39000000-0000-0000-0000-00000000005C', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-08-25 18:30:23+05:30'),
('42000000-0000-0000-0000-00000000005D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-04 20:24:54+05:30'),
('42000000-0000-0000-0000-00000000005E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-06-24 13:55:19+05:30'),
('42000000-0000-0000-0000-00000000005F', 'product', '33000000-0000-0000-0000-00000000005F', 'Samsung OnePlus Watch 3 GPS (Black)', 'Samsung OnePlus Watch 3 GPS (Black) (TB-WAT-00095)
Category: Smartwatches

Samsung OnePlus Watch 3 GPS (Black) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-05-23 14:56:44+05:30'),
('42000000-0000-0000-0000-000000000060', 'ticket_history', '39000000-0000-0000-0000-000000000060', 'Where is my order TB-ORD-000180?', 'Ticket: Where is my order TB-ORD-000180?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-09-30 06:34:14+05:30'),
('42000000-0000-0000-0000-000000000061', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-21 00:10:10+05:30'),
('42000000-0000-0000-0000-000000000062', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-04-25 03:03:22+05:30'),
('42000000-0000-0000-0000-000000000063', 'product', '33000000-0000-0000-0000-000000000063', 'Marshall ZEB-Alexa Wireless (Black)', 'Marshall ZEB-Alexa Wireless (Black) (TB-SPK-00099)
Category: Speakers

Marshall ZEB-Alexa Wireless (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-08-29 23:16:03+05:30'),
('42000000-0000-0000-0000-000000000064', 'ticket_history', '39000000-0000-0000-0000-000000000064', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-12-21 10:30:51+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000065', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-20 07:04:50+05:30'),
('42000000-0000-0000-0000-000000000066', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-07 19:43:39+05:30'),
('42000000-0000-0000-0000-000000000067', 'product', '33000000-0000-0000-0000-000000000067', 'HP DeskJet 2700 Laser (Grey)', 'HP DeskJet 2700 Laser (Grey) (TB-PRT-00103)
Category: Printers

HP DeskJet 2700 Laser (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-03-31 18:04:42+05:30'),
('42000000-0000-0000-0000-000000000068', 'ticket_history', '39000000-0000-0000-0000-000000000068', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-03-11 17:55:44+05:30'),
('42000000-0000-0000-0000-000000000069', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-03-18 01:17:34+05:30'),
('42000000-0000-0000-0000-00000000006A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-07-16 20:45:06+05:30'),
('42000000-0000-0000-0000-00000000006B', 'product', '33000000-0000-0000-0000-00000000006B', 'Xiaomi Noise Halo 5ATM (Teal)', 'Xiaomi Noise Halo 5ATM (Teal) (TB-WRL-00107)
Category: Wearables

Xiaomi Noise Halo 5ATM (Teal) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-11-01 07:39:53+05:30'),
('42000000-0000-0000-0000-00000000006C', 'ticket_history', '39000000-0000-0000-0000-00000000006C', 'Wrong item received for TB-ORD-000265', 'Ticket: Wrong item received for TB-ORD-000265
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-08-19 16:03:55+05:30'),
('42000000-0000-0000-0000-00000000006D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-24 04:08:21+05:30'),
('42000000-0000-0000-0000-00000000006E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-11-03 04:28:13+05:30'),
('42000000-0000-0000-0000-00000000006F', 'product', '33000000-0000-0000-0000-00000000006F', 'Lenovo Redmi Pad Pro 256GB (Space Grey)', 'Lenovo Redmi Pad Pro 256GB (Space Grey) (TB-TAB-00111)
Category: Tablets

Lenovo Redmi Pad Pro 256GB (Space Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-03-16 20:37:36+05:30'),
('42000000-0000-0000-0000-000000000070', 'ticket_history', '39000000-0000-0000-0000-000000000070', 'Wrong item received for TB-ORD-000896', 'Ticket: Wrong item received for TB-ORD-000896
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-06-24 22:38:54+05:30'),
('42000000-0000-0000-0000-000000000071', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-24 06:11:12+05:30'),
('42000000-0000-0000-0000-000000000072', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-09-25 00:47:40+05:30'),
('42000000-0000-0000-0000-000000000073', 'product', '33000000-0000-0000-0000-000000000073', 'Fujifilm EOS 200D Body Only (Black)', 'Fujifilm EOS 200D Body Only (Black) (TB-CAM-00115)
Category: Cameras

Fujifilm EOS 200D Body Only (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-08-17 22:20:46+05:30'),
('42000000-0000-0000-0000-000000000074', 'ticket_history', '39000000-0000-0000-0000-000000000074', 'Wrong item received for TB-ORD-000714', 'Ticket: Wrong item received for TB-ORD-000714
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-11-30 09:49:15+05:30'),
('42000000-0000-0000-0000-000000000075', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-17 13:24:05+05:30'),
('42000000-0000-0000-0000-000000000076', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-11-18 23:59:04+05:30'),
('42000000-0000-0000-0000-000000000077', 'product', '33000000-0000-0000-0000-000000000077', 'Logitech KM7120 Mechanical (Black)', 'Logitech KM7120 Mechanical (Black) (TB-KBM-00119)
Category: Keyboards & Mice

Logitech KM7120 Mechanical (Black) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-09-24 04:21:47+05:30'),
('42000000-0000-0000-0000-000000000078', 'ticket_history', '39000000-0000-0000-0000-000000000078', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-03-18 15:26:51+05:30'),
('42000000-0000-0000-0000-000000000079', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-15 03:52:59+05:30'),
('42000000-0000-0000-0000-00000000007A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-07-24 14:28:57+05:30'),
('42000000-0000-0000-0000-00000000007B', 'product', '33000000-0000-0000-0000-00000000007B', 'Wipro Syska Bulb Plug (Silver)', 'Wipro Syska Bulb Plug (Silver) (TB-SMT-00123)
Category: Smart Home

Wipro Syska Bulb Plug (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-07-16 12:20:40+05:30'),
('42000000-0000-0000-0000-00000000007C', 'ticket_history', '39000000-0000-0000-0000-00000000007C', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-03-07 01:26:46+05:30'),
('42000000-0000-0000-0000-00000000007D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-02 10:24:55+05:30'),
('42000000-0000-0000-0000-00000000007E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-06-01 07:46:06+05:30'),
('42000000-0000-0000-0000-00000000007F', 'product', '33000000-0000-0000-0000-00000000007F', 'OnePlus Pixel 9a 128GB (Titanium Grey)', 'OnePlus Pixel 9a 128GB (Titanium Grey) (TB-PHN-00127)
Category: Smartphones

OnePlus Pixel 9a 128GB (Titanium Grey) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-12-08 07:42:34+05:30'),
('42000000-0000-0000-0000-000000000080', 'ticket_history', '39000000-0000-0000-0000-000000000080', 'Need help', 'Ticket: Need help
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-12-25 05:48:42+05:30'),
('42000000-0000-0000-0000-000000000081', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-25 13:59:55+05:30'),
('42000000-0000-0000-0000-000000000082', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-05-20 15:30:00+05:30'),
('42000000-0000-0000-0000-000000000083', 'product', '33000000-0000-0000-0000-000000000083', 'Xiaomi Watch Ultra 2 46mm (Pebble)', 'Xiaomi Watch Ultra 2 46mm (Pebble) (TB-WAT-00131)
Category: Smartwatches

Xiaomi Watch Ultra 2 46mm (Pebble) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-04-18 13:39:40+05:30'),
('42000000-0000-0000-0000-000000000084', 'ticket_history', '39000000-0000-0000-0000-000000000084', 'Need help with order TB-ORD-000537', 'Ticket: Need help with order TB-ORD-000537
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-06-09 16:00:19+05:30'),
('42000000-0000-0000-0000-000000000085', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-19 18:59:31+05:30'),
('42000000-0000-0000-0000-000000000086', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-14 21:38:44+05:30'),
('42000000-0000-0000-0000-000000000087', 'product', '33000000-0000-0000-0000-000000000087', 'JBL Charge 6 30W (Blue)', 'JBL Charge 6 30W (Blue) (TB-SPK-00135)
Category: Speakers

JBL Charge 6 30W (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-12-24 07:27:04+05:30'),
('42000000-0000-0000-0000-000000000088', 'ticket_history', '39000000-0000-0000-0000-000000000088', 'Wrong item received for TB-ORD-000612', 'Ticket: Wrong item received for TB-ORD-000612
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-04-17 04:24:48+05:30'),
('42000000-0000-0000-0000-000000000089', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-24 13:43:45+05:30'),
('42000000-0000-0000-0000-00000000008A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-06-22 10:34:52+05:30'),
('42000000-0000-0000-0000-00000000008B', 'product', '33000000-0000-0000-0000-00000000008B', 'HP WorkCentre Tank (Grey)', 'HP WorkCentre Tank (Grey) (TB-PRT-00139)
Category: Printers

HP WorkCentre Tank (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-05-25 06:40:23+05:30'),
('42000000-0000-0000-0000-00000000008C', 'ticket_history', '39000000-0000-0000-0000-00000000008C', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-01-11 10:46:57+05:30'),
('42000000-0000-0000-0000-00000000008D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-11-20 03:30:33+05:30'),
('42000000-0000-0000-0000-00000000008E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-01-27 12:10:16+05:30'),
('42000000-0000-0000-0000-00000000008F', 'product', '33000000-0000-0000-0000-00000000008F', 'Fitbit Fitbit Charge 6 AMOLED (Black)', 'Fitbit Fitbit Charge 6 AMOLED (Black) (TB-WRL-00143)
Category: Wearables

Fitbit Fitbit Charge 6 AMOLED (Black) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-02-14 09:06:55+05:30'),
('42000000-0000-0000-0000-000000000090', 'ticket_history', '39000000-0000-0000-0000-000000000090', 'Received damaged Crucial Ultra Dual USB-C (Red)', 'Ticket: Received damaged Crucial Ultra Dual USB-C (Red)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-06-07 22:39:17+05:30'),
('42000000-0000-0000-0000-000000000091', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-25 02:18:54+05:30'),
('42000000-0000-0000-0000-000000000092', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-05-05 03:37:06+05:30'),
('42000000-0000-0000-0000-000000000093', 'product', '33000000-0000-0000-0000-000000000093', 'Apple Galaxy Tab A9+ 128GB (Space Grey)', 'Apple Galaxy Tab A9+ 128GB (Space Grey) (TB-TAB-00147)
Category: Tablets

Apple Galaxy Tab A9+ 128GB (Space Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-06-16 20:32:53+05:30'),
('42000000-0000-0000-0000-000000000094', 'ticket_history', '39000000-0000-0000-0000-000000000094', 'Received damaged Xiaomi boAt Flex Heart Rate (Coral)', 'Ticket: Received damaged Xiaomi boAt Flex Heart Rate (Coral)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-05-08 07:47:38+05:30'),
('42000000-0000-0000-0000-000000000095', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-27 21:08:58+05:30'),
('42000000-0000-0000-0000-000000000096', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-12-06 07:01:09+05:30'),
('42000000-0000-0000-0000-000000000097', 'product', '33000000-0000-0000-0000-000000000097', 'Panasonic EOS R50 4K (Silver)', 'Panasonic EOS R50 4K (Silver) (TB-CAM-00151)
Category: Cameras

Panasonic EOS R50 4K (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-10-18 01:05:23+05:30'),
('42000000-0000-0000-0000-000000000098', 'ticket_history', '39000000-0000-0000-0000-000000000098', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-25 06:24:58+05:30'),
('42000000-0000-0000-0000-000000000099', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-12 16:01:50+05:30'),
('42000000-0000-0000-0000-00000000009A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-03-11 05:58:40+05:30'),
('42000000-0000-0000-0000-00000000009B', 'product', '33000000-0000-0000-0000-00000000009B', 'Logitech Zeb Max Pro Wireless (White)', 'Logitech Zeb Max Pro Wireless (White) (TB-KBM-00155)
Category: Keyboards & Mice

Logitech Zeb Max Pro Wireless (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-02-19 11:25:53+05:30'),
('42000000-0000-0000-0000-00000000009C', 'ticket_history', '39000000-0000-0000-0000-00000000009C', 'Where is my order TB-ORD-000460?', 'Ticket: Where is my order TB-ORD-000460?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-08-08 15:05:01+05:30'),
('42000000-0000-0000-0000-00000000009D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-18 08:31:09+05:30'),
('42000000-0000-0000-0000-00000000009E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-06-10 12:45:32+05:30'),
('42000000-0000-0000-0000-00000000009F', 'product', '33000000-0000-0000-0000-00000000009F', 'Wipro Hue White Plug (Black)', 'Wipro Hue White Plug (Black) (TB-SMT-00159)
Category: Smart Home

Wipro Hue White Plug (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-02-27 14:17:53+05:30'),
('42000000-0000-0000-0000-0000000000A0', 'ticket_history', '39000000-0000-0000-0000-0000000000A0', 'Wrong item received for TB-ORD-000257', 'Ticket: Wrong item received for TB-ORD-000257
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-12-05 13:06:03+05:30'),
('42000000-0000-0000-0000-0000000000A1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-09 08:07:16+05:30'),
('42000000-0000-0000-0000-0000000000A2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-05-09 14:28:12+05:30'),
('42000000-0000-0000-0000-0000000000A3', 'product', '33000000-0000-0000-0000-0000000000A3', 'Realme Nothing Phone 3a 256GB (Black)', 'Realme Nothing Phone 3a 256GB (Black) (TB-PHN-00163)
Category: Smartphones

Realme Nothing Phone 3a 256GB (Black) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-02-22 21:18:58+05:30'),
('42000000-0000-0000-0000-0000000000A4', 'ticket_history', '39000000-0000-0000-0000-0000000000A4', 'Received damaged boAt Fire-Boltt Smart 5ATM (Coral)', 'Ticket: Received damaged boAt Fire-Boltt Smart 5ATM (Coral)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-06-19 00:18:33+05:30'),
('42000000-0000-0000-0000-0000000000A5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-09 12:46:17+05:30'),
('42000000-0000-0000-0000-0000000000A6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-06-28 18:35:24+05:30'),
('42000000-0000-0000-0000-0000000000A7', 'product', '33000000-0000-0000-0000-0000000000A7', 'OnePlus Galaxy Watch7 Bluetooth Calling (Midnight)', 'OnePlus Galaxy Watch7 Bluetooth Calling (Midnight) (TB-WAT-00167)
Category: Smartwatches

OnePlus Galaxy Watch7 Bluetooth Calling (Midnight) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-03-28 04:50:12+05:30'),
('42000000-0000-0000-0000-0000000000A8', 'ticket_history', '39000000-0000-0000-0000-0000000000A8', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-10-18 15:59:44+05:30'),
('42000000-0000-0000-0000-0000000000A9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-14 10:35:47+05:30'),
('42000000-0000-0000-0000-0000000000AA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-05-05 10:25:32+05:30'),
('42000000-0000-0000-0000-0000000000AB', 'product', '33000000-0000-0000-0000-0000000000AB', 'ZEBRONICS JBL Go 4 TWS Pair (Blue)', 'ZEBRONICS JBL Go 4 TWS Pair (Blue) (TB-SPK-00171)
Category: Speakers

ZEBRONICS JBL Go 4 TWS Pair (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-03-07 06:07:28+05:30'),
('42000000-0000-0000-0000-0000000000AC', 'ticket_history', '39000000-0000-0000-0000-0000000000AC', 'Received damaged boAt boAt Flex AMOLED (Pink)', 'Ticket: Received damaged boAt boAt Flex AMOLED (Pink)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-02-23 22:00:54+05:30'),
('42000000-0000-0000-0000-0000000000AD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-07 19:51:22+05:30'),
('42000000-0000-0000-0000-0000000000AE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-05-29 04:18:22+05:30'),
('42000000-0000-0000-0000-0000000000AF', 'product', '33000000-0000-0000-0000-0000000000AF', 'Epson LaserJet M111a WiFi (White)', 'Epson LaserJet M111a WiFi (White) (TB-PRT-00175)
Category: Printers

Epson LaserJet M111a WiFi (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-02-05 07:20:05+05:30'),
('42000000-0000-0000-0000-0000000000B0', 'ticket_history', '39000000-0000-0000-0000-0000000000B0', 'Wrong item received for TB-ORD-000955', 'Ticket: Wrong item received for TB-ORD-000955
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-06-26 20:33:46+05:30'),
('42000000-0000-0000-0000-0000000000B1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-12 08:07:31+05:30'),
('42000000-0000-0000-0000-0000000000B2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-10-20 19:36:55+05:30'),
('42000000-0000-0000-0000-0000000000B3', 'product', '33000000-0000-0000-0000-0000000000B3', 'Noise Halo Heart Rate (Teal)', 'Noise Halo Heart Rate (Teal) (TB-WRL-00179)
Category: Wearables

Noise Halo Heart Rate (Teal) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-10-17 00:12:45+05:30'),
('42000000-0000-0000-0000-0000000000B4', 'ticket_history', '39000000-0000-0000-0000-0000000000B4', 'Received damaged Dell MX Keys S Multimedia (Grey)', 'Ticket: Received damaged Dell MX Keys S Multimedia (Grey)
Category: defective
Status: open
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-08-01 16:08:02+05:30'),
('42000000-0000-0000-0000-0000000000B5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-04 20:14:20+05:30'),
('42000000-0000-0000-0000-0000000000B6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-02-13 16:52:12+05:30'),
('42000000-0000-0000-0000-0000000000B7', 'product', '33000000-0000-0000-0000-0000000000B7', 'Xiaomi Redmi Pad Pro 128GB (Green)', 'Xiaomi Redmi Pad Pro 128GB (Green) (TB-TAB-00183)
Category: Tablets

Xiaomi Redmi Pad Pro 128GB (Green) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-11-22 02:43:56+05:30'),
('42000000-0000-0000-0000-0000000000B8', 'ticket_history', '39000000-0000-0000-0000-0000000000B8', 'Received damaged Microsoft Xbox Series S Bundled (Carbon)', 'Ticket: Received damaged Microsoft Xbox Series S Bundled (Carbon)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-08-02 23:38:50+05:30'),
('42000000-0000-0000-0000-0000000000B9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-29 05:59:43+05:30'),
('42000000-0000-0000-0000-0000000000BA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-05-23 03:29:24+05:30'),
('42000000-0000-0000-0000-0000000000BB', 'product', '33000000-0000-0000-0000-0000000000BB', 'Canon HERO13 Black Vlog (Black)', 'Canon HERO13 Black Vlog (Black) (TB-CAM-00187)
Category: Cameras

Canon HERO13 Black Vlog (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2026-05-19 14:46:01+05:30'),
('42000000-0000-0000-0000-0000000000BC', 'ticket_history', '39000000-0000-0000-0000-0000000000BC', 'Received damaged OnePlus Galaxy Watch7 Bluetooth Calling (Midnight)', 'Ticket: Received damaged OnePlus Galaxy Watch7 Bluetooth Calling (Midnight)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-03-25 18:35:59+05:30'),
('42000000-0000-0000-0000-0000000000BD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-10 00:49:31+05:30'),
('42000000-0000-0000-0000-0000000000BE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-05-28 13:39:17+05:30'),
('42000000-0000-0000-0000-0000000000BF', 'product', '33000000-0000-0000-0000-0000000000BF', 'Razer KM7120 Multimedia (Blue)', 'Razer KM7120 Multimedia (Blue) (TB-KBM-00191)
Category: Keyboards & Mice

Razer KM7120 Multimedia (Blue) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-07-06 18:54:14+05:30'),
('42000000-0000-0000-0000-0000000000C0', 'ticket_history', '39000000-0000-0000-0000-0000000000C0', 'Wrong item received for TB-ORD-000116', 'Ticket: Wrong item received for TB-ORD-000116
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-05-17 15:39:26+05:30'),
('42000000-0000-0000-0000-0000000000C1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-06 05:25:48+05:30'),
('42000000-0000-0000-0000-0000000000C2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-02-14 11:50:01+05:30'),
('42000000-0000-0000-0000-0000000000C3', 'product', '33000000-0000-0000-0000-0000000000C3', 'Honeywell Nest Mini Bulb (Black)', 'Honeywell Nest Mini Bulb (Black) (TB-SMT-00195)
Category: Smart Home

Honeywell Nest Mini Bulb (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-09-23 06:14:28+05:30'),
('42000000-0000-0000-0000-0000000000C4', 'ticket_history', '39000000-0000-0000-0000-0000000000C4', 'Received damaged Tenda UniFi U6 Mesh (Black)', 'Ticket: Received damaged Tenda UniFi U6 Mesh (Black)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-04-20 14:56:41+05:30'),
('42000000-0000-0000-0000-0000000000C5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-23 18:37:10+05:30'),
('42000000-0000-0000-0000-0000000000C6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-04-12 06:54:47+05:30'),
('42000000-0000-0000-0000-0000000000C7', 'product', '33000000-0000-0000-0000-0000000000C7', 'Realme iPhone 16 64GB (Black)', 'Realme iPhone 16 64GB (Black) (TB-PHN-00199)
Category: Smartphones

Realme iPhone 16 64GB (Black) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-03-29 15:41:32+05:30'),
('42000000-0000-0000-0000-0000000000C8', 'ticket_history', '39000000-0000-0000-0000-0000000000C8', 'Received damaged OnePlus iPad 10th Gen 256GB (Space Grey)', 'Ticket: Received damaged OnePlus iPad 10th Gen 256GB (Space Grey)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-03-31 13:20:15+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-0000000000C9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-14 08:01:54+05:30'),
('42000000-0000-0000-0000-0000000000CA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-07-09 08:31:43+05:30'),
('42000000-0000-0000-0000-0000000000CB', 'product', '33000000-0000-0000-0000-0000000000CB', 'Fire-Boltt Amazfit Active AMOLED (Midnight)', 'Fire-Boltt Amazfit Active AMOLED (Midnight) (TB-WAT-00203)
Category: Smartwatches

Fire-Boltt Amazfit Active AMOLED (Midnight) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-02-23 12:27:11+05:30'),
('42000000-0000-0000-0000-0000000000CC', 'ticket_history', '39000000-0000-0000-0000-0000000000CC', 'Where is my order TB-ORD-000277?', 'Ticket: Where is my order TB-ORD-000277?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-01-20 04:20:20+05:30'),
('42000000-0000-0000-0000-0000000000CD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-20 02:42:54+05:30'),
('42000000-0000-0000-0000-0000000000CE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-07-26 06:32:33+05:30'),
('42000000-0000-0000-0000-0000000000CF', 'product', '33000000-0000-0000-0000-0000000000CF', 'JBL JBL Go 4 TWS Pair (Grey)', 'JBL JBL Go 4 TWS Pair (Grey) (TB-SPK-00207)
Category: Speakers

JBL JBL Go 4 TWS Pair (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-08-01 19:31:00+05:30'),
('42000000-0000-0000-0000-0000000000D0', 'ticket_history', '39000000-0000-0000-0000-0000000000D0', 'Where is my order TB-ORD-000543?', 'Ticket: Where is my order TB-ORD-000543?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-08-08 21:29:36+05:30'),
('42000000-0000-0000-0000-0000000000D1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-07 17:29:16+05:30'),
('42000000-0000-0000-0000-0000000000D2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-11-23 12:19:48+05:30'),
('42000000-0000-0000-0000-0000000000D3', 'product', '33000000-0000-0000-0000-0000000000D3', 'Epson DCP-T220 WiFi (Black)', 'Epson DCP-T220 WiFi (Black) (TB-PRT-00211)
Category: Printers

Epson DCP-T220 WiFi (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-03-19 10:06:06+05:30'),
('42000000-0000-0000-0000-0000000000D4', 'ticket_history', '39000000-0000-0000-0000-0000000000D4', 'Refund not received for TB-ORD-000530', 'Ticket: Refund not received for TB-ORD-000530
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-12-19 22:17:27+05:30'),
('42000000-0000-0000-0000-0000000000D5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-03 07:26:01+05:30'),
('42000000-0000-0000-0000-0000000000D6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-05-25 10:58:19+05:30'),
('42000000-0000-0000-0000-0000000000D7', 'product', '33000000-0000-0000-0000-0000000000D7', 'boAt boAt Flex SpO2 (Blue)', 'boAt boAt Flex SpO2 (Blue) (TB-WRL-00215)
Category: Wearables

boAt boAt Flex SpO2 (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-03-23 18:14:11+05:30'),
('42000000-0000-0000-0000-0000000000D8', 'ticket_history', '39000000-0000-0000-0000-0000000000D8', 'Refund not received for TB-ORD-000443', 'Ticket: Refund not received for TB-ORD-000443
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-02-25 20:49:37+05:30'),
('42000000-0000-0000-0000-0000000000D9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-12 11:14:44+05:30'),
('42000000-0000-0000-0000-0000000000DA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-06-06 14:28:11+05:30'),
('42000000-0000-0000-0000-0000000000DB', 'product', '33000000-0000-0000-0000-0000000000DB', 'Lenovo Galaxy Tab A9+ 128GB (Sage)', 'Lenovo Galaxy Tab A9+ 128GB (Sage) (TB-TAB-00219)
Category: Tablets

Lenovo Galaxy Tab A9+ 128GB (Sage) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-10-09 18:28:01+05:30'),
('42000000-0000-0000-0000-0000000000DC', 'ticket_history', '39000000-0000-0000-0000-0000000000DC', 'Refund not received for TB-ORD-000309', 'Ticket: Refund not received for TB-ORD-000309
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-08-24 04:04:56+05:30'),
('42000000-0000-0000-0000-0000000000DD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-04 10:18:15+05:30'),
('42000000-0000-0000-0000-0000000000DE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-06-12 20:34:56+05:30'),
('42000000-0000-0000-0000-0000000000DF', 'product', '33000000-0000-0000-0000-0000000000DF', 'Nikon EOS R50 4K (Silver)', 'Nikon EOS R50 4K (Silver) (TB-CAM-00223)
Category: Cameras

Nikon EOS R50 4K (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-02-21 19:20:24+05:30'),
('42000000-0000-0000-0000-0000000000E0', 'ticket_history', '39000000-0000-0000-0000-0000000000E0', 'Need help', 'Ticket: Need help
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-10-08 12:05:14+05:30'),
('42000000-0000-0000-0000-0000000000E1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-05 01:55:46+05:30'),
('42000000-0000-0000-0000-0000000000E2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-08-09 18:42:42+05:30'),
('42000000-0000-0000-0000-0000000000E3', 'product', '33000000-0000-0000-0000-0000000000E3', 'Razer K380 Ergonomic (Blue)', 'Razer K380 Ergonomic (Blue) (TB-KBM-00227)
Category: Keyboards & Mice

Razer K380 Ergonomic (Blue) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-09-09 11:53:06+05:30'),
('42000000-0000-0000-0000-0000000000E4', 'ticket_history', '39000000-0000-0000-0000-0000000000E4', 'Need help with order TB-ORD-000300', 'Ticket: Need help with order TB-ORD-000300
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-11-08 23:01:08+05:30'),
('42000000-0000-0000-0000-0000000000E5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-14 22:48:31+05:30'),
('42000000-0000-0000-0000-0000000000E6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-01-02 11:09:58+05:30'),
('42000000-0000-0000-0000-0000000000E7', 'product', '33000000-0000-0000-0000-0000000000E7', 'Syska Nest Mini Plug (Silver)', 'Syska Nest Mini Plug (Silver) (TB-SMT-00231)
Category: Smart Home

Syska Nest Mini Plug (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-10-31 14:50:47+05:30'),
('42000000-0000-0000-0000-0000000000E8', 'ticket_history', '39000000-0000-0000-0000-0000000000E8', 'Need help', 'Ticket: Need help
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-03-20 13:37:35+05:30'),
('42000000-0000-0000-0000-0000000000E9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-30 18:24:52+05:30'),
('42000000-0000-0000-0000-0000000000EA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-11 06:48:09+05:30'),
('42000000-0000-0000-0000-0000000000EB', 'product', '33000000-0000-0000-0000-0000000000EB', 'Samsung Redmi 14C 256GB (Midnight Blue)', 'Samsung Redmi 14C 256GB (Midnight Blue) (TB-PHN-00235)
Category: Smartphones

Samsung Redmi 14C 256GB (Midnight Blue) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-03-24 01:16:40+05:30'),
('42000000-0000-0000-0000-0000000000EC', 'ticket_history', '39000000-0000-0000-0000-0000000000EC', 'Refund not received for TB-ORD-000282', 'Ticket: Refund not received for TB-ORD-000282
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-03-08 15:11:00+05:30'),
('42000000-0000-0000-0000-0000000000ED', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-16 19:02:11+05:30'),
('42000000-0000-0000-0000-0000000000EE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-03-21 06:26:35+05:30'),
('42000000-0000-0000-0000-0000000000EF', 'product', '33000000-0000-0000-0000-0000000000EF', 'Amazfit Fire-Boltt Invincible Bluetooth Calling (Pebble)', 'Amazfit Fire-Boltt Invincible Bluetooth Calling (Pebble) (TB-WAT-00239)
Category: Smartwatches

Amazfit Fire-Boltt Invincible Bluetooth Calling (Pebble) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-06-16 12:15:22+05:30'),
('42000000-0000-0000-0000-0000000000F0', 'ticket_history', '39000000-0000-0000-0000-0000000000F0', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-05-12 10:57:22+05:30'),
('42000000-0000-0000-0000-0000000000F1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-15 02:44:33+05:30'),
('42000000-0000-0000-0000-0000000000F2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-01-19 18:39:25+05:30'),
('42000000-0000-0000-0000-0000000000F3', 'product', '33000000-0000-0000-0000-0000000000F3', 'Ultron SRS-XB100 TWS Pair (Grey)', 'Ultron SRS-XB100 TWS Pair (Grey) (TB-SPK-00243)
Category: Speakers

Ultron SRS-XB100 TWS Pair (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-11-17 18:43:49+05:30'),
('42000000-0000-0000-0000-0000000000F4', 'ticket_history', '39000000-0000-0000-0000-0000000000F4', 'Received damaged Amazfit OnePlus Watch 3 Bluetooth Calling (Pebble)', 'Ticket: Received damaged Amazfit OnePlus Watch 3 Bluetooth Calling (Pebble)
Category: defective
Status: open
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-08-10 14:33:06+05:30'),
('42000000-0000-0000-0000-0000000000F5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-15 16:37:30+05:30'),
('42000000-0000-0000-0000-0000000000F6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-05-07 16:02:12+05:30'),
('42000000-0000-0000-0000-0000000000F7', 'product', '33000000-0000-0000-0000-0000000000F7', 'Epson EcoTank L3250 Inkjet (Black)', 'Epson EcoTank L3250 Inkjet (Black) (TB-PRT-00247)
Category: Printers

Epson EcoTank L3250 Inkjet (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-03-12 15:52:50+05:30'),
('42000000-0000-0000-0000-0000000000F8', 'ticket_history', '39000000-0000-0000-0000-0000000000F8', 'Received damaged Sony PlayStation 5 Pro 2TB (Carbon)', 'Ticket: Received damaged Sony PlayStation 5 Pro 2TB (Carbon)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-06-18 10:14:41+05:30'),
('42000000-0000-0000-0000-0000000000F9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-20 21:37:45+05:30'),
('42000000-0000-0000-0000-0000000000FA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-03-22 19:12:10+05:30'),
('42000000-0000-0000-0000-0000000000FB', 'product', '33000000-0000-0000-0000-0000000000FB', 'Noise OnePlus Band 5ATM (Pink)', 'Noise OnePlus Band 5ATM (Pink) (TB-WRL-00251)
Category: Wearables

Noise OnePlus Band 5ATM (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-01-09 00:36:46+05:30'),
('42000000-0000-0000-0000-0000000000FC', 'ticket_history', '39000000-0000-0000-0000-0000000000FC', 'Refund not received for TB-ORD-000454', 'Ticket: Refund not received for TB-ORD-000454
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-01-01 12:53:34+05:30'),
('42000000-0000-0000-0000-0000000000FD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-12 23:47:35+05:30'),
('42000000-0000-0000-0000-0000000000FE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-28 02:51:13+05:30'),
('42000000-0000-0000-0000-0000000000FF', 'product', '33000000-0000-0000-0000-0000000000FF', 'Apple Lenovo Tab P12 256GB (Silver)', 'Apple Lenovo Tab P12 256GB (Silver) (TB-TAB-00255)
Category: Tablets

Apple Lenovo Tab P12 256GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-11-21 00:30:00+05:30'),
('42000000-0000-0000-0000-000000000100', 'ticket_history', '39000000-0000-0000-0000-000000000100', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-03-07 06:47:51+05:30'),
('42000000-0000-0000-0000-000000000101', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-26 23:47:47+05:30'),
('42000000-0000-0000-0000-000000000102', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-07-15 10:57:48+05:30'),
('42000000-0000-0000-0000-000000000103', 'product', '33000000-0000-0000-0000-000000000103', 'Panasonic HERO13 Black Kit 50mm (Black)', 'Panasonic HERO13 Black Kit 50mm (Black) (TB-CAM-00259)
Category: Cameras

Panasonic HERO13 Black Kit 50mm (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-02-11 01:44:51+05:30'),
('42000000-0000-0000-0000-000000000104', 'ticket_history', '39000000-0000-0000-0000-000000000104', 'Received damaged Ambrane Galaxy Fast Charge Fast Charge (White)', 'Ticket: Received damaged Ambrane Galaxy Fast Charge Fast Charge (White)
Category: defective
Status: open
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-01-20 03:58:59+05:30'),
('42000000-0000-0000-0000-000000000105', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-07 21:08:40+05:30'),
('42000000-0000-0000-0000-000000000106', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-10-09 08:47:14+05:30'),
('42000000-0000-0000-0000-000000000107', 'product', '33000000-0000-0000-0000-000000000107', 'Logitech Keychron K2 Pro Ergonomic (White)', 'Logitech Keychron K2 Pro Ergonomic (White) (TB-KBM-00263)
Category: Keyboards & Mice

Logitech Keychron K2 Pro Ergonomic (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-04-19 11:39:19+05:30'),
('42000000-0000-0000-0000-000000000108', 'ticket_history', '39000000-0000-0000-0000-000000000108', 'Need help', 'Ticket: Need help
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-03-29 14:15:25+05:30'),
('42000000-0000-0000-0000-000000000109', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-10 10:42:38+05:30'),
('42000000-0000-0000-0000-00000000010A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-01-12 00:12:53+05:30'),
('42000000-0000-0000-0000-00000000010B', 'product', '33000000-0000-0000-0000-00000000010B', 'Syska Hue White Speaker (White)', 'Syska Hue White Speaker (White) (TB-SMT-00267)
Category: Smart Home

Syska Hue White Speaker (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-08-05 07:04:42+05:30'),
('42000000-0000-0000-0000-00000000010C', 'ticket_history', '39000000-0000-0000-0000-00000000010C', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-01-27 05:50:59+05:30'),
('42000000-0000-0000-0000-00000000010D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-09 10:36:37+05:30'),
('42000000-0000-0000-0000-00000000010E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-08-07 05:25:19+05:30'),
('42000000-0000-0000-0000-00000000010F', 'product', '33000000-0000-0000-0000-00000000010F', 'Xiaomi Poco X7 Pro 512GB (Black)', 'Xiaomi Poco X7 Pro 512GB (Black) (TB-PHN-00271)
Category: Smartphones

Xiaomi Poco X7 Pro 512GB (Black) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-04-11 23:14:36+05:30'),
('42000000-0000-0000-0000-000000000110', 'ticket_history', '39000000-0000-0000-0000-000000000110', 'Refund not received for TB-ORD-000942', 'Ticket: Refund not received for TB-ORD-000942
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-01-12 04:29:03+05:30'),
('42000000-0000-0000-0000-000000000111', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-03-28 20:24:07+05:30'),
('42000000-0000-0000-0000-000000000112', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-08-06 12:15:06+05:30'),
('42000000-0000-0000-0000-000000000113', 'product', '33000000-0000-0000-0000-000000000113', 'Amazfit Noise ColorFit Pro 5 46mm (Rose Gold)', 'Amazfit Noise ColorFit Pro 5 46mm (Rose Gold) (TB-WAT-00275)
Category: Smartwatches

Amazfit Noise ColorFit Pro 5 46mm (Rose Gold) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-08-09 23:02:31+05:30'),
('42000000-0000-0000-0000-000000000114', 'ticket_history', '39000000-0000-0000-0000-000000000114', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-09-28 10:14:51+05:30'),
('42000000-0000-0000-0000-000000000115', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-23 02:05:28+05:30'),
('42000000-0000-0000-0000-000000000116', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-06-24 05:46:29+05:30'),
('42000000-0000-0000-0000-000000000117', 'product', '33000000-0000-0000-0000-000000000117', 'JBL Stone 750 IPX7 (Yellow)', 'JBL Stone 750 IPX7 (Yellow) (TB-SPK-00279)
Category: Speakers

JBL Stone 750 IPX7 (Yellow) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-03-14 08:56:30+05:30'),
('42000000-0000-0000-0000-000000000118', 'ticket_history', '39000000-0000-0000-0000-000000000118', 'Received damaged Ultron Emberton II 30W (Blue)', 'Ticket: Received damaged Ultron Emberton II 30W (Blue)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-05-12 06:46:56+05:30'),
('42000000-0000-0000-0000-000000000119', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-28 05:05:01+05:30'),
('42000000-0000-0000-0000-00000000011A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-06 11:18:02+05:30'),
('42000000-0000-0000-0000-00000000011B', 'product', '33000000-0000-0000-0000-00000000011B', 'Epson MFC-J995 Auto Duplex (Grey)', 'Epson MFC-J995 Auto Duplex (Grey) (TB-PRT-00283)
Category: Printers

Epson MFC-J995 Auto Duplex (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-06-07 01:42:15+05:30'),
('42000000-0000-0000-0000-00000000011C', 'ticket_history', '39000000-0000-0000-0000-00000000011C', 'Received damaged JBL Ultron X1 TWS Pair (Black)', 'Ticket: Received damaged JBL Ultron X1 TWS Pair (Black)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-07-25 07:30:01+05:30'),
('42000000-0000-0000-0000-00000000011D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-02 13:35:23+05:30'),
('42000000-0000-0000-0000-00000000011E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-08-29 09:37:40+05:30'),
('42000000-0000-0000-0000-00000000011F', 'product', '33000000-0000-0000-0000-00000000011F', 'Noise Mi Band 9 Heart Rate (Black)', 'Noise Mi Band 9 Heart Rate (Black) (TB-WRL-00287)
Category: Wearables

Noise Mi Band 9 Heart Rate (Black) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-07-07 15:59:13+05:30'),
('42000000-0000-0000-0000-000000000120', 'ticket_history', '39000000-0000-0000-0000-000000000120', 'Refund not received for TB-ORD-000070', 'Ticket: Refund not received for TB-ORD-000070
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-05-14 13:43:43+05:30'),
('42000000-0000-0000-0000-000000000121', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-11 10:49:24+05:30'),
('42000000-0000-0000-0000-000000000122', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-05-20 07:06:49+05:30'),
('42000000-0000-0000-0000-000000000123', 'product', '33000000-0000-0000-0000-000000000123', 'Xiaomi iPad Pro 13 256GB (Silver)', 'Xiaomi iPad Pro 13 256GB (Silver) (TB-TAB-00291)
Category: Tablets

Xiaomi iPad Pro 13 256GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-08-27 09:52:21+05:30'),
('42000000-0000-0000-0000-000000000124', 'ticket_history', '39000000-0000-0000-0000-000000000124', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-04-26 11:54:32+05:30'),
('42000000-0000-0000-0000-000000000125', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-02 07:40:12+05:30'),
('42000000-0000-0000-0000-000000000126', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-08-09 19:06:56+05:30'),
('42000000-0000-0000-0000-000000000127', 'product', '33000000-0000-0000-0000-000000000127', 'Sony D3500 4K (Black)', 'Sony D3500 4K (Black) (TB-CAM-00295)
Category: Cameras

Sony D3500 4K (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-02-24 15:13:39+05:30'),
('42000000-0000-0000-0000-000000000128', 'ticket_history', '39000000-0000-0000-0000-000000000128', 'Where is my order TB-ORD-000301?', 'Ticket: Where is my order TB-ORD-000301?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-12-07 13:29:19+05:30'),
('42000000-0000-0000-0000-000000000129', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-30 03:53:42+05:30'),
('42000000-0000-0000-0000-00000000012A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-01-19 03:42:49+05:30'),
('42000000-0000-0000-0000-00000000012B', 'product', '33000000-0000-0000-0000-00000000012B', 'Zebronics K380 Mechanical (White)', 'Zebronics K380 Mechanical (White) (TB-KBM-00299)
Category: Keyboards & Mice

Zebronics K380 Mechanical (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-08-30 15:38:26+05:30'),
('42000000-0000-0000-0000-00000000012C', 'ticket_history', '39000000-0000-0000-0000-00000000012C', 'Need help with order TB-ORD-000264', 'Ticket: Need help with order TB-ORD-000264
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-09-15 07:31:08+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-00000000012D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-18 12:55:27+05:30'),
('42000000-0000-0000-0000-00000000012E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-11 18:01:43+05:30'),
('42000000-0000-0000-0000-00000000012F', 'product', '33000000-0000-0000-0000-00000000012F', 'Google Hue White Doorbell (Silver)', 'Google Hue White Doorbell (Silver) (TB-SMT-00303)
Category: Smart Home

Google Hue White Doorbell (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-10-02 23:14:01+05:30'),
('42000000-0000-0000-0000-000000000130', 'ticket_history', '39000000-0000-0000-0000-000000000130', 'Where is my order TB-ORD-000722?', 'Ticket: Where is my order TB-ORD-000722?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-04-19 18:11:54+05:30'),
('42000000-0000-0000-0000-000000000131', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-04 11:09:34+05:30'),
('42000000-0000-0000-0000-000000000132', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-10-08 07:47:47+05:30'),
('42000000-0000-0000-0000-000000000133', 'product', '33000000-0000-0000-0000-000000000133', 'Samsung Galaxy A56 128GB (Ocean Teal)', 'Samsung Galaxy A56 128GB (Ocean Teal) (TB-PHN-00307)
Category: Smartphones

Samsung Galaxy A56 128GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-08-26 03:06:14+05:30'),
('42000000-0000-0000-0000-000000000134', 'ticket_history', '39000000-0000-0000-0000-000000000134', 'Need help with order TB-ORD-000657', 'Ticket: Need help with order TB-ORD-000657
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-07-03 20:26:36+05:30'),
('42000000-0000-0000-0000-000000000135', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-28 12:30:45+05:30'),
('42000000-0000-0000-0000-000000000136', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-10-30 10:25:24+05:30'),
('42000000-0000-0000-0000-000000000137', 'product', '33000000-0000-0000-0000-000000000137', 'Fire-Boltt Fire-Boltt Invincible SpO2 (Coral)', 'Fire-Boltt Fire-Boltt Invincible SpO2 (Coral) (TB-WAT-00311)
Category: Smartwatches

Fire-Boltt Fire-Boltt Invincible SpO2 (Coral) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-05-03 22:15:54+05:30'),
('42000000-0000-0000-0000-000000000138', 'ticket_history', '39000000-0000-0000-0000-000000000138', 'Where is my order TB-ORD-000629?', 'Ticket: Where is my order TB-ORD-000629?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-04-23 01:50:24+05:30'),
('42000000-0000-0000-0000-000000000139', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-04-27 15:27:33+05:30'),
('42000000-0000-0000-0000-00000000013A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-28 20:45:14+05:30'),
('42000000-0000-0000-0000-00000000013B', 'product', '33000000-0000-0000-0000-00000000013B', 'Marshall Emberton II BT 5.3 (Blue)', 'Marshall Emberton II BT 5.3 (Blue) (TB-SPK-00315)
Category: Speakers

Marshall Emberton II BT 5.3 (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-02-04 00:04:43+05:30'),
('42000000-0000-0000-0000-00000000013C', 'ticket_history', '39000000-0000-0000-0000-00000000013C', 'Need help with order TB-ORD-000528', 'Ticket: Need help with order TB-ORD-000528
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-07-08 10:25:58+05:30'),
('42000000-0000-0000-0000-00000000013D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-15 10:53:13+05:30'),
('42000000-0000-0000-0000-00000000013E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-28 06:36:42+05:30'),
('42000000-0000-0000-0000-00000000013F', 'product', '33000000-0000-0000-0000-00000000013F', 'HP DeskJet 2700 Inkjet (Black)', 'HP DeskJet 2700 Inkjet (Black) (TB-PRT-00319)
Category: Printers

HP DeskJet 2700 Inkjet (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-08-03 03:53:17+05:30'),
('42000000-0000-0000-0000-000000000140', 'ticket_history', '39000000-0000-0000-0000-000000000140', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-11-07 02:51:02+05:30'),
('42000000-0000-0000-0000-000000000141', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-17 07:26:30+05:30'),
('42000000-0000-0000-0000-000000000142', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-02-11 01:45:49+05:30'),
('42000000-0000-0000-0000-000000000143', 'product', '33000000-0000-0000-0000-000000000143', 'Fire-Boltt OnePlus Band 5ATM (Pink)', 'Fire-Boltt OnePlus Band 5ATM (Pink) (TB-WRL-00323)
Category: Wearables

Fire-Boltt OnePlus Band 5ATM (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-01-03 00:42:26+05:30'),
('42000000-0000-0000-0000-000000000144', 'ticket_history', '39000000-0000-0000-0000-000000000144', 'Need help', 'Ticket: Need help
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-03-06 07:36:07+05:30'),
('42000000-0000-0000-0000-000000000145', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-24 07:41:12+05:30'),
('42000000-0000-0000-0000-000000000146', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-09-24 23:50:47+05:30'),
('42000000-0000-0000-0000-000000000147', 'product', '33000000-0000-0000-0000-000000000147', 'Apple Galaxy Tab S9 FE 64GB (Sage)', 'Apple Galaxy Tab S9 FE 64GB (Sage) (TB-TAB-00327)
Category: Tablets

Apple Galaxy Tab S9 FE 64GB (Sage) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-04-21 21:31:53+05:30'),
('42000000-0000-0000-0000-000000000148', 'ticket_history', '39000000-0000-0000-0000-000000000148', 'Received damaged boAt SRS-XB100 TWS Pair (Black)', 'Ticket: Received damaged boAt SRS-XB100 TWS Pair (Black)
Category: defective
Status: escalated
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-03-22 21:18:28+05:30'),
('42000000-0000-0000-0000-000000000149', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-17 03:48:22+05:30'),
('42000000-0000-0000-0000-00000000014A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-05-12 13:52:51+05:30'),
('42000000-0000-0000-0000-00000000014B', 'product', '33000000-0000-0000-0000-00000000014B', 'Sony Alpha 7 IV Vlog (Grey)', 'Sony Alpha 7 IV Vlog (Grey) (TB-CAM-00331)
Category: Cameras

Sony Alpha 7 IV Vlog (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-09-03 06:09:23+05:30'),
('42000000-0000-0000-0000-00000000014C', 'ticket_history', '39000000-0000-0000-0000-00000000014C', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-10-11 08:03:32+05:30'),
('42000000-0000-0000-0000-00000000014D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-02 05:35:12+05:30'),
('42000000-0000-0000-0000-00000000014E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-12-28 12:49:22+05:30'),
('42000000-0000-0000-0000-00000000014F', 'product', '33000000-0000-0000-0000-00000000014F', 'Dell Zeb Max Pro Gaming (Carbon)', 'Dell Zeb Max Pro Gaming (Carbon) (TB-KBM-00335)
Category: Keyboards & Mice

Dell Zeb Max Pro Gaming (Carbon) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-03-01 04:35:44+05:30'),
('42000000-0000-0000-0000-000000000150', 'ticket_history', '39000000-0000-0000-0000-000000000150', 'Wrong item received for TB-ORD-000109', 'Ticket: Wrong item received for TB-ORD-000109
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-01-05 23:47:59+05:30'),
('42000000-0000-0000-0000-000000000151', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-31 03:02:12+05:30'),
('42000000-0000-0000-0000-000000000152', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-07-16 15:21:55+05:30'),
('42000000-0000-0000-0000-000000000153', 'product', '33000000-0000-0000-0000-000000000153', 'Google Nest Mini Speaker (Black)', 'Google Nest Mini Speaker (Black) (TB-SMT-00339)
Category: Smart Home

Google Nest Mini Speaker (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-04-17 15:52:56+05:30'),
('42000000-0000-0000-0000-000000000154', 'ticket_history', '39000000-0000-0000-0000-000000000154', 'Need help with order TB-ORD-000742', 'Ticket: Need help with order TB-ORD-000742
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-11-30 13:51:50+05:30'),
('42000000-0000-0000-0000-000000000155', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-27 12:23:26+05:30'),
('42000000-0000-0000-0000-000000000156', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-10-19 11:02:59+05:30'),
('42000000-0000-0000-0000-000000000157', 'product', '33000000-0000-0000-0000-000000000157', 'OnePlus Nothing Phone 3a 512GB (Black)', 'OnePlus Nothing Phone 3a 512GB (Black) (TB-PHN-00343)
Category: Smartphones

OnePlus Nothing Phone 3a 512GB (Black) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-02-28 09:12:40+05:30'),
('42000000-0000-0000-0000-000000000158', 'ticket_history', '39000000-0000-0000-0000-000000000158', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-07-31 01:32:38+05:30'),
('42000000-0000-0000-0000-000000000159', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-27 10:08:21+05:30'),
('42000000-0000-0000-0000-00000000015A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-06-16 09:25:36+05:30'),
('42000000-0000-0000-0000-00000000015B', 'product', '33000000-0000-0000-0000-00000000015B', 'Apple Watch Series 10 46mm (Coral)', 'Apple Watch Series 10 46mm (Coral) (TB-WAT-00347)
Category: Smartwatches

Apple Watch Series 10 46mm (Coral) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-02-08 20:17:13+05:30'),
('42000000-0000-0000-0000-00000000015C', 'ticket_history', '39000000-0000-0000-0000-00000000015C', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: open
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-07-17 03:39:55+05:30'),
('42000000-0000-0000-0000-00000000015D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-05 01:22:42+05:30'),
('42000000-0000-0000-0000-00000000015E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-04-11 07:11:19+05:30'),
('42000000-0000-0000-0000-00000000015F', 'product', '33000000-0000-0000-0000-00000000015F', 'Sony Emberton II Wireless (Blue)', 'Sony Emberton II Wireless (Blue) (TB-SPK-00351)
Category: Speakers

Sony Emberton II Wireless (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-12-03 20:35:25+05:30'),
('42000000-0000-0000-0000-000000000160', 'ticket_history', '39000000-0000-0000-0000-000000000160', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-05-26 17:21:05+05:30'),
('42000000-0000-0000-0000-000000000161', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-14 16:58:51+05:30'),
('42000000-0000-0000-0000-000000000162', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-05-08 14:49:54+05:30'),
('42000000-0000-0000-0000-000000000163', 'product', '33000000-0000-0000-0000-000000000163', 'Xerox DeskJet 2700 WiFi (White)', 'Xerox DeskJet 2700 WiFi (White) (TB-PRT-00355)
Category: Printers

Xerox DeskJet 2700 WiFi (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-10-12 12:36:03+05:30'),
('42000000-0000-0000-0000-000000000164', 'ticket_history', '39000000-0000-0000-0000-000000000164', 'Where is my order TB-ORD-000487?', 'Ticket: Where is my order TB-ORD-000487?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-04-12 11:27:15+05:30'),
('42000000-0000-0000-0000-000000000165', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-12 00:04:34+05:30'),
('42000000-0000-0000-0000-000000000166', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-27 04:24:58+05:30'),
('42000000-0000-0000-0000-000000000167', 'product', '33000000-0000-0000-0000-000000000167', 'Xiaomi boAt Flex 5ATM (Pink)', 'Xiaomi boAt Flex 5ATM (Pink) (TB-WRL-00359)
Category: Wearables

Xiaomi boAt Flex 5ATM (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-07-09 23:15:16+05:30'),
('42000000-0000-0000-0000-000000000168', 'ticket_history', '39000000-0000-0000-0000-000000000168', 'Need help with order TB-ORD-000680', 'Ticket: Need help with order TB-ORD-000680
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-28 23:15:27+05:30'),
('42000000-0000-0000-0000-000000000169', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-14 19:33:48+05:30'),
('42000000-0000-0000-0000-00000000016A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-07-21 07:42:53+05:30'),
('42000000-0000-0000-0000-00000000016B', 'product', '33000000-0000-0000-0000-00000000016B', 'Lenovo Galaxy Tab S9 FE 64GB (Grey)', 'Lenovo Galaxy Tab S9 FE 64GB (Grey) (TB-TAB-00363)
Category: Tablets

Lenovo Galaxy Tab S9 FE 64GB (Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-07-09 06:07:09+05:30'),
('42000000-0000-0000-0000-00000000016C', 'ticket_history', '39000000-0000-0000-0000-00000000016C', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-04-30 12:14:53+05:30'),
('42000000-0000-0000-0000-00000000016D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-03 08:03:56+05:30'),
('42000000-0000-0000-0000-00000000016E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-10-10 19:00:08+05:30'),
('42000000-0000-0000-0000-00000000016F', 'product', '33000000-0000-0000-0000-00000000016F', 'Nikon Alpha ZV-E10 Kit 50mm (Grey)', 'Nikon Alpha ZV-E10 Kit 50mm (Grey) (TB-CAM-00367)
Category: Cameras

Nikon Alpha ZV-E10 Kit 50mm (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-10-17 15:11:11+05:30'),
('42000000-0000-0000-0000-000000000170', 'ticket_history', '39000000-0000-0000-0000-000000000170', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-01-21 16:53:28+05:30'),
('42000000-0000-0000-0000-000000000171', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-13 09:47:43+05:30'),
('42000000-0000-0000-0000-000000000172', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-02-10 07:42:54+05:30'),
('42000000-0000-0000-0000-000000000173', 'product', '33000000-0000-0000-0000-000000000173', 'Zebronics Corsair K70 Gaming (Grey)', 'Zebronics Corsair K70 Gaming (Grey) (TB-KBM-00371)
Category: Keyboards & Mice

Zebronics Corsair K70 Gaming (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-05-28 19:08:18+05:30'),
('42000000-0000-0000-0000-000000000174', 'ticket_history', '39000000-0000-0000-0000-000000000174', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-12-22 17:48:56+05:30'),
('42000000-0000-0000-0000-000000000175', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-16 09:49:52+05:30'),
('42000000-0000-0000-0000-000000000176', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-05-12 18:52:53+05:30'),
('42000000-0000-0000-0000-000000000177', 'product', '33000000-0000-0000-0000-000000000177', 'Xiaomi Syska Bulb Speaker (Black)', 'Xiaomi Syska Bulb Speaker (Black) (TB-SMT-00375)
Category: Smart Home

Xiaomi Syska Bulb Speaker (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-07-07 04:33:33+05:30'),
('42000000-0000-0000-0000-000000000178', 'ticket_history', '39000000-0000-0000-0000-000000000178', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-07-29 02:32:44+05:30'),
('42000000-0000-0000-0000-000000000179', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-15 00:05:30+05:30'),
('42000000-0000-0000-0000-00000000017A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-06-23 07:57:21+05:30'),
('42000000-0000-0000-0000-00000000017B', 'product', '33000000-0000-0000-0000-00000000017B', 'OnePlus Pixel 9a 256GB (Midnight Blue)', 'OnePlus Pixel 9a 256GB (Midnight Blue) (TB-PHN-00379)
Category: Smartphones

OnePlus Pixel 9a 256GB (Midnight Blue) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-01-22 13:39:05+05:30'),
('42000000-0000-0000-0000-00000000017C', 'ticket_history', '39000000-0000-0000-0000-00000000017C', 'Wrong item received for TB-ORD-000024', 'Ticket: Wrong item received for TB-ORD-000024
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-05-28 14:47:39+05:30'),
('42000000-0000-0000-0000-00000000017D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-17 10:43:37+05:30'),
('42000000-0000-0000-0000-00000000017E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-09-03 16:43:42+05:30'),
('42000000-0000-0000-0000-00000000017F', 'product', '33000000-0000-0000-0000-00000000017F', 'Xiaomi Redmi Watch 5 46mm (Coral)', 'Xiaomi Redmi Watch 5 46mm (Coral) (TB-WAT-00383)
Category: Smartwatches

Xiaomi Redmi Watch 5 46mm (Coral) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-04-15 06:23:22+05:30'),
('42000000-0000-0000-0000-000000000180', 'ticket_history', '39000000-0000-0000-0000-000000000180', 'Wrong item received for TB-ORD-000778', 'Ticket: Wrong item received for TB-ORD-000778
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-07-23 07:23:24+05:30'),
('42000000-0000-0000-0000-000000000181', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-13 22:55:08+05:30'),
('42000000-0000-0000-0000-000000000182', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-21 13:37:27+05:30'),
('42000000-0000-0000-0000-000000000183', 'product', '33000000-0000-0000-0000-000000000183', 'ZEBRONICS Charge 6 TWS Pair (Red)', 'ZEBRONICS Charge 6 TWS Pair (Red) (TB-SPK-00387)
Category: Speakers

ZEBRONICS Charge 6 TWS Pair (Red) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-01-17 14:13:14+05:30'),
('42000000-0000-0000-0000-000000000184', 'ticket_history', '39000000-0000-0000-0000-000000000184', 'Received damaged ZEBRONICS Ultron X1 IPX7 (Red)', 'Ticket: Received damaged ZEBRONICS Ultron X1 IPX7 (Red)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-10-15 07:34:50+05:30'),
('42000000-0000-0000-0000-000000000185', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-12-08 04:47:32+05:30'),
('42000000-0000-0000-0000-000000000186', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-01-09 10:35:49+05:30'),
('42000000-0000-0000-0000-000000000187', 'product', '33000000-0000-0000-0000-000000000187', 'Epson WorkCentre Inkjet (White)', 'Epson WorkCentre Inkjet (White) (TB-PRT-00391)
Category: Printers

Epson WorkCentre Inkjet (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-07-10 18:42:38+05:30'),
('42000000-0000-0000-0000-000000000188', 'ticket_history', '39000000-0000-0000-0000-000000000188', 'Where is my order TB-ORD-000420?', 'Ticket: Where is my order TB-ORD-000420?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-07-04 13:13:04+05:30'),
('42000000-0000-0000-0000-000000000189', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-16 01:39:07+05:30'),
('42000000-0000-0000-0000-00000000018A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-06-08 12:00:03+05:30'),
('42000000-0000-0000-0000-00000000018B', 'product', '33000000-0000-0000-0000-00000000018B', 'Fire-Boltt Fitbit Charge 6 Heart Rate (Coral)', 'Fire-Boltt Fitbit Charge 6 Heart Rate (Coral) (TB-WRL-00395)
Category: Wearables

Fire-Boltt Fitbit Charge 6 Heart Rate (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-05-15 21:24:08+05:30'),
('42000000-0000-0000-0000-00000000018C', 'ticket_history', '39000000-0000-0000-0000-00000000018C', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-08-31 13:29:25+05:30'),
('42000000-0000-0000-0000-00000000018D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-26 07:39:51+05:30'),
('42000000-0000-0000-0000-00000000018E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-02-24 19:35:29+05:30'),
('42000000-0000-0000-0000-00000000018F', 'product', '33000000-0000-0000-0000-00000000018F', 'OnePlus Lenovo Tab P12 64GB (Grey)', 'OnePlus Lenovo Tab P12 64GB (Grey) (TB-TAB-00399)
Category: Tablets

OnePlus Lenovo Tab P12 64GB (Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-08-03 18:48:27+05:30'),
('42000000-0000-0000-0000-000000000190', 'ticket_history', '39000000-0000-0000-0000-000000000190', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-03-30 03:38:41+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000191', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-19 10:54:44+05:30'),
('42000000-0000-0000-0000-000000000192', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-04 18:22:22+05:30'),
('42000000-0000-0000-0000-000000000193', 'product', '33000000-0000-0000-0000-000000000193', 'GoPro Alpha ZV-E10 Body Only (Black)', 'GoPro Alpha ZV-E10 Body Only (Black) (TB-CAM-00403)
Category: Cameras

GoPro Alpha ZV-E10 Body Only (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2026-08-01 17:37:34+05:30'),
('42000000-0000-0000-0000-000000000194', 'ticket_history', '39000000-0000-0000-0000-000000000194', 'Where is my order TB-ORD-000830?', 'Ticket: Where is my order TB-ORD-000830?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-09-19 18:58:00+05:30'),
('42000000-0000-0000-0000-000000000195', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-13 01:26:09+05:30'),
('42000000-0000-0000-0000-000000000196', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-06-29 15:37:29+05:30'),
('42000000-0000-0000-0000-000000000197', 'product', '33000000-0000-0000-0000-000000000197', 'Keychron Keychron K2 Pro Mechanical (White)', 'Keychron Keychron K2 Pro Mechanical (White) (TB-KBM-00407)
Category: Keyboards & Mice

Keychron Keychron K2 Pro Mechanical (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-01-08 03:30:58+05:30'),
('42000000-0000-0000-0000-000000000198', 'ticket_history', '39000000-0000-0000-0000-000000000198', 'Need help with order TB-ORD-000140', 'Ticket: Need help with order TB-ORD-000140
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-06-26 22:57:46+05:30'),
('42000000-0000-0000-0000-000000000199', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-24 14:30:46+05:30'),
('42000000-0000-0000-0000-00000000019A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-01-14 16:05:34+05:30'),
('42000000-0000-0000-0000-00000000019B', 'product', '33000000-0000-0000-0000-00000000019B', 'Syska Tapo L510E Speaker (Silver)', 'Syska Tapo L510E Speaker (Silver) (TB-SMT-00411)
Category: Smart Home

Syska Tapo L510E Speaker (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-08-25 17:49:02+05:30'),
('42000000-0000-0000-0000-00000000019C', 'ticket_history', '39000000-0000-0000-0000-00000000019C', 'Need help', 'Ticket: Need help
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-01-15 13:32:33+05:30'),
('42000000-0000-0000-0000-00000000019D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-01-20 22:44:35+05:30'),
('42000000-0000-0000-0000-00000000019E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-10-26 04:52:53+05:30'),
('42000000-0000-0000-0000-00000000019F', 'product', '33000000-0000-0000-0000-00000000019F', 'Realme P1 Pro 128GB (Ocean Teal)', 'Realme P1 Pro 128GB (Ocean Teal) (TB-PHN-00415)
Category: Smartphones

Realme P1 Pro 128GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-07-27 14:07:18+05:30'),
('42000000-0000-0000-0000-0000000001A0', 'ticket_history', '39000000-0000-0000-0000-0000000001A0', 'Wrong item received for TB-ORD-000287', 'Ticket: Wrong item received for TB-ORD-000287
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-09-16 17:02:00+05:30'),
('42000000-0000-0000-0000-0000000001A1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-01 04:59:15+05:30'),
('42000000-0000-0000-0000-0000000001A2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-04-19 13:14:26+05:30'),
('42000000-0000-0000-0000-0000000001A3', 'product', '33000000-0000-0000-0000-0000000001A3', 'boAt boAt Wave Call 2 46mm (Midnight)', 'boAt boAt Wave Call 2 46mm (Midnight) (TB-WAT-00419)
Category: Smartwatches

boAt boAt Wave Call 2 46mm (Midnight) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-01-14 21:37:37+05:30'),
('42000000-0000-0000-0000-0000000001A4', 'ticket_history', '39000000-0000-0000-0000-0000000001A4', 'Received damaged Fire-Boltt Watch Ultra 2 GPS (Midnight)', 'Ticket: Received damaged Fire-Boltt Watch Ultra 2 GPS (Midnight)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-07-26 10:49:55+05:30'),
('42000000-0000-0000-0000-0000000001A5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-27 09:30:11+05:30'),
('42000000-0000-0000-0000-0000000001A6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-02 07:03:39+05:30'),
('42000000-0000-0000-0000-0000000001A7', 'product', '33000000-0000-0000-0000-0000000001A7', 'Sony Ultron X1 TWS Pair (Black)', 'Sony Ultron X1 TWS Pair (Black) (TB-SPK-00423)
Category: Speakers

Sony Ultron X1 TWS Pair (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-01-17 11:11:39+05:30'),
('42000000-0000-0000-0000-0000000001A8', 'ticket_history', '39000000-0000-0000-0000-0000000001A8', 'Refund not received for TB-ORD-000692', 'Ticket: Refund not received for TB-ORD-000692
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-11-09 07:03:03+05:30'),
('42000000-0000-0000-0000-0000000001A9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-26 03:57:11+05:30'),
('42000000-0000-0000-0000-0000000001AA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-13 12:31:14+05:30'),
('42000000-0000-0000-0000-0000000001AB', 'product', '33000000-0000-0000-0000-0000000001AB', 'Epson WorkCentre Laser (Grey)', 'Epson WorkCentre Laser (Grey) (TB-PRT-00427)
Category: Printers

Epson WorkCentre Laser (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-03-03 06:41:46+05:30'),
('42000000-0000-0000-0000-0000000001AC', 'ticket_history', '39000000-0000-0000-0000-0000000001AC', 'Refund not received for TB-ORD-000902', 'Ticket: Refund not received for TB-ORD-000902
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-03-16 23:25:14+05:30'),
('42000000-0000-0000-0000-0000000001AD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-01-08 05:48:34+05:30'),
('42000000-0000-0000-0000-0000000001AE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-01-14 22:52:56+05:30'),
('42000000-0000-0000-0000-0000000001AF', 'product', '33000000-0000-0000-0000-0000000001AF', 'Xiaomi Fitbit Charge 6 AMOLED (Pink)', 'Xiaomi Fitbit Charge 6 AMOLED (Pink) (TB-WRL-00431)
Category: Wearables

Xiaomi Fitbit Charge 6 AMOLED (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-11-16 03:26:59+05:30'),
('42000000-0000-0000-0000-0000000001B0', 'ticket_history', '39000000-0000-0000-0000-0000000001B0', 'Wrong item received for TB-ORD-000537', 'Ticket: Wrong item received for TB-ORD-000537
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-06-30 01:11:49+05:30'),
('42000000-0000-0000-0000-0000000001B1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-25 08:39:07+05:30'),
('42000000-0000-0000-0000-0000000001B2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-02-05 10:53:47+05:30'),
('42000000-0000-0000-0000-0000000001B3', 'product', '33000000-0000-0000-0000-0000000001B3', 'Xiaomi iPad Air 11 256GB (Space Grey)', 'Xiaomi iPad Air 11 256GB (Space Grey) (TB-TAB-00435)
Category: Tablets

Xiaomi iPad Air 11 256GB (Space Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-08-01 05:29:34+05:30'),
('42000000-0000-0000-0000-0000000001B4', 'ticket_history', '39000000-0000-0000-0000-0000000001B4', 'Need help', 'Ticket: Need help
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-01-08 07:09:04+05:30'),
('42000000-0000-0000-0000-0000000001B5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-30 03:48:01+05:30'),
('42000000-0000-0000-0000-0000000001B6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-08-01 03:22:47+05:30'),
('42000000-0000-0000-0000-0000000001B7', 'product', '33000000-0000-0000-0000-0000000001B7', 'Canon HERO13 Black Kit 50mm (Silver)', 'Canon HERO13 Black Kit 50mm (Silver) (TB-CAM-00439)
Category: Cameras

Canon HERO13 Black Kit 50mm (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-12-06 15:44:22+05:30'),
('42000000-0000-0000-0000-0000000001B8', 'ticket_history', '39000000-0000-0000-0000-0000000001B8', 'Received damaged Samsung Boost Charge Adapter (Blue)', 'Ticket: Received damaged Samsung Boost Charge Adapter (Blue)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-02-12 10:51:27+05:30'),
('42000000-0000-0000-0000-0000000001B9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-30 15:33:20+05:30'),
('42000000-0000-0000-0000-0000000001BA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-10-08 04:38:25+05:30'),
('42000000-0000-0000-0000-0000000001BB', 'product', '33000000-0000-0000-0000-0000000001BB', 'Razer K380 Ergonomic (White)', 'Razer K380 Ergonomic (White) (TB-KBM-00443)
Category: Keyboards & Mice

Razer K380 Ergonomic (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-11-14 16:53:55+05:30'),
('42000000-0000-0000-0000-0000000001BC', 'ticket_history', '39000000-0000-0000-0000-0000000001BC', 'Refund not received for TB-ORD-000530', 'Ticket: Refund not received for TB-ORD-000530
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-11-23 06:10:59+05:30'),
('42000000-0000-0000-0000-0000000001BD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-01 13:21:47+05:30'),
('42000000-0000-0000-0000-0000000001BE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-05 22:12:23+05:30'),
('42000000-0000-0000-0000-0000000001BF', 'product', '33000000-0000-0000-0000-0000000001BF', 'Philips Mi Smart Bulb Vacuum (Black)', 'Philips Mi Smart Bulb Vacuum (Black) (TB-SMT-00447)
Category: Smart Home

Philips Mi Smart Bulb Vacuum (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-08-20 05:07:19+05:30'),
('42000000-0000-0000-0000-0000000001C0', 'ticket_history', '39000000-0000-0000-0000-0000000001C0', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-03-06 15:08:43+05:30'),
('42000000-0000-0000-0000-0000000001C1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-11 14:00:12+05:30'),
('42000000-0000-0000-0000-0000000001C2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-24 01:58:30+05:30'),
('42000000-0000-0000-0000-0000000001C3', 'product', '33000000-0000-0000-0000-0000000001C3', 'Oppo Realme P1 Pro 256GB (Ocean Teal)', 'Oppo Realme P1 Pro 256GB (Ocean Teal) (TB-PHN-00451)
Category: Smartphones

Oppo Realme P1 Pro 256GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-07-08 02:31:38+05:30'),
('42000000-0000-0000-0000-0000000001C4', 'ticket_history', '39000000-0000-0000-0000-0000000001C4', 'Wrong item received for TB-ORD-000607', 'Ticket: Wrong item received for TB-ORD-000607
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-05-19 01:50:39+05:30'),
('42000000-0000-0000-0000-0000000001C5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-08 14:39:24+05:30'),
('42000000-0000-0000-0000-0000000001C6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-06-22 23:59:31+05:30'),
('42000000-0000-0000-0000-0000000001C7', 'product', '33000000-0000-0000-0000-0000000001C7', 'OnePlus Galaxy Watch7 46mm (Pebble)', 'OnePlus Galaxy Watch7 46mm (Pebble) (TB-WAT-00455)
Category: Smartwatches

OnePlus Galaxy Watch7 46mm (Pebble) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-07-21 10:47:55+05:30'),
('42000000-0000-0000-0000-0000000001C8', 'ticket_history', '39000000-0000-0000-0000-0000000001C8', 'Need help with order TB-ORD-000089', 'Ticket: Need help with order TB-ORD-000089
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-15 11:50:30+05:30'),
('42000000-0000-0000-0000-0000000001C9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-11-22 15:01:06+05:30'),
('42000000-0000-0000-0000-0000000001CA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-05-23 19:15:57+05:30'),
('42000000-0000-0000-0000-0000000001CB', 'product', '33000000-0000-0000-0000-0000000001CB', 'Ultron Stone 750 BT 5.3 (Red)', 'Ultron Stone 750 BT 5.3 (Red) (TB-SPK-00459)
Category: Speakers

Ultron Stone 750 BT 5.3 (Red) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-04-28 23:52:53+05:30'),
('42000000-0000-0000-0000-0000000001CC', 'ticket_history', '39000000-0000-0000-0000-0000000001CC', 'Need help with order TB-ORD-000172', 'Ticket: Need help with order TB-ORD-000172
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-09-29 04:03:29+05:30'),
('42000000-0000-0000-0000-0000000001CD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-01 03:59:07+05:30'),
('42000000-0000-0000-0000-0000000001CE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-09-28 15:22:10+05:30'),
('42000000-0000-0000-0000-0000000001CF', 'product', '33000000-0000-0000-0000-0000000001CF', 'Xerox WorkCentre Multi-Function (Black)', 'Xerox WorkCentre Multi-Function (Black) (TB-PRT-00463)
Category: Printers

Xerox WorkCentre Multi-Function (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-06-21 14:51:13+05:30'),
('42000000-0000-0000-0000-0000000001D0', 'ticket_history', '39000000-0000-0000-0000-0000000001D0', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-08-27 08:10:37+05:30'),
('42000000-0000-0000-0000-0000000001D1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-15 08:32:18+05:30'),
('42000000-0000-0000-0000-0000000001D2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-06-08 17:31:51+05:30'),
('42000000-0000-0000-0000-0000000001D3', 'product', '33000000-0000-0000-0000-0000000001D3', 'Fire-Boltt Fire-Boltt Smart GPS (Teal)', 'Fire-Boltt Fire-Boltt Smart GPS (Teal) (TB-WRL-00467)
Category: Wearables

Fire-Boltt Fire-Boltt Smart GPS (Teal) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-06-18 05:25:45+05:30'),
('42000000-0000-0000-0000-0000000001D4', 'ticket_history', '39000000-0000-0000-0000-0000000001D4', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-07-13 06:41:24+05:30'),
('42000000-0000-0000-0000-0000000001D5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-30 22:54:45+05:30'),
('42000000-0000-0000-0000-0000000001D6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-18 12:12:47+05:30'),
('42000000-0000-0000-0000-0000000001D7', 'product', '33000000-0000-0000-0000-0000000001D7', 'Samsung Redmi Pad Pro 256GB (Blue)', 'Samsung Redmi Pad Pro 256GB (Blue) (TB-TAB-00471)
Category: Tablets

Samsung Redmi Pad Pro 256GB (Blue) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-03-09 13:41:31+05:30'),
('42000000-0000-0000-0000-0000000001D8', 'ticket_history', '39000000-0000-0000-0000-0000000001D8', 'Need help', 'Ticket: Need help
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-07-22 03:39:27+05:30'),
('42000000-0000-0000-0000-0000000001D9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-30 22:27:47+05:30'),
('42000000-0000-0000-0000-0000000001DA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-04-26 13:03:32+05:30'),
('42000000-0000-0000-0000-0000000001DB', 'product', '33000000-0000-0000-0000-0000000001DB', 'GoPro X-T50 Kit 18-55 (Grey)', 'GoPro X-T50 Kit 18-55 (Grey) (TB-CAM-00475)
Category: Cameras

GoPro X-T50 Kit 18-55 (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-08-22 00:42:52+05:30'),
('42000000-0000-0000-0000-0000000001DC', 'ticket_history', '39000000-0000-0000-0000-0000000001DC', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-03-11 15:06:57+05:30'),
('42000000-0000-0000-0000-0000000001DD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-30 00:03:30+05:30'),
('42000000-0000-0000-0000-0000000001DE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-04-30 00:29:18+05:30'),
('42000000-0000-0000-0000-0000000001DF', 'product', '33000000-0000-0000-0000-0000000001DF', 'Corsair KM7120 Wireless (Carbon)', 'Corsair KM7120 Wireless (Carbon) (TB-KBM-00479)
Category: Keyboards & Mice

Corsair KM7120 Wireless (Carbon) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-07-05 12:28:56+05:30'),
('42000000-0000-0000-0000-0000000001E0', 'ticket_history', '39000000-0000-0000-0000-0000000001E0', 'Where is my order TB-ORD-000759?', 'Ticket: Where is my order TB-ORD-000759?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-05-29 02:51:28+05:30'),
('42000000-0000-0000-0000-0000000001E1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-19 12:51:05+05:30'),
('42000000-0000-0000-0000-0000000001E2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-06-05 07:19:44+05:30'),
('42000000-0000-0000-0000-0000000001E3', 'product', '33000000-0000-0000-0000-0000000001E3', 'Syska Bulb Camera (White)', 'Syska Bulb Camera (White) (TB-SMT-00483)
Category: Smart Home

Syska Bulb Camera (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-11-25 00:35:01+05:30'),
('42000000-0000-0000-0000-0000000001E4', 'ticket_history', '39000000-0000-0000-0000-0000000001E4', 'Refund not received for TB-ORD-000266', 'Ticket: Refund not received for TB-ORD-000266
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-01-28 14:55:53+05:30'),
('42000000-0000-0000-0000-0000000001E5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-27 19:59:26+05:30'),
('42000000-0000-0000-0000-0000000001E6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-11-09 06:03:28+05:30'),
('42000000-0000-0000-0000-0000000001E7', 'product', '33000000-0000-0000-0000-0000000001E7', 'Xiaomi Galaxy M35 128GB (Titanium Grey)', 'Xiaomi Galaxy M35 128GB (Titanium Grey) (TB-PHN-00487)
Category: Smartphones

Xiaomi Galaxy M35 128GB (Titanium Grey) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-01-13 18:45:54+05:30'),
('42000000-0000-0000-0000-0000000001E8', 'ticket_history', '39000000-0000-0000-0000-0000000001E8', 'Received damaged Dell P2723DE 34" Curved (White)', 'Ticket: Received damaged Dell P2723DE 34" Curved (White)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-06-08 15:21:09+05:30'),
('42000000-0000-0000-0000-0000000001E9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-05 00:11:27+05:30'),
('42000000-0000-0000-0000-0000000001EA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-05-21 13:13:40+05:30'),
('42000000-0000-0000-0000-0000000001EB', 'product', '33000000-0000-0000-0000-0000000001EB', 'Fire-Boltt Amazfit Active 44mm (Silver)', 'Fire-Boltt Amazfit Active 44mm (Silver) (TB-WAT-00491)
Category: Smartwatches

Fire-Boltt Amazfit Active 44mm (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-07-02 06:11:33+05:30'),
('42000000-0000-0000-0000-0000000001EC', 'ticket_history', '39000000-0000-0000-0000-0000000001EC', 'Wrong item received for TB-ORD-000272', 'Ticket: Wrong item received for TB-ORD-000272
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-03-27 13:51:26+05:30'),
('42000000-0000-0000-0000-0000000001ED', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-13 02:26:30+05:30'),
('42000000-0000-0000-0000-0000000001EE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-06-16 15:18:03+05:30'),
('42000000-0000-0000-0000-0000000001EF', 'product', '33000000-0000-0000-0000-0000000001EF', 'Ultron JBL Go 4 Wireless (Black)', 'Ultron JBL Go 4 Wireless (Black) (TB-SPK-00495)
Category: Speakers

Ultron JBL Go 4 Wireless (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-07-14 14:37:21+05:30'),
('42000000-0000-0000-0000-0000000001F0', 'ticket_history', '39000000-0000-0000-0000-0000000001F0', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-01-20 06:03:17+05:30'),
('42000000-0000-0000-0000-0000000001F1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-29 22:12:37+05:30'),
('42000000-0000-0000-0000-0000000001F2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-05-09 07:39:27+05:30'),
('42000000-0000-0000-0000-0000000001F3', 'product', '33000000-0000-0000-0000-0000000001F3', 'Xerox LaserJet M111a Auto Duplex (Grey)', 'Xerox LaserJet M111a Auto Duplex (Grey) (TB-PRT-00499)
Category: Printers

Xerox LaserJet M111a Auto Duplex (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-06-20 23:39:49+05:30'),
('42000000-0000-0000-0000-0000000001F4', 'ticket_history', '39000000-0000-0000-0000-0000000001F4', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-02-08 05:14:46+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-0000000001F5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-01-04 06:43:53+05:30'),
('42000000-0000-0000-0000-0000000001F6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-05-13 10:04:20+05:30'),
('42000000-0000-0000-0000-0000000001F7', 'product', '33000000-0000-0000-0000-0000000001F7', 'Xiaomi boAt Flex Heart Rate (Coral)', 'Xiaomi boAt Flex Heart Rate (Coral) (TB-WRL-00503)
Category: Wearables

Xiaomi boAt Flex Heart Rate (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-05-30 20:08:33+05:30'),
('42000000-0000-0000-0000-0000000001F8', 'ticket_history', '39000000-0000-0000-0000-0000000001F8', 'Received damaged Belkin Tempered Glass Screen Guard (Blue)', 'Ticket: Received damaged Belkin Tempered Glass Screen Guard (Blue)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-06-19 15:59:46+05:30'),
('42000000-0000-0000-0000-0000000001F9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-31 11:23:17+05:30'),
('42000000-0000-0000-0000-0000000001FA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-07-12 03:06:51+05:30'),
('42000000-0000-0000-0000-0000000001FB', 'product', '33000000-0000-0000-0000-0000000001FB', 'OnePlus iPad 10th Gen 256GB (Space Grey)', 'OnePlus iPad 10th Gen 256GB (Space Grey) (TB-TAB-00507)
Category: Tablets

OnePlus iPad 10th Gen 256GB (Space Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-06-18 16:11:25+05:30'),
('42000000-0000-0000-0000-0000000001FC', 'ticket_history', '39000000-0000-0000-0000-0000000001FC', 'Need help with order TB-ORD-000652', 'Ticket: Need help with order TB-ORD-000652
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-06-13 16:43:14+05:30'),
('42000000-0000-0000-0000-0000000001FD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-15 19:49:53+05:30'),
('42000000-0000-0000-0000-0000000001FE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-04-28 07:53:20+05:30'),
('42000000-0000-0000-0000-0000000001FF', 'product', '33000000-0000-0000-0000-0000000001FF', 'Nikon EOS 200D Kit 18-55 (Black)', 'Nikon EOS 200D Kit 18-55 (Black) (TB-CAM-00511)
Category: Cameras

Nikon EOS 200D Kit 18-55 (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-05-07 16:21:54+05:30'),
('42000000-0000-0000-0000-000000000200', 'ticket_history', '39000000-0000-0000-0000-000000000200', 'Where is my order TB-ORD-000920?', 'Ticket: Where is my order TB-ORD-000920?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-06-13 05:50:51+05:30'),
('42000000-0000-0000-0000-000000000201', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-15 04:23:08+05:30'),
('42000000-0000-0000-0000-000000000202', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-11-16 08:37:27+05:30'),
('42000000-0000-0000-0000-000000000203', 'product', '33000000-0000-0000-0000-000000000203', 'HP K380 Wireless (Grey)', 'HP K380 Wireless (Grey) (TB-KBM-00515)
Category: Keyboards & Mice

HP K380 Wireless (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-11-27 22:44:58+05:30'),
('42000000-0000-0000-0000-000000000204', 'ticket_history', '39000000-0000-0000-0000-000000000204', 'Need help with order TB-ORD-000761', 'Ticket: Need help with order TB-ORD-000761
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-03-27 10:33:10+05:30'),
('42000000-0000-0000-0000-000000000205', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-27 03:49:50+05:30'),
('42000000-0000-0000-0000-000000000206', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-04-14 23:37:49+05:30'),
('42000000-0000-0000-0000-000000000207', 'product', '33000000-0000-0000-0000-000000000207', 'TP-Link Syska Bulb Doorbell (Black)', 'TP-Link Syska Bulb Doorbell (Black) (TB-SMT-00519)
Category: Smart Home

TP-Link Syska Bulb Doorbell (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-07-23 18:01:40+05:30'),
('42000000-0000-0000-0000-000000000208', 'ticket_history', '39000000-0000-0000-0000-000000000208', 'Wrong item received for TB-ORD-000339', 'Ticket: Wrong item received for TB-ORD-000339
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-09-17 22:53:32+05:30'),
('42000000-0000-0000-0000-000000000209', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-18 01:29:42+05:30'),
('42000000-0000-0000-0000-00000000020A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-09-20 07:34:27+05:30'),
('42000000-0000-0000-0000-00000000020B', 'product', '33000000-0000-0000-0000-00000000020B', 'Samsung Moto Edge 50 64GB (Ocean Teal)', 'Samsung Moto Edge 50 64GB (Ocean Teal) (TB-PHN-00523)
Category: Smartphones

Samsung Moto Edge 50 64GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-02-22 01:12:17+05:30'),
('42000000-0000-0000-0000-00000000020C', 'ticket_history', '39000000-0000-0000-0000-00000000020C', 'Received damaged Samsung Galaxy S24 FE 256GB (Rose Gold)', 'Ticket: Received damaged Samsung Galaxy S24 FE 256GB (Rose Gold)
Category: defective
Status: escalated
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-03-13 01:58:38+05:30'),
('42000000-0000-0000-0000-00000000020D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-21 04:11:40+05:30'),
('42000000-0000-0000-0000-00000000020E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-07-24 18:19:27+05:30'),
('42000000-0000-0000-0000-00000000020F', 'product', '33000000-0000-0000-0000-00000000020F', 'OnePlus Amazfit Active AMOLED (Rose Gold)', 'OnePlus Amazfit Active AMOLED (Rose Gold) (TB-WAT-00527)
Category: Smartwatches

OnePlus Amazfit Active AMOLED (Rose Gold) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-06-25 23:16:09+05:30'),
('42000000-0000-0000-0000-000000000210', 'ticket_history', '39000000-0000-0000-0000-000000000210', 'Wrong item received for TB-ORD-000787', 'Ticket: Wrong item received for TB-ORD-000787
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-04-06 21:53:47+05:30'),
('42000000-0000-0000-0000-000000000211', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-02 07:02:50+05:30'),
('42000000-0000-0000-0000-000000000212', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-12-12 01:50:33+05:30'),
('42000000-0000-0000-0000-000000000213', 'product', '33000000-0000-0000-0000-000000000213', 'boAt Emberton II TWS Pair (Grey)', 'boAt Emberton II TWS Pair (Grey) (TB-SPK-00531)
Category: Speakers

boAt Emberton II TWS Pair (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-05-11 11:24:15+05:30'),
('42000000-0000-0000-0000-000000000214', 'ticket_history', '39000000-0000-0000-0000-000000000214', 'Wrong item received for TB-ORD-000189', 'Ticket: Wrong item received for TB-ORD-000189
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-02-05 03:03:11+05:30'),
('42000000-0000-0000-0000-000000000215', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-04 13:52:48+05:30'),
('42000000-0000-0000-0000-000000000216', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-03-10 00:13:48+05:30'),
('42000000-0000-0000-0000-000000000217', 'product', '33000000-0000-0000-0000-000000000217', 'Canon WorkCentre Tank (Grey)', 'Canon WorkCentre Tank (Grey) (TB-PRT-00535)
Category: Printers

Canon WorkCentre Tank (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-06-20 22:17:11+05:30'),
('42000000-0000-0000-0000-000000000218', 'ticket_history', '39000000-0000-0000-0000-000000000218', 'Received damaged Netgear Nighthawk Dual Band (White)', 'Ticket: Received damaged Netgear Nighthawk Dual Band (White)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-04-28 14:40:07+05:30'),
('42000000-0000-0000-0000-000000000219', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-19 00:22:35+05:30'),
('42000000-0000-0000-0000-00000000021A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-08-18 04:10:20+05:30'),
('42000000-0000-0000-0000-00000000021B', 'product', '33000000-0000-0000-0000-00000000021B', 'OnePlus Fitbit Charge 6 GPS (Black)', 'OnePlus Fitbit Charge 6 GPS (Black) (TB-WRL-00539)
Category: Wearables

OnePlus Fitbit Charge 6 GPS (Black) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-10-22 22:40:14+05:30'),
('42000000-0000-0000-0000-00000000021C', 'ticket_history', '39000000-0000-0000-0000-00000000021C', 'Wrong item received for TB-ORD-000117', 'Ticket: Wrong item received for TB-ORD-000117
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-12-06 12:20:54+05:30'),
('42000000-0000-0000-0000-00000000021D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-12-10 08:10:23+05:30'),
('42000000-0000-0000-0000-00000000021E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-09-29 00:52:42+05:30'),
('42000000-0000-0000-0000-00000000021F', 'product', '33000000-0000-0000-0000-00000000021F', 'Xiaomi iPad Pro 13 256GB (Silver)', 'Xiaomi iPad Pro 13 256GB (Silver) (TB-TAB-00543)
Category: Tablets

Xiaomi iPad Pro 13 256GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-07-31 13:23:10+05:30'),
('42000000-0000-0000-0000-000000000220', 'ticket_history', '39000000-0000-0000-0000-000000000220', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-09-11 21:26:02+05:30'),
('42000000-0000-0000-0000-000000000221', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-07 23:59:16+05:30'),
('42000000-0000-0000-0000-000000000222', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-04 17:39:37+05:30'),
('42000000-0000-0000-0000-000000000223', 'product', '33000000-0000-0000-0000-000000000223', 'Nikon X-T50 Kit 50mm (Grey)', 'Nikon X-T50 Kit 50mm (Grey) (TB-CAM-00547)
Category: Cameras

Nikon X-T50 Kit 50mm (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2026-02-05 03:39:03+05:30'),
('42000000-0000-0000-0000-000000000224', 'ticket_history', '39000000-0000-0000-0000-000000000224', 'Refund not received for TB-ORD-000758', 'Ticket: Refund not received for TB-ORD-000758
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-02-11 22:21:30+05:30'),
('42000000-0000-0000-0000-000000000225', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-31 19:31:23+05:30'),
('42000000-0000-0000-0000-000000000226', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-17 22:44:41+05:30'),
('42000000-0000-0000-0000-000000000227', 'product', '33000000-0000-0000-0000-000000000227', 'Logitech Keychron K2 Pro Multimedia (Black)', 'Logitech Keychron K2 Pro Multimedia (Black) (TB-KBM-00551)
Category: Keyboards & Mice

Logitech Keychron K2 Pro Multimedia (Black) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-05-03 19:12:46+05:30'),
('42000000-0000-0000-0000-000000000228', 'ticket_history', '39000000-0000-0000-0000-000000000228', 'Received damaged Ultron JBL Go 4 Wireless (Black)', 'Ticket: Received damaged Ultron JBL Go 4 Wireless (Black)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-11-03 08:03:46+05:30'),
('42000000-0000-0000-0000-000000000229', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-14 13:14:57+05:30'),
('42000000-0000-0000-0000-00000000022A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-10 20:17:58+05:30'),
('42000000-0000-0000-0000-00000000022B', 'product', '33000000-0000-0000-0000-00000000022B', 'Amazon Honeywell Thermostat Camera (White)', 'Amazon Honeywell Thermostat Camera (White) (TB-SMT-00555)
Category: Smart Home

Amazon Honeywell Thermostat Camera (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-12-10 23:19:08+05:30'),
('42000000-0000-0000-0000-00000000022C', 'ticket_history', '39000000-0000-0000-0000-00000000022C', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-01-06 05:17:13+05:30'),
('42000000-0000-0000-0000-00000000022D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-08 19:36:56+05:30'),
('42000000-0000-0000-0000-00000000022E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-10-09 04:00:44+05:30'),
('42000000-0000-0000-0000-00000000022F', 'product', '33000000-0000-0000-0000-00000000022F', 'Vivo Redmi Note 14 Pro 256GB (Black)', 'Vivo Redmi Note 14 Pro 256GB (Black) (TB-PHN-00559)
Category: Smartphones

Vivo Redmi Note 14 Pro 256GB (Black) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-10-14 20:59:26+05:30'),
('42000000-0000-0000-0000-000000000230', 'ticket_history', '39000000-0000-0000-0000-000000000230', 'Refund not received for TB-ORD-000655', 'Ticket: Refund not received for TB-ORD-000655
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-01-03 00:02:52+05:30'),
('42000000-0000-0000-0000-000000000231', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-02 20:39:20+05:30'),
('42000000-0000-0000-0000-000000000232', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-04-07 04:17:20+05:30'),
('42000000-0000-0000-0000-000000000233', 'product', '33000000-0000-0000-0000-000000000233', 'Samsung Redmi Watch 5 44mm (Pebble)', 'Samsung Redmi Watch 5 44mm (Pebble) (TB-WAT-00563)
Category: Smartwatches

Samsung Redmi Watch 5 44mm (Pebble) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-05-08 02:11:25+05:30'),
('42000000-0000-0000-0000-000000000234', 'ticket_history', '39000000-0000-0000-0000-000000000234', 'Wrong item received for TB-ORD-000649', 'Ticket: Wrong item received for TB-ORD-000649
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-10-25 02:24:11+05:30'),
('42000000-0000-0000-0000-000000000235', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-31 05:35:52+05:30'),
('42000000-0000-0000-0000-000000000236', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-08 19:47:48+05:30'),
('42000000-0000-0000-0000-000000000237', 'product', '33000000-0000-0000-0000-000000000237', 'Bose Charge 6 TWS Pair (Grey)', 'Bose Charge 6 TWS Pair (Grey) (TB-SPK-00567)
Category: Speakers

Bose Charge 6 TWS Pair (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-03-19 12:24:27+05:30'),
('42000000-0000-0000-0000-000000000238', 'ticket_history', '39000000-0000-0000-0000-000000000238', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-06-13 23:01:50+05:30'),
('42000000-0000-0000-0000-000000000239', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-20 22:38:56+05:30'),
('42000000-0000-0000-0000-00000000023A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-09-29 13:30:53+05:30'),
('42000000-0000-0000-0000-00000000023B', 'product', '33000000-0000-0000-0000-00000000023B', 'Canon EcoTank L3250 Multi-Function (White)', 'Canon EcoTank L3250 Multi-Function (White) (TB-PRT-00571)
Category: Printers

Canon EcoTank L3250 Multi-Function (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-04-10 05:06:00+05:30'),
('42000000-0000-0000-0000-00000000023C', 'ticket_history', '39000000-0000-0000-0000-00000000023C', 'Received damaged Honeywell Syska Bulb Speaker (Silver)', 'Ticket: Received damaged Honeywell Syska Bulb Speaker (Silver)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-05-16 05:41:14+05:30'),
('42000000-0000-0000-0000-00000000023D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-20 09:15:04+05:30'),
('42000000-0000-0000-0000-00000000023E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-02-05 02:19:16+05:30'),
('42000000-0000-0000-0000-00000000023F', 'product', '33000000-0000-0000-0000-00000000023F', 'boAt Fire-Boltt Smart Fitness Band (Blue)', 'boAt Fire-Boltt Smart Fitness Band (Blue) (TB-WRL-00575)
Category: Wearables

boAt Fire-Boltt Smart Fitness Band (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-10-06 08:02:54+05:30'),
('42000000-0000-0000-0000-000000000240', 'ticket_history', '39000000-0000-0000-0000-000000000240', 'Wrong item received for TB-ORD-000274', 'Ticket: Wrong item received for TB-ORD-000274
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-06-12 05:24:25+05:30'),
('42000000-0000-0000-0000-000000000241', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-26 05:51:01+05:30'),
('42000000-0000-0000-0000-000000000242', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-10-29 18:02:01+05:30'),
('42000000-0000-0000-0000-000000000243', 'product', '33000000-0000-0000-0000-000000000243', 'Apple iPad Air 11 64GB (Sage)', 'Apple iPad Air 11 64GB (Sage) (TB-TAB-00579)
Category: Tablets

Apple iPad Air 11 64GB (Sage) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-09-03 06:47:25+05:30'),
('42000000-0000-0000-0000-000000000244', 'ticket_history', '39000000-0000-0000-0000-000000000244', 'Where is my order TB-ORD-000439?', 'Ticket: Where is my order TB-ORD-000439?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-08-17 19:55:58+05:30'),
('42000000-0000-0000-0000-000000000245', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-08-03 22:18:38+05:30'),
('42000000-0000-0000-0000-000000000246', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-12-27 01:12:35+05:30'),
('42000000-0000-0000-0000-000000000247', 'product', '33000000-0000-0000-0000-000000000247', 'GoPro Alpha ZV-E10 Waterproof (Black)', 'GoPro Alpha ZV-E10 Waterproof (Black) (TB-CAM-00583)
Category: Cameras

GoPro Alpha ZV-E10 Waterproof (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-06-02 09:08:42+05:30'),
('42000000-0000-0000-0000-000000000248', 'ticket_history', '39000000-0000-0000-0000-000000000248', 'Refund not received for TB-ORD-000172', 'Ticket: Refund not received for TB-ORD-000172
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-07-08 06:26:39+05:30'),
('42000000-0000-0000-0000-000000000249', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-02 14:31:42+05:30'),
('42000000-0000-0000-0000-00000000024A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-10-24 04:42:38+05:30'),
('42000000-0000-0000-0000-00000000024B', 'product', '33000000-0000-0000-0000-00000000024B', 'HP K380 Mechanical (Carbon)', 'HP K380 Mechanical (Carbon) (TB-KBM-00587)
Category: Keyboards & Mice

HP K380 Mechanical (Carbon) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-08-05 15:43:23+05:30'),
('42000000-0000-0000-0000-00000000024C', 'ticket_history', '39000000-0000-0000-0000-00000000024C', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-02-15 09:08:02+05:30'),
('42000000-0000-0000-0000-00000000024D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-11 00:59:52+05:30'),
('42000000-0000-0000-0000-00000000024E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-07-10 10:23:10+05:30'),
('42000000-0000-0000-0000-00000000024F', 'product', '33000000-0000-0000-0000-00000000024F', 'Google Honeywell Thermostat Vacuum (Silver)', 'Google Honeywell Thermostat Vacuum (Silver) (TB-SMT-00591)
Category: Smart Home

Google Honeywell Thermostat Vacuum (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-06-11 09:40:24+05:30'),
('42000000-0000-0000-0000-000000000250', 'ticket_history', '39000000-0000-0000-0000-000000000250', 'Need help with order TB-ORD-000475', 'Ticket: Need help with order TB-ORD-000475
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-03-03 15:26:04+05:30'),
('42000000-0000-0000-0000-000000000251', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-09 04:19:19+05:30'),
('42000000-0000-0000-0000-000000000252', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-04-22 00:03:18+05:30'),
('42000000-0000-0000-0000-000000000253', 'product', '33000000-0000-0000-0000-000000000253', 'OnePlus Realme P1 Pro 64GB (Silver)', 'OnePlus Realme P1 Pro 64GB (Silver) (TB-PHN-00595)
Category: Smartphones

OnePlus Realme P1 Pro 64GB (Silver) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-07-17 15:08:24+05:30'),
('42000000-0000-0000-0000-000000000254', 'ticket_history', '39000000-0000-0000-0000-000000000254', 'Need help', 'Ticket: Need help
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-20 18:44:44+05:30'),
('42000000-0000-0000-0000-000000000255', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-11-18 11:16:27+05:30'),
('42000000-0000-0000-0000-000000000256', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-08-07 23:05:10+05:30'),
('42000000-0000-0000-0000-000000000257', 'product', '33000000-0000-0000-0000-000000000257', 'Fire-Boltt Galaxy Watch7 Bluetooth Calling (Rose Gold)', 'Fire-Boltt Galaxy Watch7 Bluetooth Calling (Rose Gold) (TB-WAT-00599)
Category: Smartwatches

Fire-Boltt Galaxy Watch7 Bluetooth Calling (Rose Gold) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-08-21 13:19:16+05:30'),
('42000000-0000-0000-0000-000000000258', 'ticket_history', '39000000-0000-0000-0000-000000000258', 'Refund not received for TB-ORD-000754', 'Ticket: Refund not received for TB-ORD-000754
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-11-29 01:03:38+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000259', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-07 09:42:25+05:30'),
('42000000-0000-0000-0000-00000000025A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-05-24 14:57:27+05:30'),
('42000000-0000-0000-0000-00000000025B', 'product', '33000000-0000-0000-0000-00000000025B', 'JBL Charge 6 Party Light (Grey)', 'JBL Charge 6 Party Light (Grey) (TB-SPK-00603)
Category: Speakers

JBL Charge 6 Party Light (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-11-11 18:50:42+05:30'),
('42000000-0000-0000-0000-00000000025C', 'ticket_history', '39000000-0000-0000-0000-00000000025C', 'Need help with order TB-ORD-000681', 'Ticket: Need help with order TB-ORD-000681
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-10-10 16:59:13+05:30'),
('42000000-0000-0000-0000-00000000025D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-15 10:40:17+05:30'),
('42000000-0000-0000-0000-00000000025E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-08-22 20:53:45+05:30'),
('42000000-0000-0000-0000-00000000025F', 'product', '33000000-0000-0000-0000-00000000025F', 'HP EcoTank L3250 Multi-Function (Black)', 'HP EcoTank L3250 Multi-Function (Black) (TB-PRT-00607)
Category: Printers

HP EcoTank L3250 Multi-Function (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-10-05 06:41:15+05:30'),
('42000000-0000-0000-0000-000000000260', 'ticket_history', '39000000-0000-0000-0000-000000000260', 'Refund not received for TB-ORD-000910', 'Ticket: Refund not received for TB-ORD-000910
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-05-25 05:01:43+05:30'),
('42000000-0000-0000-0000-000000000261', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-16 03:55:50+05:30'),
('42000000-0000-0000-0000-000000000262', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-05-27 18:26:00+05:30'),
('42000000-0000-0000-0000-000000000263', 'product', '33000000-0000-0000-0000-000000000263', 'Fire-Boltt boAt Flex GPS (Blue)', 'Fire-Boltt boAt Flex GPS (Blue) (TB-WRL-00611)
Category: Wearables

Fire-Boltt boAt Flex GPS (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-06-03 09:15:50+05:30'),
('42000000-0000-0000-0000-000000000264', 'ticket_history', '39000000-0000-0000-0000-000000000264', 'Where is my order TB-ORD-000441?', 'Ticket: Where is my order TB-ORD-000441?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-04-23 03:18:22+05:30'),
('42000000-0000-0000-0000-000000000265', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-21 10:47:50+05:30'),
('42000000-0000-0000-0000-000000000266', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-09-08 16:52:46+05:30'),
('42000000-0000-0000-0000-000000000267', 'product', '33000000-0000-0000-0000-000000000267', 'Xiaomi Realme Pad Mini 256GB (Space Grey)', 'Xiaomi Realme Pad Mini 256GB (Space Grey) (TB-TAB-00615)
Category: Tablets

Xiaomi Realme Pad Mini 256GB (Space Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-04-22 17:44:54+05:30'),
('42000000-0000-0000-0000-000000000268', 'ticket_history', '39000000-0000-0000-0000-000000000268', 'Where is my order TB-ORD-000625?', 'Ticket: Where is my order TB-ORD-000625?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-05-15 18:19:54+05:30'),
('42000000-0000-0000-0000-000000000269', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-03-02 06:33:53+05:30'),
('42000000-0000-0000-0000-00000000026A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-05-27 06:19:53+05:30'),
('42000000-0000-0000-0000-00000000026B', 'product', '33000000-0000-0000-0000-00000000026B', 'Panasonic EOS R50 Waterproof (Silver)', 'Panasonic EOS R50 Waterproof (Silver) (TB-CAM-00619)
Category: Cameras

Panasonic EOS R50 Waterproof (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-05-09 15:06:53+05:30'),
('42000000-0000-0000-0000-00000000026C', 'ticket_history', '39000000-0000-0000-0000-00000000026C', 'Received damaged Fire-Boltt Noise Halo SpO2 (Pink)', 'Ticket: Received damaged Fire-Boltt Noise Halo SpO2 (Pink)
Category: defective
Status: escalated
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-04-29 11:00:38+05:30'),
('42000000-0000-0000-0000-00000000026D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-04-12 04:23:54+05:30'),
('42000000-0000-0000-0000-00000000026E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-08-06 20:01:14+05:30'),
('42000000-0000-0000-0000-00000000026F', 'product', '33000000-0000-0000-0000-00000000026F', 'Logitech KM7120 Mechanical (Grey)', 'Logitech KM7120 Mechanical (Grey) (TB-KBM-00623)
Category: Keyboards & Mice

Logitech KM7120 Mechanical (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-06-23 13:10:04+05:30'),
('42000000-0000-0000-0000-000000000270', 'ticket_history', '39000000-0000-0000-0000-000000000270', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-07-26 06:35:11+05:30'),
('42000000-0000-0000-0000-000000000271', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-05 03:33:01+05:30'),
('42000000-0000-0000-0000-000000000272', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-03-08 16:20:42+05:30'),
('42000000-0000-0000-0000-000000000273', 'product', '33000000-0000-0000-0000-000000000273', 'Xiaomi Nest Mini Bulb (Black)', 'Xiaomi Nest Mini Bulb (Black) (TB-SMT-00627)
Category: Smart Home

Xiaomi Nest Mini Bulb (Black) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-02-05 02:43:02+05:30'),
('42000000-0000-0000-0000-000000000274', 'ticket_history', '39000000-0000-0000-0000-000000000274', 'Where is my order TB-ORD-000204?', 'Ticket: Where is my order TB-ORD-000204?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-04-09 05:03:38+05:30'),
('42000000-0000-0000-0000-000000000275', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-14 09:53:55+05:30'),
('42000000-0000-0000-0000-000000000276', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-12-24 23:20:21+05:30'),
('42000000-0000-0000-0000-000000000277', 'product', '33000000-0000-0000-0000-000000000277', 'Nothing iPhone 15 512GB (Silver)', 'Nothing iPhone 15 512GB (Silver) (TB-PHN-00631)
Category: Smartphones

Nothing iPhone 15 512GB (Silver) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-11-06 07:42:00+05:30'),
('42000000-0000-0000-0000-000000000278', 'ticket_history', '39000000-0000-0000-0000-000000000278', 'Refund not received for TB-ORD-000737', 'Ticket: Refund not received for TB-ORD-000737
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-09-19 13:39:21+05:30'),
('42000000-0000-0000-0000-000000000279', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-10 05:57:58+05:30'),
('42000000-0000-0000-0000-00000000027A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-15 05:37:50+05:30'),
('42000000-0000-0000-0000-00000000027B', 'product', '33000000-0000-0000-0000-00000000027B', 'Xiaomi Watch Ultra 2 46mm (Rose Gold)', 'Xiaomi Watch Ultra 2 46mm (Rose Gold) (TB-WAT-00635)
Category: Smartwatches

Xiaomi Watch Ultra 2 46mm (Rose Gold) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-12-12 08:56:27+05:30'),
('42000000-0000-0000-0000-00000000027C', 'ticket_history', '39000000-0000-0000-0000-00000000027C', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-10-30 14:29:05+05:30'),
('42000000-0000-0000-0000-00000000027D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-23 00:44:26+05:30'),
('42000000-0000-0000-0000-00000000027E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-12-18 08:04:29+05:30'),
('42000000-0000-0000-0000-00000000027F', 'product', '33000000-0000-0000-0000-00000000027F', 'Bose Philips SBA TWS Pair (Black)', 'Bose Philips SBA TWS Pair (Black) (TB-SPK-00639)
Category: Speakers

Bose Philips SBA TWS Pair (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-01-02 17:59:56+05:30'),
('42000000-0000-0000-0000-000000000280', 'ticket_history', '39000000-0000-0000-0000-000000000280', 'Received damaged Seagate Blue SN5000 256GB (Red)', 'Ticket: Received damaged Seagate Blue SN5000 256GB (Red)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-10-12 07:21:46+05:30'),
('42000000-0000-0000-0000-000000000281', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-01 01:35:39+05:30'),
('42000000-0000-0000-0000-000000000282', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-09-23 00:14:23+05:30'),
('42000000-0000-0000-0000-000000000283', 'product', '33000000-0000-0000-0000-000000000283', 'HP LaserJet M111a Inkjet (White)', 'HP LaserJet M111a Inkjet (White) (TB-PRT-00643)
Category: Printers

HP LaserJet M111a Inkjet (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-03-19 22:26:26+05:30'),
('42000000-0000-0000-0000-000000000284', 'ticket_history', '39000000-0000-0000-0000-000000000284', 'Received damaged D-Link Archer C80 Gigabit (Black)', 'Ticket: Received damaged D-Link Archer C80 Gigabit (Black)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-08-23 15:22:08+05:30'),
('42000000-0000-0000-0000-000000000285', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-13 14:00:07+05:30'),
('42000000-0000-0000-0000-000000000286', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-07-07 13:52:41+05:30'),
('42000000-0000-0000-0000-000000000287', 'product', '33000000-0000-0000-0000-000000000287', 'Fire-Boltt Mi Band 9 5ATM (Blue)', 'Fire-Boltt Mi Band 9 5ATM (Blue) (TB-WRL-00647)
Category: Wearables

Fire-Boltt Mi Band 9 5ATM (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-05-14 22:44:01+05:30'),
('42000000-0000-0000-0000-000000000288', 'ticket_history', '39000000-0000-0000-0000-000000000288', 'Where is my order TB-ORD-000245?', 'Ticket: Where is my order TB-ORD-000245?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-04-20 01:17:55+05:30'),
('42000000-0000-0000-0000-000000000289', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-06-24 01:22:38+05:30'),
('42000000-0000-0000-0000-00000000028A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-03-29 19:51:49+05:30'),
('42000000-0000-0000-0000-00000000028B', 'product', '33000000-0000-0000-0000-00000000028B', 'Apple Realme Pad Mini 256GB (Green)', 'Apple Realme Pad Mini 256GB (Green) (TB-TAB-00651)
Category: Tablets

Apple Realme Pad Mini 256GB (Green) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-06-07 01:46:31+05:30'),
('42000000-0000-0000-0000-00000000028C', 'ticket_history', '39000000-0000-0000-0000-00000000028C', 'Need help with order TB-ORD-000651', 'Ticket: Need help with order TB-ORD-000651
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-15 00:09:37+05:30'),
('42000000-0000-0000-0000-00000000028D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-06-05 16:55:17+05:30'),
('42000000-0000-0000-0000-00000000028E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-11-05 09:12:14+05:30'),
('42000000-0000-0000-0000-00000000028F', 'product', '33000000-0000-0000-0000-00000000028F', 'Panasonic Lumix G9 4K (Silver)', 'Panasonic Lumix G9 4K (Silver) (TB-CAM-00655)
Category: Cameras

Panasonic Lumix G9 4K (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-11-06 23:24:03+05:30'),
('42000000-0000-0000-0000-000000000290', 'ticket_history', '39000000-0000-0000-0000-000000000290', 'Refund not received for TB-ORD-000516', 'Ticket: Refund not received for TB-ORD-000516
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-03-29 19:43:35+05:30'),
('42000000-0000-0000-0000-000000000291', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-06 16:52:41+05:30'),
('42000000-0000-0000-0000-000000000292', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-12 04:02:04+05:30'),
('42000000-0000-0000-0000-000000000293', 'product', '33000000-0000-0000-0000-000000000293', 'Zebronics BlackWidow V4 Mechanical (Carbon)', 'Zebronics BlackWidow V4 Mechanical (Carbon) (TB-KBM-00659)
Category: Keyboards & Mice

Zebronics BlackWidow V4 Mechanical (Carbon) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-07-19 11:09:03+05:30'),
('42000000-0000-0000-0000-000000000294', 'ticket_history', '39000000-0000-0000-0000-000000000294', 'Where is my order TB-ORD-000472?', 'Ticket: Where is my order TB-ORD-000472?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-10-09 22:38:47+05:30'),
('42000000-0000-0000-0000-000000000295', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-05 16:29:05+05:30'),
('42000000-0000-0000-0000-000000000296', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-05-25 02:19:00+05:30'),
('42000000-0000-0000-0000-000000000297', 'product', '33000000-0000-0000-0000-000000000297', 'Xiaomi Honeywell Thermostat Plug (White)', 'Xiaomi Honeywell Thermostat Plug (White) (TB-SMT-00663)
Category: Smart Home

Xiaomi Honeywell Thermostat Plug (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-08-26 22:20:30+05:30'),
('42000000-0000-0000-0000-000000000298', 'ticket_history', '39000000-0000-0000-0000-000000000298', 'Wrong item received for TB-ORD-000063', 'Ticket: Wrong item received for TB-ORD-000063
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-01-13 00:58:26+05:30'),
('42000000-0000-0000-0000-000000000299', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-17 15:51:03+05:30'),
('42000000-0000-0000-0000-00000000029A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-01-25 02:04:12+05:30'),
('42000000-0000-0000-0000-00000000029B', 'product', '33000000-0000-0000-0000-00000000029B', 'OnePlus iPhone 16 64GB (Rose Gold)', 'OnePlus iPhone 16 64GB (Rose Gold) (TB-PHN-00667)
Category: Smartphones

OnePlus iPhone 16 64GB (Rose Gold) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-12-30 18:55:13+05:30'),
('42000000-0000-0000-0000-00000000029C', 'ticket_history', '39000000-0000-0000-0000-00000000029C', 'Refund not received for TB-ORD-000040', 'Ticket: Refund not received for TB-ORD-000040
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-01-08 01:21:36+05:30'),
('42000000-0000-0000-0000-00000000029D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-16 07:01:52+05:30'),
('42000000-0000-0000-0000-00000000029E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-15 21:49:14+05:30'),
('42000000-0000-0000-0000-00000000029F', 'product', '33000000-0000-0000-0000-00000000029F', 'OnePlus Watch Series 10 AMOLED (Black)', 'OnePlus Watch Series 10 AMOLED (Black) (TB-WAT-00671)
Category: Smartwatches

OnePlus Watch Series 10 AMOLED (Black) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-03-26 22:11:18+05:30'),
('42000000-0000-0000-0000-0000000002A0', 'ticket_history', '39000000-0000-0000-0000-0000000002A0', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-04-18 11:47:00+05:30'),
('42000000-0000-0000-0000-0000000002A1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-04 16:30:22+05:30'),
('42000000-0000-0000-0000-0000000002A2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-27 13:08:34+05:30'),
('42000000-0000-0000-0000-0000000002A3', 'product', '33000000-0000-0000-0000-0000000002A3', 'ZEBRONICS Ultron X1 IPX7 (Red)', 'ZEBRONICS Ultron X1 IPX7 (Red) (TB-SPK-00675)
Category: Speakers

ZEBRONICS Ultron X1 IPX7 (Red) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-01-13 01:55:32+05:30'),
('42000000-0000-0000-0000-0000000002A4', 'ticket_history', '39000000-0000-0000-0000-0000000002A4', 'Refund not received for TB-ORD-000754', 'Ticket: Refund not received for TB-ORD-000754
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-08-04 15:12:55+05:30'),
('42000000-0000-0000-0000-0000000002A5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-30 15:57:26+05:30'),
('42000000-0000-0000-0000-0000000002A6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-02-17 18:51:51+05:30'),
('42000000-0000-0000-0000-0000000002A7', 'product', '33000000-0000-0000-0000-0000000002A7', 'HP DCP-T220 Multi-Function (Black)', 'HP DCP-T220 Multi-Function (Black) (TB-PRT-00679)
Category: Printers

HP DCP-T220 Multi-Function (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-02-18 02:58:01+05:30'),
('42000000-0000-0000-0000-0000000002A8', 'ticket_history', '39000000-0000-0000-0000-0000000002A8', 'Need help with order TB-ORD-000245', 'Ticket: Need help with order TB-ORD-000245
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-09-05 21:23:52+05:30'),
('42000000-0000-0000-0000-0000000002A9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-21 21:12:25+05:30'),
('42000000-0000-0000-0000-0000000002AA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-02-27 05:42:05+05:30'),
('42000000-0000-0000-0000-0000000002AB', 'product', '33000000-0000-0000-0000-0000000002AB', 'Xiaomi Fire-Boltt Smart Fitness Band (Blue)', 'Xiaomi Fire-Boltt Smart Fitness Band (Blue) (TB-WRL-00683)
Category: Wearables

Xiaomi Fire-Boltt Smart Fitness Band (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-09-14 06:53:14+05:30'),
('42000000-0000-0000-0000-0000000002AC', 'ticket_history', '39000000-0000-0000-0000-0000000002AC', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-01-22 05:14:39+05:30'),
('42000000-0000-0000-0000-0000000002AD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-08 12:44:03+05:30'),
('42000000-0000-0000-0000-0000000002AE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-04-06 09:41:04+05:30'),
('42000000-0000-0000-0000-0000000002AF', 'product', '33000000-0000-0000-0000-0000000002AF', 'OnePlus Redmi Pad Pro 256GB (Sage)', 'OnePlus Redmi Pad Pro 256GB (Sage) (TB-TAB-00687)
Category: Tablets

OnePlus Redmi Pad Pro 256GB (Sage) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-04-26 11:20:55+05:30'),
('42000000-0000-0000-0000-0000000002B0', 'ticket_history', '39000000-0000-0000-0000-0000000002B0', 'Where is my order TB-ORD-000646?', 'Ticket: Where is my order TB-ORD-000646?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-10-25 00:40:53+05:30'),
('42000000-0000-0000-0000-0000000002B1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-04 10:40:23+05:30'),
('42000000-0000-0000-0000-0000000002B2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-07 19:23:02+05:30'),
('42000000-0000-0000-0000-0000000002B3', 'product', '33000000-0000-0000-0000-0000000002B3', 'GoPro X-T50 4K (Grey)', 'GoPro X-T50 4K (Grey) (TB-CAM-00691)
Category: Cameras

GoPro X-T50 4K (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-09-24 21:59:31+05:30'),
('42000000-0000-0000-0000-0000000002B4', 'ticket_history', '39000000-0000-0000-0000-0000000002B4', 'Need help with order TB-ORD-000527', 'Ticket: Need help with order TB-ORD-000527
Category: other
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-06-06 17:11:59+05:30'),
('42000000-0000-0000-0000-0000000002B5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-12 10:59:45+05:30'),
('42000000-0000-0000-0000-0000000002B6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-10-06 06:09:46+05:30'),
('42000000-0000-0000-0000-0000000002B7', 'product', '33000000-0000-0000-0000-0000000002B7', 'Corsair Zeb Max Pro RGB (Blue)', 'Corsair Zeb Max Pro RGB (Blue) (TB-KBM-00695)
Category: Keyboards & Mice

Corsair Zeb Max Pro RGB (Blue) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-09-22 03:38:04+05:30'),
('42000000-0000-0000-0000-0000000002B8', 'ticket_history', '39000000-0000-0000-0000-0000000002B8', 'Where is my order TB-ORD-000889?', 'Ticket: Where is my order TB-ORD-000889?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-07-12 03:22:16+05:30'),
('42000000-0000-0000-0000-0000000002B9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-03 22:13:35+05:30'),
('42000000-0000-0000-0000-0000000002BA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-04-11 02:05:54+05:30'),
('42000000-0000-0000-0000-0000000002BB', 'product', '33000000-0000-0000-0000-0000000002BB', 'TP-Link Honeywell Thermostat Plug (White)', 'TP-Link Honeywell Thermostat Plug (White) (TB-SMT-00699)
Category: Smart Home

TP-Link Honeywell Thermostat Plug (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-01-27 21:44:12+05:30'),
('42000000-0000-0000-0000-0000000002BC', 'ticket_history', '39000000-0000-0000-0000-0000000002BC', 'Need help with order TB-ORD-000699', 'Ticket: Need help with order TB-ORD-000699
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-04-28 01:14:51+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-0000000002BD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-04-09 18:24:34+05:30'),
('42000000-0000-0000-0000-0000000002BE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-06-28 00:55:02+05:30'),
('42000000-0000-0000-0000-0000000002BF', 'product', '33000000-0000-0000-0000-0000000002BF', 'OnePlus Redmi 14C 512GB (Titanium Grey)', 'OnePlus Redmi 14C 512GB (Titanium Grey) (TB-PHN-00703)
Category: Smartphones

OnePlus Redmi 14C 512GB (Titanium Grey) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-08-01 16:47:32+05:30'),
('42000000-0000-0000-0000-0000000002C0', 'ticket_history', '39000000-0000-0000-0000-0000000002C0', 'Wrong item received for TB-ORD-000039', 'Ticket: Wrong item received for TB-ORD-000039
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-11-02 03:11:17+05:30'),
('42000000-0000-0000-0000-0000000002C1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-04-11 19:11:45+05:30'),
('42000000-0000-0000-0000-0000000002C2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-06-22 01:25:19+05:30'),
('42000000-0000-0000-0000-0000000002C3', 'product', '33000000-0000-0000-0000-0000000002C3', 'Amazfit Galaxy Watch7 GPS (Midnight)', 'Amazfit Galaxy Watch7 GPS (Midnight) (TB-WAT-00707)
Category: Smartwatches

Amazfit Galaxy Watch7 GPS (Midnight) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-02-28 14:56:06+05:30'),
('42000000-0000-0000-0000-0000000002C4', 'ticket_history', '39000000-0000-0000-0000-0000000002C4', 'Received damaged URBN Portronics Bracket Case (White)', 'Ticket: Received damaged URBN Portronics Bracket Case (White)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-10-31 13:42:21+05:30'),
('42000000-0000-0000-0000-0000000002C5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-02 03:47:48+05:30'),
('42000000-0000-0000-0000-0000000002C6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-09-29 07:14:35+05:30'),
('42000000-0000-0000-0000-0000000002C7', 'product', '33000000-0000-0000-0000-0000000002C7', 'Philips Stone 750 BT 5.3 (Black)', 'Philips Stone 750 BT 5.3 (Black) (TB-SPK-00711)
Category: Speakers

Philips Stone 750 BT 5.3 (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-04-09 20:59:51+05:30'),
('42000000-0000-0000-0000-0000000002C8', 'ticket_history', '39000000-0000-0000-0000-0000000002C8', 'Need help with order TB-ORD-000282', 'Ticket: Need help with order TB-ORD-000282
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-12-24 09:53:35+05:30'),
('42000000-0000-0000-0000-0000000002C9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-06-05 10:42:39+05:30'),
('42000000-0000-0000-0000-0000000002CA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-04-06 12:01:21+05:30'),
('42000000-0000-0000-0000-0000000002CB', 'product', '33000000-0000-0000-0000-0000000002CB', 'Brother DeskJet 2700 Tank (Black)', 'Brother DeskJet 2700 Tank (Black) (TB-PRT-00715)
Category: Printers

Brother DeskJet 2700 Tank (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-07-03 10:16:25+05:30'),
('42000000-0000-0000-0000-0000000002CC', 'ticket_history', '39000000-0000-0000-0000-0000000002CC', 'Wrong item received for TB-ORD-000586', 'Ticket: Wrong item received for TB-ORD-000586
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-01-15 18:29:57+05:30'),
('42000000-0000-0000-0000-0000000002CD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-12-24 16:12:49+05:30'),
('42000000-0000-0000-0000-0000000002CE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-02-25 03:26:10+05:30'),
('42000000-0000-0000-0000-0000000002CF', 'product', '33000000-0000-0000-0000-0000000002CF', 'Noise Fitbit Charge 6 Fitness Band (Teal)', 'Noise Fitbit Charge 6 Fitness Band (Teal) (TB-WRL-00719)
Category: Wearables

Noise Fitbit Charge 6 Fitness Band (Teal) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-09-27 21:06:02+05:30'),
('42000000-0000-0000-0000-0000000002D0', 'ticket_history', '39000000-0000-0000-0000-0000000002D0', 'Where is my order TB-ORD-000191?', 'Ticket: Where is my order TB-ORD-000191?
Category: shipping_delay
Status: escalated
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-02-14 01:30:15+05:30'),
('42000000-0000-0000-0000-0000000002D1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-01-09 22:43:36+05:30'),
('42000000-0000-0000-0000-0000000002D2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-08-11 02:41:00+05:30'),
('42000000-0000-0000-0000-0000000002D3', 'product', '33000000-0000-0000-0000-0000000002D3', 'Realme Galaxy Tab S9 FE 64GB (Blue)', 'Realme Galaxy Tab S9 FE 64GB (Blue) (TB-TAB-00723)
Category: Tablets

Realme Galaxy Tab S9 FE 64GB (Blue) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-05-28 14:45:04+05:30'),
('42000000-0000-0000-0000-0000000002D4', 'ticket_history', '39000000-0000-0000-0000-0000000002D4', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-10-21 19:28:08+05:30'),
('42000000-0000-0000-0000-0000000002D5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-13 19:30:33+05:30'),
('42000000-0000-0000-0000-0000000002D6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-11-08 18:10:50+05:30'),
('42000000-0000-0000-0000-0000000002D7', 'product', '33000000-0000-0000-0000-0000000002D7', 'Fujifilm HERO13 Black 4K (Grey)', 'Fujifilm HERO13 Black 4K (Grey) (TB-CAM-00727)
Category: Cameras

Fujifilm HERO13 Black 4K (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-05-04 13:41:22+05:30'),
('42000000-0000-0000-0000-0000000002D8', 'ticket_history', '39000000-0000-0000-0000-0000000002D8', 'Need help with order TB-ORD-000243', 'Ticket: Need help with order TB-ORD-000243
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-01-27 10:27:23+05:30'),
('42000000-0000-0000-0000-0000000002D9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-14 17:23:40+05:30'),
('42000000-0000-0000-0000-0000000002DA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-11-13 16:25:30+05:30'),
('42000000-0000-0000-0000-0000000002DB', 'product', '33000000-0000-0000-0000-0000000002DB', 'HP Keychron K2 Pro RGB (Black)', 'HP Keychron K2 Pro RGB (Black) (TB-KBM-00731)
Category: Keyboards & Mice

HP Keychron K2 Pro RGB (Black) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-12-30 00:31:03+05:30'),
('42000000-0000-0000-0000-0000000002DC', 'ticket_history', '39000000-0000-0000-0000-0000000002DC', 'Wrong item received for TB-ORD-000365', 'Ticket: Wrong item received for TB-ORD-000365
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-10-27 04:25:52+05:30'),
('42000000-0000-0000-0000-0000000002DD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-06-21 23:50:45+05:30'),
('42000000-0000-0000-0000-0000000002DE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-01-28 16:03:27+05:30'),
('42000000-0000-0000-0000-0000000002DF', 'product', '33000000-0000-0000-0000-0000000002DF', 'Honeywell Syska Bulb Speaker (Silver)', 'Honeywell Syska Bulb Speaker (Silver) (TB-SMT-00735)
Category: Smart Home

Honeywell Syska Bulb Speaker (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-04-08 16:32:03+05:30'),
('42000000-0000-0000-0000-0000000002E0', 'ticket_history', '39000000-0000-0000-0000-0000000002E0', 'Refund not received for TB-ORD-000502', 'Ticket: Refund not received for TB-ORD-000502
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-06-15 23:42:05+05:30'),
('42000000-0000-0000-0000-0000000002E1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-06-16 12:47:33+05:30'),
('42000000-0000-0000-0000-0000000002E2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-12-03 14:52:26+05:30'),
('42000000-0000-0000-0000-0000000002E3', 'product', '33000000-0000-0000-0000-0000000002E3', 'Samsung Vivo T3 Ultra 256GB (Emerald)', 'Samsung Vivo T3 Ultra 256GB (Emerald) (TB-PHN-00739)
Category: Smartphones

Samsung Vivo T3 Ultra 256GB (Emerald) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-09-09 12:38:12+05:30'),
('42000000-0000-0000-0000-0000000002E4', 'ticket_history', '39000000-0000-0000-0000-0000000002E4', 'Need help with order TB-ORD-000835', 'Ticket: Need help with order TB-ORD-000835
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-03-03 16:47:37+05:30'),
('42000000-0000-0000-0000-0000000002E5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-07-22 01:43:08+05:30'),
('42000000-0000-0000-0000-0000000002E6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-07-19 09:17:35+05:30'),
('42000000-0000-0000-0000-0000000002E7', 'product', '33000000-0000-0000-0000-0000000002E7', 'Noise Galaxy Watch7 46mm (Coral)', 'Noise Galaxy Watch7 46mm (Coral) (TB-WAT-00743)
Category: Smartwatches

Noise Galaxy Watch7 46mm (Coral) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-03-25 03:22:34+05:30'),
('42000000-0000-0000-0000-0000000002E8', 'ticket_history', '39000000-0000-0000-0000-0000000002E8', 'Wrong item received for TB-ORD-000833', 'Ticket: Wrong item received for TB-ORD-000833
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-09-03 14:45:07+05:30'),
('42000000-0000-0000-0000-0000000002E9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-22 10:03:22+05:30'),
('42000000-0000-0000-0000-0000000002EA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-08-09 07:42:23+05:30'),
('42000000-0000-0000-0000-0000000002EB', 'product', '33000000-0000-0000-0000-0000000002EB', 'Marshall ZEB-Alexa IPX7 (Grey)', 'Marshall ZEB-Alexa IPX7 (Grey) (TB-SPK-00747)
Category: Speakers

Marshall ZEB-Alexa IPX7 (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-04-08 08:51:17+05:30'),
('42000000-0000-0000-0000-0000000002EC', 'ticket_history', '39000000-0000-0000-0000-0000000002EC', 'Wrong item received for TB-ORD-000539', 'Ticket: Wrong item received for TB-ORD-000539
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-01-17 05:10:46+05:30'),
('42000000-0000-0000-0000-0000000002ED', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-29 15:47:41+05:30'),
('42000000-0000-0000-0000-0000000002EE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-03-03 16:37:30+05:30'),
('42000000-0000-0000-0000-0000000002EF', 'product', '33000000-0000-0000-0000-0000000002EF', 'Canon WorkCentre Inkjet (Grey)', 'Canon WorkCentre Inkjet (Grey) (TB-PRT-00751)
Category: Printers

Canon WorkCentre Inkjet (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-01-07 07:43:25+05:30'),
('42000000-0000-0000-0000-0000000002F0', 'ticket_history', '39000000-0000-0000-0000-0000000002F0', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-02-27 11:19:32+05:30'),
('42000000-0000-0000-0000-0000000002F1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-24 16:53:14+05:30'),
('42000000-0000-0000-0000-0000000002F2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-08-28 10:42:49+05:30'),
('42000000-0000-0000-0000-0000000002F3', 'product', '33000000-0000-0000-0000-0000000002F3', 'Fitbit Fitbit Charge 6 GPS (Pink)', 'Fitbit Fitbit Charge 6 GPS (Pink) (TB-WRL-00755)
Category: Wearables

Fitbit Fitbit Charge 6 GPS (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-07-17 22:39:42+05:30'),
('42000000-0000-0000-0000-0000000002F4', 'ticket_history', '39000000-0000-0000-0000-0000000002F4', 'Wrong item received for TB-ORD-000597', 'Ticket: Wrong item received for TB-ORD-000597
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-07-08 05:06:26+05:30'),
('42000000-0000-0000-0000-0000000002F5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-01-15 02:32:45+05:30'),
('42000000-0000-0000-0000-0000000002F6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-11-04 06:05:07+05:30'),
('42000000-0000-0000-0000-0000000002F7', 'product', '33000000-0000-0000-0000-0000000002F7', 'Apple iPad Pro 13 128GB (Silver)', 'Apple iPad Pro 13 128GB (Silver) (TB-TAB-00759)
Category: Tablets

Apple iPad Pro 13 128GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-09-29 01:51:17+05:30'),
('42000000-0000-0000-0000-0000000002F8', 'ticket_history', '39000000-0000-0000-0000-0000000002F8', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-07-19 04:37:03+05:30'),
('42000000-0000-0000-0000-0000000002F9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-24 06:03:25+05:30'),
('42000000-0000-0000-0000-0000000002FA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-17 15:37:13+05:30'),
('42000000-0000-0000-0000-0000000002FB', 'product', '33000000-0000-0000-0000-0000000002FB', 'Sony HERO13 Black Kit 18-55 (Black)', 'Sony HERO13 Black Kit 18-55 (Black) (TB-CAM-00763)
Category: Cameras

Sony HERO13 Black Kit 18-55 (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-04-21 01:34:03+05:30'),
('42000000-0000-0000-0000-0000000002FC', 'ticket_history', '39000000-0000-0000-0000-0000000002FC', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-07-04 19:38:52+05:30'),
('42000000-0000-0000-0000-0000000002FD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-24 01:33:40+05:30'),
('42000000-0000-0000-0000-0000000002FE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-05-16 11:26:44+05:30'),
('42000000-0000-0000-0000-0000000002FF', 'product', '33000000-0000-0000-0000-0000000002FF', 'Zebronics Keychron K2 Pro Mechanical (Grey)', 'Zebronics Keychron K2 Pro Mechanical (Grey) (TB-KBM-00767)
Category: Keyboards & Mice

Zebronics Keychron K2 Pro Mechanical (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-01-19 06:54:31+05:30'),
('42000000-0000-0000-0000-000000000300', 'ticket_history', '39000000-0000-0000-0000-000000000300', 'Received damaged Sennheiser Nothing Buds 2 Spatial Audio (Teal)', 'Ticket: Received damaged Sennheiser Nothing Buds 2 Spatial Audio (Teal)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-12-17 19:33:51+05:30'),
('42000000-0000-0000-0000-000000000301', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-03-06 18:33:54+05:30'),
('42000000-0000-0000-0000-000000000302', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-09-25 07:04:05+05:30'),
('42000000-0000-0000-0000-000000000303', 'product', '33000000-0000-0000-0000-000000000303', 'Philips Echo Dot 5 Speaker (White)', 'Philips Echo Dot 5 Speaker (White) (TB-SMT-00771)
Category: Smart Home

Philips Echo Dot 5 Speaker (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-06-19 03:50:20+05:30'),
('42000000-0000-0000-0000-000000000304', 'ticket_history', '39000000-0000-0000-0000-000000000304', 'Wrong item received for TB-ORD-000113', 'Ticket: Wrong item received for TB-ORD-000113
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-02-12 21:13:44+05:30'),
('42000000-0000-0000-0000-000000000305', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-11 21:33:29+05:30'),
('42000000-0000-0000-0000-000000000306', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-09-19 06:26:22+05:30'),
('42000000-0000-0000-0000-000000000307', 'product', '33000000-0000-0000-0000-000000000307', 'Samsung Galaxy S25 512GB (Titanium Grey)', 'Samsung Galaxy S25 512GB (Titanium Grey) (TB-PHN-00775)
Category: Smartphones

Samsung Galaxy S25 512GB (Titanium Grey) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-10-27 18:02:13+05:30'),
('42000000-0000-0000-0000-000000000308', 'ticket_history', '39000000-0000-0000-0000-000000000308', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: open
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-04-12 06:41:59+05:30'),
('42000000-0000-0000-0000-000000000309', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-23 17:45:04+05:30'),
('42000000-0000-0000-0000-00000000030A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-01-09 22:01:53+05:30'),
('42000000-0000-0000-0000-00000000030B', 'product', '33000000-0000-0000-0000-00000000030B', 'Samsung Watch Series 10 Bluetooth Calling (Midnight)', 'Samsung Watch Series 10 Bluetooth Calling (Midnight) (TB-WAT-00779)
Category: Smartwatches

Samsung Watch Series 10 Bluetooth Calling (Midnight) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-03-12 22:30:09+05:30'),
('42000000-0000-0000-0000-00000000030C', 'ticket_history', '39000000-0000-0000-0000-00000000030C', 'Received damaged Xiaomi Galaxy M35 128GB (Titanium Grey)', 'Ticket: Received damaged Xiaomi Galaxy M35 128GB (Titanium Grey)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-10-10 13:56:34+05:30'),
('42000000-0000-0000-0000-00000000030D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-11 18:25:47+05:30'),
('42000000-0000-0000-0000-00000000030E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-06-02 11:44:36+05:30'),
('42000000-0000-0000-0000-00000000030F', 'product', '33000000-0000-0000-0000-00000000030F', 'Sony Charge 6 BT 5.3 (Grey)', 'Sony Charge 6 BT 5.3 (Grey) (TB-SPK-00783)
Category: Speakers

Sony Charge 6 BT 5.3 (Grey) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-12-08 09:04:16+05:30'),
('42000000-0000-0000-0000-000000000310', 'ticket_history', '39000000-0000-0000-0000-000000000310', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-03-18 14:17:35+05:30'),
('42000000-0000-0000-0000-000000000311', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-21 04:11:52+05:30'),
('42000000-0000-0000-0000-000000000312', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-10-28 17:26:46+05:30'),
('42000000-0000-0000-0000-000000000313', 'product', '33000000-0000-0000-0000-000000000313', 'Epson EcoTank L3250 WiFi (Black)', 'Epson EcoTank L3250 WiFi (Black) (TB-PRT-00787)
Category: Printers

Epson EcoTank L3250 WiFi (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-10-01 00:40:18+05:30'),
('42000000-0000-0000-0000-000000000314', 'ticket_history', '39000000-0000-0000-0000-000000000314', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-08-30 00:09:25+05:30'),
('42000000-0000-0000-0000-000000000315', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-24 05:11:21+05:30'),
('42000000-0000-0000-0000-000000000316', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-07-21 13:55:13+05:30'),
('42000000-0000-0000-0000-000000000317', 'product', '33000000-0000-0000-0000-000000000317', 'OnePlus Fire-Boltt Smart AMOLED (Coral)', 'OnePlus Fire-Boltt Smart AMOLED (Coral) (TB-WRL-00791)
Category: Wearables

OnePlus Fire-Boltt Smart AMOLED (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-05-15 22:35:31+05:30'),
('42000000-0000-0000-0000-000000000318', 'ticket_history', '39000000-0000-0000-0000-000000000318', 'Where is my order TB-ORD-000742?', 'Ticket: Where is my order TB-ORD-000742?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-10-02 02:03:40+05:30'),
('42000000-0000-0000-0000-000000000319', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-17 13:26:05+05:30'),
('42000000-0000-0000-0000-00000000031A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-02-26 01:18:18+05:30'),
('42000000-0000-0000-0000-00000000031B', 'product', '33000000-0000-0000-0000-00000000031B', 'Samsung iPad Air 11 256GB (Grey)', 'Samsung iPad Air 11 256GB (Grey) (TB-TAB-00795)
Category: Tablets

Samsung iPad Air 11 256GB (Grey) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2025-06-07 18:16:41+05:30'),
('42000000-0000-0000-0000-00000000031C', 'ticket_history', '39000000-0000-0000-0000-00000000031C', 'Refund not received for TB-ORD-000209', 'Ticket: Refund not received for TB-ORD-000209
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-06-24 05:16:41+05:30'),
('42000000-0000-0000-0000-00000000031D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-07-30 06:55:58+05:30'),
('42000000-0000-0000-0000-00000000031E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-01-23 12:01:57+05:30'),
('42000000-0000-0000-0000-00000000031F', 'product', '33000000-0000-0000-0000-00000000031F', 'GoPro D3500 Kit 18-55 (Silver)', 'GoPro D3500 Kit 18-55 (Silver) (TB-CAM-00799)
Category: Cameras

GoPro D3500 Kit 18-55 (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-10-25 12:26:53+05:30'),
('42000000-0000-0000-0000-000000000320', 'ticket_history', '39000000-0000-0000-0000-000000000320', 'Received damaged Acer IdeaPad Slim 5 512GB SSD (Titanium)', 'Ticket: Received damaged Acer IdeaPad Slim 5 512GB SSD (Titanium)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2026-07-28 11:16:52+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000321', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-02 16:51:23+05:30'),
('42000000-0000-0000-0000-000000000322', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-06-17 17:35:17+05:30'),
('42000000-0000-0000-0000-000000000323', 'product', '33000000-0000-0000-0000-000000000323', 'Keychron Corsair K70 Ergonomic (Grey)', 'Keychron Corsair K70 Ergonomic (Grey) (TB-KBM-00803)
Category: Keyboards & Mice

Keychron Corsair K70 Ergonomic (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-02-03 15:12:48+05:30'),
('42000000-0000-0000-0000-000000000324', 'ticket_history', '39000000-0000-0000-0000-000000000324', 'Need help with order TB-ORD-000027', 'Ticket: Need help with order TB-ORD-000027
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-06-21 17:13:28+05:30'),
('42000000-0000-0000-0000-000000000325', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-01-25 00:57:49+05:30'),
('42000000-0000-0000-0000-000000000326', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-08-08 17:05:11+05:30'),
('42000000-0000-0000-0000-000000000327', 'product', '33000000-0000-0000-0000-000000000327', 'TP-Link Syska Bulb Camera (Silver)', 'TP-Link Syska Bulb Camera (Silver) (TB-SMT-00807)
Category: Smart Home

TP-Link Syska Bulb Camera (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-05-06 02:56:12+05:30'),
('42000000-0000-0000-0000-000000000328', 'ticket_history', '39000000-0000-0000-0000-000000000328', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: open
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-03-21 09:24:47+05:30'),
('42000000-0000-0000-0000-000000000329', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-09 17:44:23+05:30'),
('42000000-0000-0000-0000-00000000032A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-11-27 00:34:08+05:30'),
('42000000-0000-0000-0000-00000000032B', 'product', '33000000-0000-0000-0000-00000000032B', 'Vivo Galaxy A56 256GB (Silver)', 'Vivo Galaxy A56 256GB (Silver) (TB-PHN-00811)
Category: Smartphones

Vivo Galaxy A56 256GB (Silver) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-11-03 05:27:15+05:30'),
('42000000-0000-0000-0000-00000000032C', 'ticket_history', '39000000-0000-0000-0000-00000000032C', 'Where is my order TB-ORD-000653?', 'Ticket: Where is my order TB-ORD-000653?
Category: shipping_delay
Status: open
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-10-07 19:38:07+05:30'),
('42000000-0000-0000-0000-00000000032D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-07 19:24:34+05:30'),
('42000000-0000-0000-0000-00000000032E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-13 10:39:55+05:30'),
('42000000-0000-0000-0000-00000000032F', 'product', '33000000-0000-0000-0000-00000000032F', 'Amazfit Redmi Watch 5 46mm (Silver)', 'Amazfit Redmi Watch 5 46mm (Silver) (TB-WAT-00815)
Category: Smartwatches

Amazfit Redmi Watch 5 46mm (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-01-29 13:29:02+05:30'),
('42000000-0000-0000-0000-000000000330', 'ticket_history', '39000000-0000-0000-0000-000000000330', 'Refund not received for TB-ORD-000454', 'Ticket: Refund not received for TB-ORD-000454
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-12-08 15:21:19+05:30'),
('42000000-0000-0000-0000-000000000331', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-29 07:35:47+05:30'),
('42000000-0000-0000-0000-000000000332', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-07-14 09:21:07+05:30'),
('42000000-0000-0000-0000-000000000333', 'product', '33000000-0000-0000-0000-000000000333', 'Bose Charge 6 TWS Pair (Black)', 'Bose Charge 6 TWS Pair (Black) (TB-SPK-00819)
Category: Speakers

Bose Charge 6 TWS Pair (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2024-01-07 11:38:59+05:30'),
('42000000-0000-0000-0000-000000000334', 'ticket_history', '39000000-0000-0000-0000-000000000334', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-10-21 01:19:19+05:30'),
('42000000-0000-0000-0000-000000000335', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-08 13:06:18+05:30'),
('42000000-0000-0000-0000-000000000336', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-03-10 20:41:48+05:30'),
('42000000-0000-0000-0000-000000000337', 'product', '33000000-0000-0000-0000-000000000337', 'Xerox DeskJet 2700 Multi-Function (White)', 'Xerox DeskJet 2700 Multi-Function (White) (TB-PRT-00823)
Category: Printers

Xerox DeskJet 2700 Multi-Function (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-11-24 08:43:32+05:30'),
('42000000-0000-0000-0000-000000000338', 'ticket_history', '39000000-0000-0000-0000-000000000338', 'Received damaged Sony Charge 6 BT 5.3 (Grey)', 'Ticket: Received damaged Sony Charge 6 BT 5.3 (Grey)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-01-04 06:29:22+05:30'),
('42000000-0000-0000-0000-000000000339', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-12-25 08:25:01+05:30'),
('42000000-0000-0000-0000-00000000033A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-03-02 10:41:22+05:30'),
('42000000-0000-0000-0000-00000000033B', 'product', '33000000-0000-0000-0000-00000000033B', 'Fire-Boltt Fitbit Charge 6 GPS (Blue)', 'Fire-Boltt Fitbit Charge 6 GPS (Blue) (TB-WRL-00827)
Category: Wearables

Fire-Boltt Fitbit Charge 6 GPS (Blue) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2025-05-27 05:59:49+05:30'),
('42000000-0000-0000-0000-00000000033C', 'ticket_history', '39000000-0000-0000-0000-00000000033C', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2026-01-17 06:32:47+05:30'),
('42000000-0000-0000-0000-00000000033D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-24 00:25:23+05:30'),
('42000000-0000-0000-0000-00000000033E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-08-26 02:20:33+05:30'),
('42000000-0000-0000-0000-00000000033F', 'product', '33000000-0000-0000-0000-00000000033F', 'Apple OnePlus Pad 2 64GB (Green)', 'Apple OnePlus Pad 2 64GB (Green) (TB-TAB-00831)
Category: Tablets

Apple OnePlus Pad 2 64GB (Green) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-04-14 19:52:31+05:30'),
('42000000-0000-0000-0000-000000000340', 'ticket_history', '39000000-0000-0000-0000-000000000340', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: escalated
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-09-02 15:45:02+05:30'),
('42000000-0000-0000-0000-000000000341', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-24 00:01:03+05:30'),
('42000000-0000-0000-0000-000000000342', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-12-15 23:51:56+05:30'),
('42000000-0000-0000-0000-000000000343', 'product', '33000000-0000-0000-0000-000000000343', 'Sony PowerShot SX740 Vlog (Black)', 'Sony PowerShot SX740 Vlog (Black) (TB-CAM-00835)
Category: Cameras

Sony PowerShot SX740 Vlog (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-01-17 08:47:31+05:30'),
('42000000-0000-0000-0000-000000000344', 'ticket_history', '39000000-0000-0000-0000-000000000344', 'Where is my order ?', 'Ticket: Where is my order ?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-11-02 22:54:24+05:30'),
('42000000-0000-0000-0000-000000000345', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-05-14 07:22:57+05:30'),
('42000000-0000-0000-0000-000000000346', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-09-10 03:00:13+05:30'),
('42000000-0000-0000-0000-000000000347', 'product', '33000000-0000-0000-0000-000000000347', 'Dell MX Keys S Multimedia (Grey)', 'Dell MX Keys S Multimedia (Grey) (TB-KBM-00839)
Category: Keyboards & Mice

Dell MX Keys S Multimedia (Grey) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-05-13 17:08:03+05:30'),
('42000000-0000-0000-0000-000000000348', 'ticket_history', '39000000-0000-0000-0000-000000000348', 'Need help', 'Ticket: Need help
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-09-27 07:04:10+05:30'),
('42000000-0000-0000-0000-000000000349', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-10-27 05:44:53+05:30'),
('42000000-0000-0000-0000-00000000034A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-05-26 13:31:34+05:30'),
('42000000-0000-0000-0000-00000000034B', 'product', '33000000-0000-0000-0000-00000000034B', 'Philips Nest Mini Speaker (White)', 'Philips Nest Mini Speaker (White) (TB-SMT-00843)
Category: Smart Home

Philips Nest Mini Speaker (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2024-10-26 14:55:13+05:30'),
('42000000-0000-0000-0000-00000000034C', 'ticket_history', '39000000-0000-0000-0000-00000000034C', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-12-12 22:26:47+05:30'),
('42000000-0000-0000-0000-00000000034D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-23 07:16:06+05:30'),
('42000000-0000-0000-0000-00000000034E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-12-16 18:17:24+05:30'),
('42000000-0000-0000-0000-00000000034F', 'product', '33000000-0000-0000-0000-00000000034F', 'Nothing Vivo T3 Ultra 128GB (White)', 'Nothing Vivo T3 Ultra 128GB (White) (TB-PHN-00847)
Category: Smartphones

Nothing Vivo T3 Ultra 128GB (White) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-02-26 23:54:17+05:30'),
('42000000-0000-0000-0000-000000000350', 'ticket_history', '39000000-0000-0000-0000-000000000350', 'Where is my order TB-ORD-000621?', 'Ticket: Where is my order TB-ORD-000621?
Category: shipping_delay
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-02-13 10:26:29+05:30'),
('42000000-0000-0000-0000-000000000351', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-21 11:44:33+05:30'),
('42000000-0000-0000-0000-000000000352', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-08-19 19:56:58+05:30'),
('42000000-0000-0000-0000-000000000353', 'product', '33000000-0000-0000-0000-000000000353', 'Apple Redmi Watch 5 44mm (Rose Gold)', 'Apple Redmi Watch 5 44mm (Rose Gold) (TB-WAT-00851)
Category: Smartwatches

Apple Redmi Watch 5 44mm (Rose Gold) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-03-29 20:19:55+05:30'),
('42000000-0000-0000-0000-000000000354', 'ticket_history', '39000000-0000-0000-0000-000000000354', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-04-11 23:31:43+05:30'),
('42000000-0000-0000-0000-000000000355', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-09-15 07:07:51+05:30'),
('42000000-0000-0000-0000-000000000356', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-11-20 16:32:20+05:30'),
('42000000-0000-0000-0000-000000000357', 'product', '33000000-0000-0000-0000-000000000357', 'Ultron Philips SBA Wireless (Black)', 'Ultron Philips SBA Wireless (Black) (TB-SPK-00855)
Category: Speakers

Ultron Philips SBA Wireless (Black) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-07-12 17:03:37+05:30'),
('42000000-0000-0000-0000-000000000358', 'ticket_history', '39000000-0000-0000-0000-000000000358', 'Where is my order TB-ORD-000344?', 'Ticket: Where is my order TB-ORD-000344?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-11-27 14:02:00+05:30'),
('42000000-0000-0000-0000-000000000359', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-12-05 23:09:17+05:30'),
('42000000-0000-0000-0000-00000000035A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-01-17 14:36:40+05:30'),
('42000000-0000-0000-0000-00000000035B', 'product', '33000000-0000-0000-0000-00000000035B', 'Xerox DeskJet 2700 Laser (Grey)', 'Xerox DeskJet 2700 Laser (Grey) (TB-PRT-00859)
Category: Printers

Xerox DeskJet 2700 Laser (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-05-14 12:19:49+05:30'),
('42000000-0000-0000-0000-00000000035C', 'ticket_history', '39000000-0000-0000-0000-00000000035C', 'Wrong item received for TB-ORD-000409', 'Ticket: Wrong item received for TB-ORD-000409
Category: wrong_item
Status: open
Resolution: open', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-07-10 07:07:33+05:30'),
('42000000-0000-0000-0000-00000000035D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-04-18 16:11:04+05:30'),
('42000000-0000-0000-0000-00000000035E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-09-13 21:31:43+05:30'),
('42000000-0000-0000-0000-00000000035F', 'product', '33000000-0000-0000-0000-00000000035F', 'Fire-Boltt OnePlus Band 5ATM (Coral)', 'Fire-Boltt OnePlus Band 5ATM (Coral) (TB-WRL-00863)
Category: Wearables

Fire-Boltt OnePlus Band 5ATM (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-03-30 01:22:55+05:30'),
('42000000-0000-0000-0000-000000000360', 'ticket_history', '39000000-0000-0000-0000-000000000360', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-01-23 06:20:53+05:30'),
('42000000-0000-0000-0000-000000000361', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-24 09:43:19+05:30'),
('42000000-0000-0000-0000-000000000362', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-10-08 02:09:45+05:30'),
('42000000-0000-0000-0000-000000000363', 'product', '33000000-0000-0000-0000-000000000363', 'Samsung iPad Air 11 64GB (Blue)', 'Samsung iPad Air 11 64GB (Blue) (TB-TAB-00867)
Category: Tablets

Samsung iPad Air 11 64GB (Blue) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-03-09 09:31:53+05:30'),
('42000000-0000-0000-0000-000000000364', 'ticket_history', '39000000-0000-0000-0000-000000000364', 'Where is my order TB-ORD-000267?', 'Ticket: Where is my order TB-ORD-000267?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-02-27 10:32:39+05:30'),
('42000000-0000-0000-0000-000000000365', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-28 14:43:43+05:30'),
('42000000-0000-0000-0000-000000000366', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-03-18 15:46:47+05:30'),
('42000000-0000-0000-0000-000000000367', 'product', '33000000-0000-0000-0000-000000000367', 'Canon Alpha 7 IV Vlog (Black)', 'Canon Alpha 7 IV Vlog (Black) (TB-CAM-00871)
Category: Cameras

Canon Alpha 7 IV Vlog (Black) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-09-10 08:21:42+05:30'),
('42000000-0000-0000-0000-000000000368', 'ticket_history', '39000000-0000-0000-0000-000000000368', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: escalated
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-01-30 22:10:22+05:30'),
('42000000-0000-0000-0000-000000000369', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-04-03 19:38:30+05:30'),
('42000000-0000-0000-0000-00000000036A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-05-06 14:33:10+05:30'),
('42000000-0000-0000-0000-00000000036B', 'product', '33000000-0000-0000-0000-00000000036B', 'TVS BlackWidow V4 Gaming (Black)', 'TVS BlackWidow V4 Gaming (Black) (TB-KBM-00875)
Category: Keyboards & Mice

TVS BlackWidow V4 Gaming (Black) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-02-06 18:57:21+05:30'),
('42000000-0000-0000-0000-00000000036C', 'ticket_history', '39000000-0000-0000-0000-00000000036C', 'Refund not received for TB-ORD-000785', 'Ticket: Refund not received for TB-ORD-000785
Category: refund
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-06-02 07:20:32+05:30'),
('42000000-0000-0000-0000-00000000036D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-25 23:44:59+05:30'),
('42000000-0000-0000-0000-00000000036E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-10-16 09:12:07+05:30'),
('42000000-0000-0000-0000-00000000036F', 'product', '33000000-0000-0000-0000-00000000036F', 'Syska Echo Dot 5 Plug (Silver)', 'Syska Echo Dot 5 Plug (Silver) (TB-SMT-00879)
Category: Smart Home

Syska Echo Dot 5 Plug (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-03-17 17:37:49+05:30'),
('42000000-0000-0000-0000-000000000370', 'ticket_history', '39000000-0000-0000-0000-000000000370', 'Refund not received for TB-ORD-000365', 'Ticket: Refund not received for TB-ORD-000365
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-10-16 23:34:14+05:30'),
('42000000-0000-0000-0000-000000000371', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-21 22:06:31+05:30'),
('42000000-0000-0000-0000-000000000372', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-03-15 09:53:48+05:30'),
('42000000-0000-0000-0000-000000000373', 'product', '33000000-0000-0000-0000-000000000373', 'Motorola Nothing Phone 3a 256GB (Ocean Teal)', 'Motorola Nothing Phone 3a 256GB (Ocean Teal) (TB-PHN-00883)
Category: Smartphones

Motorola Nothing Phone 3a 256GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-05-15 00:29:54+05:30'),
('42000000-0000-0000-0000-000000000374', 'ticket_history', '39000000-0000-0000-0000-000000000374', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-07-26 16:00:58+05:30'),
('42000000-0000-0000-0000-000000000375', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-16 12:51:00+05:30'),
('42000000-0000-0000-0000-000000000376', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-12-03 08:33:34+05:30'),
('42000000-0000-0000-0000-000000000377', 'product', '33000000-0000-0000-0000-000000000377', 'OnePlus Redmi Watch 5 Bluetooth Calling (Black)', 'OnePlus Redmi Watch 5 Bluetooth Calling (Black) (TB-WAT-00887)
Category: Smartwatches

OnePlus Redmi Watch 5 Bluetooth Calling (Black) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2026-03-10 17:24:20+05:30'),
('42000000-0000-0000-0000-000000000378', 'ticket_history', '39000000-0000-0000-0000-000000000378', 'Received damaged Sennheiser Nothing Buds 2 Spatial Audio (Navy)', 'Ticket: Received damaged Sennheiser Nothing Buds 2 Spatial Audio (Navy)
Category: defective
Status: open
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-05-17 07:15:06+05:30'),
('42000000-0000-0000-0000-000000000379', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-02-23 00:15:08+05:30'),
('42000000-0000-0000-0000-00000000037A', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-02-10 16:03:55+05:30'),
('42000000-0000-0000-0000-00000000037B', 'product', '33000000-0000-0000-0000-00000000037B', 'Sony SRS-XB100 Wireless (Yellow)', 'Sony SRS-XB100 Wireless (Yellow) (TB-SPK-00891)
Category: Speakers

Sony SRS-XB100 Wireless (Yellow) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-01-11 03:19:01+05:30'),
('42000000-0000-0000-0000-00000000037C', 'ticket_history', '39000000-0000-0000-0000-00000000037C', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-06-07 12:15:56+05:30'),
('42000000-0000-0000-0000-00000000037D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-17 05:21:07+05:30'),
('42000000-0000-0000-0000-00000000037E', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-10-01 09:24:16+05:30'),
('42000000-0000-0000-0000-00000000037F', 'product', '33000000-0000-0000-0000-00000000037F', 'HP DCP-T220 Multi-Function (Black)', 'HP DCP-T220 Multi-Function (Black) (TB-PRT-00895)
Category: Printers

HP DCP-T220 Multi-Function (Black) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2024-05-14 22:05:24+05:30'),
('42000000-0000-0000-0000-000000000380', 'ticket_history', '39000000-0000-0000-0000-000000000380', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-06-01 05:45:29+05:30'),
('42000000-0000-0000-0000-000000000381', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-10-14 17:37:23+05:30'),
('42000000-0000-0000-0000-000000000382', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-01-05 16:49:40+05:30'),
('42000000-0000-0000-0000-000000000383', 'product', '33000000-0000-0000-0000-000000000383', 'Xiaomi Fire-Boltt Smart SpO2 (Pink)', 'Xiaomi Fire-Boltt Smart SpO2 (Pink) (TB-WRL-00899)
Category: Wearables

Xiaomi Fire-Boltt Smart SpO2 (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2024-10-08 22:02:43+05:30'),
('42000000-0000-0000-0000-000000000384', 'ticket_history', '39000000-0000-0000-0000-000000000384', 'Need help with order TB-ORD-000238', 'Ticket: Need help with order TB-ORD-000238
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-03-04 11:29:38+05:30')
ON CONFLICT (kb_id) DO NOTHING;

INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000385', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-11-22 19:59:39+05:30'),
('42000000-0000-0000-0000-000000000386', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-01-30 22:12:24+05:30'),
('42000000-0000-0000-0000-000000000387', 'product', '33000000-0000-0000-0000-000000000387', 'Apple Lenovo Tab P12 64GB (Green)', 'Apple Lenovo Tab P12 64GB (Green) (TB-TAB-00903)
Category: Tablets

Apple Lenovo Tab P12 64GB (Green) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-10-05 07:57:27+05:30'),
('42000000-0000-0000-0000-000000000388', 'ticket_history', '39000000-0000-0000-0000-000000000388', 'Need help', 'Ticket: Need help
Category: other
Status: open
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-05-11 05:14:15+05:30'),
('42000000-0000-0000-0000-000000000389', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-15 12:34:22+05:30'),
('42000000-0000-0000-0000-00000000038A', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-06-08 07:35:09+05:30'),
('42000000-0000-0000-0000-00000000038B', 'product', '33000000-0000-0000-0000-00000000038B', 'Fujifilm D3500 Waterproof (Silver)', 'Fujifilm D3500 Waterproof (Silver) (TB-CAM-00907)
Category: Cameras

Fujifilm D3500 Waterproof (Silver) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2025-04-23 21:11:20+05:30'),
('42000000-0000-0000-0000-00000000038C', 'ticket_history', '39000000-0000-0000-0000-00000000038C', 'Where is my order TB-ORD-000434?', 'Ticket: Where is my order TB-ORD-000434?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2025-03-27 21:24:48+05:30'),
('42000000-0000-0000-0000-00000000038D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-06 07:04:02+05:30'),
('42000000-0000-0000-0000-00000000038E', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-01-15 21:26:23+05:30'),
('42000000-0000-0000-0000-00000000038F', 'product', '33000000-0000-0000-0000-00000000038F', 'Keychron Corsair K70 Gaming (White)', 'Keychron Corsair K70 Gaming (White) (TB-KBM-00911)
Category: Keyboards & Mice

Keychron Corsair K70 Gaming (White) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2026-01-26 21:29:05+05:30'),
('42000000-0000-0000-0000-000000000390', 'ticket_history', '39000000-0000-0000-0000-000000000390', 'Received damaged Apple Galaxy Tab S9 FE 64GB (Sage)', 'Ticket: Received damaged Apple Galaxy Tab S9 FE 64GB (Sage)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-04-19 20:29:26+05:30'),
('42000000-0000-0000-0000-000000000391', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-12 01:06:45+05:30'),
('42000000-0000-0000-0000-000000000392', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-02-05 23:02:35+05:30'),
('42000000-0000-0000-0000-000000000393', 'product', '33000000-0000-0000-0000-000000000393', 'Google Hue White Bulb (White)', 'Google Hue White Bulb (White) (TB-SMT-00915)
Category: Smart Home

Google Hue White Bulb (White) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2026-04-01 16:05:23+05:30'),
('42000000-0000-0000-0000-000000000394', 'ticket_history', '39000000-0000-0000-0000-000000000394', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-05-30 18:48:16+05:30'),
('42000000-0000-0000-0000-000000000395', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-30 15:54:09+05:30'),
('42000000-0000-0000-0000-000000000396', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-02-11 07:16:12+05:30'),
('42000000-0000-0000-0000-000000000397', 'product', '33000000-0000-0000-0000-000000000397', 'Vivo Galaxy A56 128GB (Rose Gold)', 'Vivo Galaxy A56 128GB (Rose Gold) (TB-PHN-00919)
Category: Smartphones

Vivo Galaxy A56 128GB (Rose Gold) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2024-07-25 07:35:47+05:30'),
('42000000-0000-0000-0000-000000000398', 'ticket_history', '39000000-0000-0000-0000-000000000398', 'Need help', 'Ticket: Need help
Category: other
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-01-23 01:57:30+05:30'),
('42000000-0000-0000-0000-000000000399', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-08-11 11:17:59+05:30'),
('42000000-0000-0000-0000-00000000039A', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2024-11-30 21:02:49+05:30'),
('42000000-0000-0000-0000-00000000039B', 'product', '33000000-0000-0000-0000-00000000039B', 'Apple Noise ColorFit Pro 5 SpO2 (Silver)', 'Apple Noise ColorFit Pro 5 SpO2 (Silver) (TB-WAT-00923)
Category: Smartwatches

Apple Noise ColorFit Pro 5 SpO2 (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2024-08-10 04:20:10+05:30'),
('42000000-0000-0000-0000-00000000039C', 'ticket_history', '39000000-0000-0000-0000-00000000039C', 'Refund not received for TB-ORD-000589', 'Ticket: Refund not received for TB-ORD-000589
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-05-12 18:19:08+05:30'),
('42000000-0000-0000-0000-00000000039D', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-12-25 01:04:02+05:30'),
('42000000-0000-0000-0000-00000000039E', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-08-04 06:55:00+05:30'),
('42000000-0000-0000-0000-00000000039F', 'product', '33000000-0000-0000-0000-00000000039F', 'ZEBRONICS Emberton II Party Light (Blue)', 'ZEBRONICS Emberton II Party Light (Blue) (TB-SPK-00927)
Category: Speakers

ZEBRONICS Emberton II Party Light (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2025-01-16 13:21:54+05:30'),
('42000000-0000-0000-0000-0000000003A0', 'ticket_history', '39000000-0000-0000-0000-0000000003A0', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-04-14 15:18:49+05:30'),
('42000000-0000-0000-0000-0000000003A1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-22 08:56:55+05:30'),
('42000000-0000-0000-0000-0000000003A2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2026-02-13 18:39:30+05:30'),
('42000000-0000-0000-0000-0000000003A3', 'product', '33000000-0000-0000-0000-0000000003A3', 'Canon MFC-J995 WiFi (White)', 'Canon MFC-J995 WiFi (White) (TB-PRT-00931)
Category: Printers

Canon MFC-J995 WiFi (White) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2025-05-02 06:25:53+05:30'),
('42000000-0000-0000-0000-0000000003A4', 'ticket_history', '39000000-0000-0000-0000-0000000003A4', 'Wrong item received for TB-ORD-000641', 'Ticket: Wrong item received for TB-ORD-000641
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2024-01-16 13:47:37+05:30'),
('42000000-0000-0000-0000-0000000003A5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-06-23 04:55:05+05:30'),
('42000000-0000-0000-0000-0000000003A6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-05-10 23:27:05+05:30'),
('42000000-0000-0000-0000-0000000003A7', 'product', '33000000-0000-0000-0000-0000000003A7', 'OnePlus Fire-Boltt Smart AMOLED (Coral)', 'OnePlus Fire-Boltt Smart AMOLED (Coral) (TB-WRL-00935)
Category: Wearables

OnePlus Fire-Boltt Smart AMOLED (Coral) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-05-19 02:20:32+05:30'),
('42000000-0000-0000-0000-0000000003A8', 'ticket_history', '39000000-0000-0000-0000-0000000003A8', 'Wrong item received for TB-ORD-000780', 'Ticket: Wrong item received for TB-ORD-000780
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-03-22 13:42:08+05:30'),
('42000000-0000-0000-0000-0000000003A9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-04-06 20:46:49+05:30'),
('42000000-0000-0000-0000-0000000003AA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-04-24 04:31:17+05:30'),
('42000000-0000-0000-0000-0000000003AB', 'product', '33000000-0000-0000-0000-0000000003AB', 'Samsung Galaxy Tab A9+ 64GB (Blue)', 'Samsung Galaxy Tab A9+ 64GB (Blue) (TB-TAB-00939)
Category: Tablets

Samsung Galaxy Tab A9+ 64GB (Blue) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2026-07-14 21:26:46+05:30'),
('42000000-0000-0000-0000-0000000003AC', 'ticket_history', '39000000-0000-0000-0000-0000000003AC', 'Received damaged HP P2723DE Ultrawide (Dark Grey)', 'Ticket: Received damaged HP P2723DE Ultrawide (Dark Grey)
Category: defective
Status: in_progress
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-08-24 19:38:07+05:30'),
('42000000-0000-0000-0000-0000000003AD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-05-19 07:18:01+05:30'),
('42000000-0000-0000-0000-0000000003AE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-01-23 23:51:22+05:30'),
('42000000-0000-0000-0000-0000000003AF', 'product', '33000000-0000-0000-0000-0000000003AF', 'Canon Coolpix P1000 Kit 50mm (Grey)', 'Canon Coolpix P1000 Kit 50mm (Grey) (TB-CAM-00943)
Category: Cameras

Canon Coolpix P1000 Kit 50mm (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for travel use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-10-14 00:27:26+05:30'),
('42000000-0000-0000-0000-0000000003B0', 'ticket_history', '39000000-0000-0000-0000-0000000003B0', 'Received damaged Google Tapo L510E Camera (Silver)', 'Ticket: Received damaged Google Tapo L510E Camera (Silver)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-08-29 18:53:09+05:30'),
('42000000-0000-0000-0000-0000000003B1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-04-13 18:45:33+05:30'),
('42000000-0000-0000-0000-0000000003B2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-11-24 22:55:49+05:30'),
('42000000-0000-0000-0000-0000000003B3', 'product', '33000000-0000-0000-0000-0000000003B3', 'Corsair K70 RGB (Carbon)', 'Corsair K70 RGB (Carbon) (TB-KBM-00947)
Category: Keyboards & Mice

Corsair K70 RGB (Carbon) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2024-08-02 06:49:40+05:30'),
('42000000-0000-0000-0000-0000000003B4', 'ticket_history', '39000000-0000-0000-0000-0000000003B4', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2026-03-13 19:08:14+05:30'),
('42000000-0000-0000-0000-0000000003B5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-08-04 06:10:53+05:30'),
('42000000-0000-0000-0000-0000000003B6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-08-11 05:28:51+05:30'),
('42000000-0000-0000-0000-0000000003B7', 'product', '33000000-0000-0000-0000-0000000003B7', 'Wipro Tapo L510E Speaker (Silver)', 'Wipro Tapo L510E Speaker (Silver) (TB-SMT-00951)
Category: Smart Home

Wipro Tapo L510E Speaker (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-06-08 23:26:33+05:30'),
('42000000-0000-0000-0000-0000000003B8', 'ticket_history', '39000000-0000-0000-0000-0000000003B8', 'Received damaged Vivo Realme P1 Pro 512GB (Rose Gold)', 'Ticket: Received damaged Vivo Realme P1 Pro 512GB (Rose Gold)
Category: defective
Status: open
Resolution: open', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-10-06 09:36:34+05:30'),
('42000000-0000-0000-0000-0000000003B9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-03-05 08:38:35+05:30'),
('42000000-0000-0000-0000-0000000003BA', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-08-19 04:30:26+05:30'),
('42000000-0000-0000-0000-0000000003BB', 'product', '33000000-0000-0000-0000-0000000003BB', 'Apple Redmi 14C 512GB (Ocean Teal)', 'Apple Redmi 14C 512GB (Ocean Teal) (TB-PHN-00955)
Category: Smartphones

Apple Redmi 14C 512GB (Ocean Teal) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2025-11-04 15:03:56+05:30'),
('42000000-0000-0000-0000-0000000003BC', 'ticket_history', '39000000-0000-0000-0000-0000000003BC', 'Need help', 'Ticket: Need help
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2025-08-01 06:33:41+05:30'),
('42000000-0000-0000-0000-0000000003BD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-09-05 09:26:01+05:30'),
('42000000-0000-0000-0000-0000000003BE', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-09-16 20:09:13+05:30'),
('42000000-0000-0000-0000-0000000003BF', 'product', '33000000-0000-0000-0000-0000000003BF', 'OnePlus Fire-Boltt Invincible AMOLED (Silver)', 'OnePlus Fire-Boltt Invincible AMOLED (Silver) (TB-WAT-00959)
Category: Smartwatches

OnePlus Fire-Boltt Invincible AMOLED (Silver) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for office use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-08-05 03:57:23+05:30'),
('42000000-0000-0000-0000-0000000003C0', 'ticket_history', '39000000-0000-0000-0000-0000000003C0', 'Where is my order TB-ORD-000495?', 'Ticket: Where is my order TB-ORD-000495?
Category: shipping_delay
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","shipping_delay"]}'::jsonb, '2024-02-21 18:23:16+05:30'),
('42000000-0000-0000-0000-0000000003C1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-05-20 16:24:34+05:30'),
('42000000-0000-0000-0000-0000000003C2', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2026-05-23 02:05:21+05:30'),
('42000000-0000-0000-0000-0000000003C3', 'product', '33000000-0000-0000-0000-0000000003C3', 'ZEBRONICS Ultron X1 30W (Blue)', 'ZEBRONICS Ultron X1 30W (Blue) (TB-SPK-00963)
Category: Speakers

ZEBRONICS Ultron X1 30W (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-01-27 03:44:22+05:30'),
('42000000-0000-0000-0000-0000000003C4', 'ticket_history', '39000000-0000-0000-0000-0000000003C4', 'Received damaged ZEBRONICS SuperVOOC Lightweight (White)', 'Ticket: Received damaged ZEBRONICS SuperVOOC Lightweight (White)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-01-18 13:23:31+05:30'),
('42000000-0000-0000-0000-0000000003C5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-02-05 20:36:13+05:30'),
('42000000-0000-0000-0000-0000000003C6', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-04-02 22:37:38+05:30'),
('42000000-0000-0000-0000-0000000003C7', 'product', '33000000-0000-0000-0000-0000000003C7', 'Epson Pixma MG3670 WiFi (Grey)', 'Epson Pixma MG3670 WiFi (Grey) (TB-PRT-00967)
Category: Printers

Epson Pixma MG3670 WiFi (Grey) â€” a printers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Printers","tags":["product","printers"]}'::jsonb, '2026-01-12 20:02:05+05:30'),
('42000000-0000-0000-0000-0000000003C8', 'ticket_history', '39000000-0000-0000-0000-0000000003C8', 'Need help with order TB-ORD-000333', 'Ticket: Need help with order TB-ORD-000333
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2026-01-11 15:07:32+05:30'),
('42000000-0000-0000-0000-0000000003C9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-01-19 13:37:03+05:30'),
('42000000-0000-0000-0000-0000000003CA', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-12-01 14:06:21+05:30'),
('42000000-0000-0000-0000-0000000003CB', 'product', '33000000-0000-0000-0000-0000000003CB', 'Noise boAt Flex Fitness Band (Pink)', 'Noise boAt Flex Fitness Band (Pink) (TB-WRL-00971)
Category: Wearables

Noise boAt Flex Fitness Band (Pink) â€” a wearables from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Wearables","tags":["product","wearables"]}'::jsonb, '2026-04-02 16:58:27+05:30'),
('42000000-0000-0000-0000-0000000003CC', 'ticket_history', '39000000-0000-0000-0000-0000000003CC', 'Wrong item received for TB-ORD-000048', 'Ticket: Wrong item received for TB-ORD-000048
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2026-02-06 12:13:26+05:30'),
('42000000-0000-0000-0000-0000000003CD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-26 03:43:04+05:30'),
('42000000-0000-0000-0000-0000000003CE', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2024-12-03 17:55:12+05:30'),
('42000000-0000-0000-0000-0000000003CF', 'product', '33000000-0000-0000-0000-0000000003CF', 'Xiaomi Redmi Pad Pro 256GB (Silver)', 'Xiaomi Redmi Pad Pro 256GB (Silver) (TB-TAB-00975)
Category: Tablets

Xiaomi Redmi Pad Pro 256GB (Silver) â€” a tablets from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Tablets","tags":["product","tablets"]}'::jsonb, '2024-06-30 05:05:38+05:30'),
('42000000-0000-0000-0000-0000000003D0', 'ticket_history', '39000000-0000-0000-0000-0000000003D0', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2024-11-22 01:00:55+05:30'),
('42000000-0000-0000-0000-0000000003D1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-10 06:10:36+05:30'),
('42000000-0000-0000-0000-0000000003D2', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2025-09-30 22:15:29+05:30'),
('42000000-0000-0000-0000-0000000003D3', 'product', '33000000-0000-0000-0000-0000000003D3', 'Panasonic X-T50 Kit 50mm (Grey)', 'Panasonic X-T50 Kit 50mm (Grey) (TB-CAM-00979)
Category: Cameras

Panasonic X-T50 Kit 50mm (Grey) â€” a cameras from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Cameras","tags":["product","cameras"]}'::jsonb, '2024-09-06 05:18:44+05:30'),
('42000000-0000-0000-0000-0000000003D4', 'ticket_history', '39000000-0000-0000-0000-0000000003D4', 'Wrong item received', 'Ticket: Wrong item received
Category: wrong_item
Status: resolved
Resolution: Resolved: return and exchange arranged with customer.', '{"source":"support","tags":["ticket","wrong_item"]}'::jsonb, '2025-12-08 07:17:58+05:30'),
('42000000-0000-0000-0000-0000000003D5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-07-16 11:13:02+05:30'),
('42000000-0000-0000-0000-0000000003D6', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2026-05-27 03:36:52+05:30'),
('42000000-0000-0000-0000-0000000003D7', 'product', '33000000-0000-0000-0000-0000000003D7', 'Razer Zeb Max Pro Multimedia (Blue)', 'Razer Zeb Max Pro Multimedia (Blue) (TB-KBM-00983)
Category: Keyboards & Mice

Razer Zeb Max Pro Multimedia (Blue) â€” a keyboards & mice from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Keyboards & Mice","tags":["product","keyboards___mice"]}'::jsonb, '2025-02-14 14:36:15+05:30'),
('42000000-0000-0000-0000-0000000003D8', 'ticket_history', '39000000-0000-0000-0000-0000000003D8', 'Refund not received for TB-ORD-000706', 'Ticket: Refund not received for TB-ORD-000706
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-06-02 23:10:43+05:30'),
('42000000-0000-0000-0000-0000000003D9', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2024-03-07 09:54:29+05:30'),
('42000000-0000-0000-0000-0000000003DA', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-04-14 20:10:30+05:30'),
('42000000-0000-0000-0000-0000000003DB', 'product', '33000000-0000-0000-0000-0000000003DB', 'TP-Link Tapo L510E Doorbell (Silver)', 'TP-Link Tapo L510E Doorbell (Silver) (TB-SMT-00987)
Category: Smart Home

TP-Link Tapo L510E Doorbell (Silver) â€” a smart home from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for creators use.', '{"source":"catalog","category":"Smart Home","tags":["product","smart_home"]}'::jsonb, '2025-08-21 18:01:15+05:30'),
('42000000-0000-0000-0000-0000000003DC', 'ticket_history', '39000000-0000-0000-0000-0000000003DC', 'Received damaged Sony OLED evo 32" (Titanium)', 'Ticket: Received damaged Sony OLED evo 32" (Titanium)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2025-04-03 13:43:58+05:30'),
('42000000-0000-0000-0000-0000000003DD', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-02-05 07:06:14+05:30'),
('42000000-0000-0000-0000-0000000003DE', 'policy', NULL, 'Privacy Policy', 'Privacy Policy

TechBazaar collects only the data required to fulfil orders and improve service. Customer data is never sold to third parties.', '{"source":"legal","tags":["policy","privacy_policy"]}'::jsonb, '2024-10-26 02:54:57+05:30'),
('42000000-0000-0000-0000-0000000003DF', 'product', '33000000-0000-0000-0000-0000000003DF', 'Vivo Realme P1 Pro 512GB (Rose Gold)', 'Vivo Realme P1 Pro 512GB (Rose Gold) (TB-PHN-00991)
Category: Smartphones

Vivo Realme P1 Pro 512GB (Rose Gold) â€” a smartphones from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for students use.', '{"source":"catalog","category":"Smartphones","tags":["product","smartphones"]}'::jsonb, '2026-02-24 17:19:41+05:30'),
('42000000-0000-0000-0000-0000000003E0', 'ticket_history', '39000000-0000-0000-0000-0000000003E0', 'Need help with order TB-ORD-000992', 'Ticket: Need help with order TB-ORD-000992
Category: other
Status: resolved
Resolution: Resolved: shipment traced and update shared with customer.', '{"source":"support","tags":["ticket","other"]}'::jsonb, '2024-03-15 23:01:13+05:30'),
('42000000-0000-0000-0000-0000000003E1', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order on the Orders page using your order number. Real-time tracking updates are also sent over email and SMS.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2026-03-03 04:30:36+05:30'),
('42000000-0000-0000-0000-0000000003E2', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled before dispatch without any charge. Once dispatched, cancellation is treated as a return.', '{"source":"legal","tags":["policy","cancellation_policy"]}'::jsonb, '2025-06-07 06:56:57+05:30'),
('42000000-0000-0000-0000-0000000003E3', 'product', '33000000-0000-0000-0000-0000000003E3', 'OnePlus Noise ColorFit Pro 5 GPS (Black)', 'OnePlus Noise ColorFit Pro 5 GPS (Black) (TB-WAT-00995)
Category: Smartwatches

OnePlus Noise ColorFit Pro 5 GPS (Black) â€” a smartwatches from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for gaming use.', '{"source":"catalog","category":"Smartwatches","tags":["product","smartwatches"]}'::jsonb, '2025-02-14 23:35:55+05:30'),
('42000000-0000-0000-0000-0000000003E4', 'ticket_history', '39000000-0000-0000-0000-0000000003E4', 'Refund not received', 'Ticket: Refund not received
Category: refund
Status: resolved
Resolution: Resolved: refund initiated with customer.', '{"source":"support","tags":["ticket","refund"]}'::jsonb, '2025-06-29 09:56:05+05:30'),
('42000000-0000-0000-0000-0000000003E5', 'faq', NULL, 'FAQ: Can I change my shipping address after ordering?', 'Q: Can I change my shipping address after ordering?
A: Yes â€” address changes are allowed as long as the order has not been dispatched. Contact support for assistance.', '{"source":"support","tags":["faq","customer-service"]}'::jsonb, '2025-04-11 22:44:53+05:30'),
('42000000-0000-0000-0000-0000000003E6', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are shipped from our fulfillment centers in 24 hours. Standard delivery is 2-7 days depending on location. Shipping is free above â‚¹999, otherwise a â‚¹49 fee applies.', '{"source":"legal","tags":["policy","shipping_policy"]}'::jsonb, '2025-06-11 11:19:45+05:30'),
('42000000-0000-0000-0000-0000000003E7', 'product', '33000000-0000-0000-0000-0000000003E7', 'Ultron Emberton II Wireless (Blue)', 'Ultron Emberton II Wireless (Blue) (TB-SPK-00999)
Category: Speakers

Ultron Emberton II Wireless (Blue) â€” a speakers from the TechBazaar catalog. Built for everyday performance with reliable quality, backed by standard TechBazaar warranty and doorstep delivery across India. Ideal for home use.', '{"source":"catalog","category":"Speakers","tags":["product","speakers"]}'::jsonb, '2026-06-28 17:43:57+05:30'),
('42000000-0000-0000-0000-0000000003E8', 'ticket_history', '39000000-0000-0000-0000-0000000003E8', 'Received damaged TP-Link Archer C80 Mesh (White)', 'Ticket: Received damaged TP-Link Archer C80 Mesh (White)
Category: defective
Status: resolved
Resolution: Resolved: replacement issued with customer.', '{"source":"support","tags":["ticket","defective"]}'::jsonb, '2024-10-15 08:11:07+05:30')
ON CONFLICT (kb_id) DO NOTHING;
