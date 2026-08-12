-- ============================================================================
-- 007 - Notifications table
-- Depends on: 001
-- ============================================================================

CREATE TABLE IF NOT EXISTS notifications (
    notification_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title           VARCHAR(255) NOT NULL,
    message         TEXT NOT NULL,
    type            VARCHAR(20) NOT NULL DEFAULT 'info',
    is_read         BOOLEAN NOT NULL DEFAULT FALSE,
    reference_id    UUID,
    reference_type  VARCHAR(50),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

DROP TRIGGER IF EXISTS trg_notifications_updated ON notifications;
CREATE TRIGGER trg_notifications_updated BEFORE UPDATE ON notifications
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Seed notifications derived from agent_task_log events
INSERT INTO notifications (title, message, type, is_read, reference_type, created_at) VALUES
('New Order Received', 'Order has been placed and is pending confirmation.', 'order', FALSE, 'order', now() - interval '5 minutes'),
('Low Stock Alert', 'Product inventory has fallen below reorder point.', 'warning', FALSE, 'inventory', now() - interval '15 minutes'),
('Agent Task Completed', 'Pricing Agent has completed a batch price update.', 'agent', FALSE, 'agent_task_log', now() - interval '30 minutes'),
('Shipment Delivered', 'Order has been successfully delivered to the customer.', 'success', TRUE, 'shipment', now() - interval '1 hour'),
('System Update', 'Platform maintenance scheduled for tonight at 2:00 AM EST.', 'system', TRUE, NULL, now() - interval '2 hours'),
('Campaign Performance', 'Marketing campaign has exceeded performance targets.', 'success', TRUE, 'campaign', now() - interval '3 hours'),
('New Order Received', 'Express shipping order placed by premium customer.', 'order', FALSE, 'order', now() - interval '4 hours'),
('Price Anomaly Detected', 'Competitor price drop detected for 3 products.', 'warning', FALSE, 'competitor_prices', now() - interval '45 minutes'),
('Support Ticket Escalated', 'Customer complaint escalated to human review.', 'warning', FALSE, 'support_ticket', now() - interval '20 minutes'),
('Inventory Restocked', 'Purchase order PO-001 has been received at warehouse.', 'success', TRUE, 'purchase_order', now() - interval '6 hours'),
('Agent Error', 'Support Agent encountered a timeout on ticket processing.', 'warning', FALSE, 'agent_task_log', now() - interval '10 minutes'),
('New Campaign Draft', 'Marketing Agent created a new campaign draft for review.', 'agent', FALSE, 'campaign', now() - interval '25 minutes'),
('Delivery Delay', 'Shipment SHP-004 is delayed due to carrier issue.', 'warning', FALSE, 'shipment', now() - interval '35 minutes'),
('Refund Processed', 'Customer refund of $49.99 has been automatically approved.', 'success', TRUE, 'order', now() - interval '8 hours'),
('Stock Forecast Alert', 'Inventory Agent predicts stockout for 2 products within 7 days.', 'warning', FALSE, 'inventory', now() - interval '50 minutes'),
('Order Cancelled', 'Customer has cancelled order ORD-1230.', 'order', TRUE, 'order', now() - interval '10 hours'),
('Agent Performance', 'All 6 agents operating above 97% accuracy threshold.', 'success', TRUE, 'agent_task_log', now() - interval '12 hours'),
('New Support Ticket', 'Customer reported wrong item delivered.', 'order', FALSE, 'support_ticket', now() - interval '8 minutes'),
('Price Update Applied', 'Dynamic pricing adjusted 8 product prices based on demand.', 'agent', FALSE, 'price_history', now() - interval '40 minutes'),
('Shipment In Transit', 'Package has left the distribution center.', 'success', TRUE, 'shipment', now() - interval '2 hours'),
('Low Stock Critical', 'Product SKU inventory at 0 units - immediate restock needed.', 'warning', FALSE, 'inventory', now() - interval '3 minutes'),
('Campaign Launched', 'Summer Sale email campaign sent to 15,000 subscribers.', 'agent', FALSE, 'campaign', now() - interval '1 hour'),
('Payment Received', 'Payment of $234.50 confirmed for recent order.', 'success', TRUE, 'order', now() - interval '5 hours'),
('Agent Task Failed', 'Logistics Agent unable to generate shipping label.', 'warning', FALSE, 'agent_task_log', now() - interval '15 minutes'),
('New Customer Registration', 'New customer account created via storefront.', 'order', TRUE, 'customer', now() - interval '7 hours'),
('Inventory Discrepancy', 'Automated reconciliation found stock count mismatch.', 'warning', FALSE, 'inventory', now() - interval '55 minutes'),
('Carrier Rate Change', 'FedEx updated shipping rates for Zone 3.', 'system', TRUE, NULL, now() - interval '14 hours'),
('Support Ticket Resolved', 'AI Agent successfully resolved customer FAQ ticket.', 'success', TRUE, 'support_ticket', now() - interval '3 hours'),
('Price Increase Alert', 'Competitor raised prices on 5 matching products.', 'warning', FALSE, 'competitor_prices', now() - interval '20 minutes'),
('Order Shipped', 'Order has been picked up by carrier for delivery.', 'success', TRUE, 'shipment', now() - interval '4 hours'),
('Agent Uptime Warning', 'Support Agent response time above average threshold.', 'warning', FALSE, 'agent_task_log', now() - interval '12 minutes'),
('New Review Submitted', 'Customer left a 5-star review on recent purchase.', 'success', TRUE, 'order', now() - interval '9 hours'),
('Bulk Price Update', 'Pricing Agent adjusted 25 product prices for weekend sale.', 'agent', FALSE, 'price_history', now() - interval '45 minutes'),
('Warehouse Capacity', 'Warehouse 3 approaching 90% storage capacity.', 'warning', FALSE, 'inventory', now() - interval '2 hours'),
('Agent Task Completed', 'Inventory Agent generated 3 purchase orders automatically.', 'agent', FALSE, 'agent_task_log', now() - interval '30 minutes'),
('Customer Complaint', 'Customer reported damaged item on recent delivery.', 'warning', FALSE, 'support_ticket', now() - interval '6 minutes'),
('Stock Replenished', 'Automated reorder placed for 5 low-stock products.', 'success', TRUE, 'inventory', now() - interval '8 hours'),
('Campaign Ended', 'Winter Promotion campaign has concluded.', 'system', TRUE, 'campaign', now() - interval '16 hours'),
('New Order Received', 'Bulk order of 12 items placed by corporate customer.', 'order', FALSE, 'order', now() - interval '2 minutes'),
('Delivery Attempt Failed', 'Carrier unable to deliver - customer not available.', 'warning', FALSE, 'shipment', now() - interval '18 minutes'),
('Agent Configuration Updated', 'Support Agent confidence threshold raised to 0.85.', 'system', TRUE, 'agent_config', now() - interval '20 hours'),
('Refund Requested', 'Customer requesting partial refund for damaged item.', 'warning', FALSE, 'order', now() - interval '28 minutes'),
('Inventory Count Complete', 'Weekly physical inventory count completed successfully.', 'success', TRUE, 'inventory', now() - interval '1 day'),
('Agent Cost Alert', 'LLM API costs for Pricing Agent exceeded daily budget.', 'warning', FALSE, 'agent_task_log', now() - interval '35 minutes'),
('New Supplier Added', 'New electronics supplier registered in the system.', 'agent', TRUE, 'supplier', now() - interval '2 days'),
('Order Processing', 'Order is being prepared for shipment.', 'success', TRUE, 'order', now() - interval '6 hours'),
('Marketing Content Approved', 'Summer banner creative has been approved for launch.', 'success', TRUE, 'campaign', now() - interval '1 day'),
('Competitor Out of Stock', 'Key competitor shows out-of-stock on 2 matched products.', 'warning', FALSE, 'competitor_prices', now() - interval '42 minutes'),
('System Backup Complete', 'Daily database backup completed successfully.', 'success', TRUE, NULL, now() - interval '1 day'),
('Agent Learning Update', 'Support Agent knowledge base updated with 15 new articles.', 'agent', TRUE, 'knowledge_base', now() - interval '3 days')
ON CONFLICT DO NOTHING;
