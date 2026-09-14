-- knowledge_base (18 rows) — FAQ/policy articles for support-agent RAG.
-- Embeddings are filled in at runtime by backend/scripts/backfill_kb_embeddings.py.
-- ----------------------------------------------------------------------------
INSERT INTO knowledge_base (kb_id, doc_type, reference_id, title, content, metadata, created_at) VALUES
('42000000-0000-0000-0000-000000000001', 'faq', NULL, 'FAQ: How do I track my order?', 'Q: How do I track my order?
A: You can track your order from the Orders page using your order number. Real-time tracking updates are also sent by email.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-05-14 15:07:29+05:30'),
('42000000-0000-0000-0000-000000000002', 'policy', NULL, 'Shipping Policy', 'Shipping Policy

Orders are dispatched within 24-48 hours. Standard delivery takes 3-7 business days depending on your location. Free shipping is available above the zone threshold.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2025-09-10 02:03:05+05:30'),
('42000000-0000-0000-0000-000000000003', 'policy', NULL, 'Return & Refund Policy', 'Return & Refund Policy

Items can be returned within 7 days of delivery if unused and in original packaging. Refunds are processed to the original payment method within 5-7 business days of approval.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2026-01-22 22:55:25+05:30'),
('42000000-0000-0000-0000-000000000004', 'policy', NULL, 'Cancellation Policy', 'Cancellation Policy

Orders can be cancelled free of charge before they are shipped. Once shipped, the order must be returned after delivery instead of cancelled.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2025-10-25 14:21:52+05:30'),
('42000000-0000-0000-0000-000000000005', 'faq', NULL, 'FAQ: What payment methods are accepted?', 'Q: What payment methods are accepted?
A: We accept UPI, major debit/credit cards, net banking, and Cash on Delivery (COD) on eligible orders.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-05-27 16:41:48+05:30'),
('42000000-0000-0000-0000-000000000006', 'policy', NULL, 'Warranty Policy', 'Warranty Policy

All electronics come with a standard 1-year manufacturer warranty unless stated otherwise on the product page. Warranty claims are handled directly with the manufacturer''s service centre.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2026-02-28 04:48:54+05:30'),
('42000000-0000-0000-0000-000000000007', 'faq', NULL, 'FAQ: How do I request a refund?', 'Q: How do I request a refund?
A: Raise a support ticket referencing your order number. Approved refunds for amounts up to the auto-approval limit are processed automatically; larger refunds are reviewed by our team.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2026-01-29 16:15:59+05:30'),
('42000000-0000-0000-0000-000000000008', 'faq', NULL, 'FAQ: My item arrived damaged, what do I do?', 'Q: My item arrived damaged, what do I do?
A: Please raise a support ticket with photos of the damage within 48 hours of delivery. We will arrange a replacement or refund.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-07-31 02:02:59+05:30'),
('42000000-0000-0000-0000-000000000009', 'policy', NULL, 'Exchange Policy', 'Exchange Policy

Products can be exchanged for a different size/colour variant within 7 days of delivery, subject to availability, at no extra shipping cost.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2025-07-21 14:46:07+05:30'),
('42000000-0000-0000-0000-00000000000a', 'faq', NULL, 'FAQ: Do you offer EMI options?', 'Q: Do you offer EMI options?
A: No-cost EMI is available on select cards for orders above ₹3,000. The EMI option appears at checkout when eligible.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-09-22 13:34:14+05:30'),
('42000000-0000-0000-0000-00000000000b', 'faq', NULL, 'FAQ: How do I get a GST invoice?', 'Q: How do I get a GST invoice?
A: A GST invoice is automatically generated and emailed after your order is confirmed. You can also download it from the order details page.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-07-14 16:11:35+05:30'),
('42000000-0000-0000-0000-00000000000c', 'policy', NULL, 'Late Delivery Policy', 'Late Delivery Policy

If your order is more than 3 days past its estimated delivery date, please contact support — we will investigate with the carrier and offer a resolution.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2025-08-23 08:32:22+05:30'),
('42000000-0000-0000-0000-00000000000d', 'faq', NULL, 'FAQ: Can I change my delivery address after placing an order?', 'Q: Can I change my delivery address after placing an order?
A: Address changes are possible only before the order is shipped. Contact support as soon as possible with the updated address.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-09-15 20:01:24+05:30'),
('42000000-0000-0000-0000-00000000000e', 'policy', NULL, 'Wrong Item Received Policy', 'Wrong Item Received Policy

If you receive an incorrect item, we will arrange a free pickup of the wrong item and dispatch the correct one at no extra cost.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2025-11-24 19:17:10+05:30'),
('42000000-0000-0000-0000-00000000000f', 'faq', NULL, 'FAQ: What is Cash on Delivery (COD) and where is it available?', 'Q: What is Cash on Delivery (COD) and where is it available?
A: COD lets you pay in cash when the order is delivered. It is available for most pin codes, subject to order value limits shown at checkout.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2025-10-03 03:58:40+05:30'),
('42000000-0000-0000-0000-000000000010', 'policy', NULL, 'Data Privacy Policy', 'Data Privacy Policy

Customer data is used only to process orders, provide support, and improve our service. We do not sell personal data to third parties.', '{"source": "support", "tags": ["policy", "customer-service"]}'::jsonb, '2026-01-09 02:49:43+05:30'),
('42000000-0000-0000-0000-000000000011', 'faq', NULL, 'FAQ: How long does a refund take to reflect in my account?', 'Q: How long does a refund take to reflect in my account?
A: Approved refunds are processed within 5-7 business days, though your bank may take a few additional days to reflect the credit.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2026-02-05 05:05:43+05:30'),
('42000000-0000-0000-0000-000000000012', 'faq', NULL, 'FAQ: Do you deliver internationally?', 'Q: Do you deliver internationally?
A: We currently deliver only within India. International shipping is not supported at this time.', '{"source": "support", "tags": ["faq", "customer-service"]}'::jsonb, '2026-02-04 20:58:07+05:30')
ON CONFLICT (kb_id) DO NOTHING;
