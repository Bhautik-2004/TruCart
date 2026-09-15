-- ============================================================================
-- 017 - AI Enhancements: ticket sentiment analysis + AI-generated reports
-- Depends on: 004
--
-- Adds:
--   * support_tickets.sentiment_* columns - written by
--     agents.support.analyze_ticket_sentiment / bulk_sentiment_analysis.
--   * ai_reports - one row per AI-generated report (backend/agents/reports.py).
-- ============================================================================

ALTER TABLE support_tickets
    ADD COLUMN IF NOT EXISTS sentiment_label      VARCHAR(10),   -- positive | neutral | negative
    ADD COLUMN IF NOT EXISTS sentiment_score       DECIMAL(3,2), -- -1.00 (very negative) .. 1.00 (very positive)
    ADD COLUMN IF NOT EXISTS sentiment_summary     TEXT,
    ADD COLUMN IF NOT EXISTS sentiment_analyzed_at TIMESTAMPTZ;

CREATE TABLE IF NOT EXISTS ai_reports (
    report_id       UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    period          VARCHAR(20)   NOT NULL,   -- today | week | month
    focus           VARCHAR(200),
    title           VARCHAR(200)  NOT NULL,
    content_md      TEXT          NOT NULL,
    model_used      VARCHAR(50),
    correlation_id  UUID,
    created_at      TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_ai_reports_created ON ai_reports (created_at DESC);

ALTER TABLE ai_reports ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS ai_reports_staff_all ON ai_reports;
CREATE POLICY ai_reports_staff_all ON ai_reports FOR ALL TO authenticated
    USING (is_staff())
    WITH CHECK (is_staff());
