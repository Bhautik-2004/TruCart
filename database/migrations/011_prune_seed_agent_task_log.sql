-- ============================================================================
-- 011 - Prune fabricated agent_task_log seed rows
-- Depends on: 004, seed_data/19_agent_task_log.sql
--
-- The generated audit-trail seed references 'refund_agent', which does not
-- exist in the codebase. A reviewer filtering the audit log by agent would see
-- a phantom agent. Keep only rows for agents that actually run. (Real runs will
-- repopulate this table.)
-- ============================================================================

DELETE FROM agent_task_log
WHERE agent_name NOT IN (
    'inventory_agent', 'pricing_agent', 'support_agent',
    'order_agent', 'marketing_agent', 'logistics_agent', 'orchestrator'
);
