-- ============================================================================
-- 009 - Fix broken updated_at triggers
-- Depends on: 003, 007
--
-- `trg_purchase_orders_updated` (003_schema_transactional.sql) and
-- `trg_notifications_updated` (007_notifications.sql) both call
-- set_updated_at() BEFORE UPDATE, but neither `purchase_orders` nor
-- `notifications` actually has an `updated_at` column. Any UPDATE to either
-- table currently fails with: record "new" has no field "updated_at".
-- This was discovered when wiring the review-queue approve/reject cascade,
-- which needs to UPDATE purchase_orders.status. Drop the dead triggers
-- rather than add an unused column neither table's app code reads.
-- ============================================================================

DROP TRIGGER IF EXISTS trg_purchase_orders_updated ON purchase_orders;
DROP TRIGGER IF EXISTS trg_notifications_updated ON notifications;
