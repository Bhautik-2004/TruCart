-- ============================================================================
-- 004 - Operational, marketing & RAG tables
-- Depends on: 001, 002, 003
-- ============================================================================

CREATE TABLE IF NOT EXISTS support_tickets (
    ticket_id          UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id        UUID           REFERENCES customers(customer_id),
    order_id           UUID           REFERENCES orders(order_id),
    subject            VARCHAR(500),
    description        TEXT,
    category           VARCHAR(50),
    priority           VARCHAR(10)    NOT NULL DEFAULT 'normal',
    status             VARCHAR(30)    NOT NULL DEFAULT 'open',
    assigned_to_agent  VARCHAR(50)    NOT NULL DEFAULT 'support_agent',
    resolution         TEXT,
    confidence_score   DECIMAL(3,2)   CHECK (confidence_score >= 0 AND confidence_score <= 1),
    created_at         TIMESTAMPTZ    NOT NULL DEFAULT now(),
    resolved_at        TIMESTAMPTZ,
    updated_at         TIMESTAMPTZ    NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_support_tickets_updated ON support_tickets;
CREATE TRIGGER trg_support_tickets_updated BEFORE UPDATE ON support_tickets
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS ticket_messages (
    message_id       UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
    ticket_id        UUID         NOT NULL REFERENCES support_tickets(ticket_id) ON DELETE CASCADE,
    sender_type      VARCHAR(20)  NOT NULL,
    message_content  TEXT         NOT NULL,
    metadata         JSONB,
    created_at       TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS price_history (
    history_id       UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id       UUID           NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    old_price        DECIMAL(10,2),
    new_price        DECIMAL(10,2),
    change_reason    VARCHAR(200),
    changed_by       VARCHAR(50)    NOT NULL DEFAULT 'pricing_agent',
    competitor_price DECIMAL(10,2),
    margin_pct       DECIMAL(5,2),
    created_at       TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS competitor_prices (
    comp_price_id    UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id       UUID           NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    competitor_name  VARCHAR(100),
    competitor_price DECIMAL(10,2),
    competitor_url   TEXT,
    detected_at      TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS campaigns (
    campaign_id       UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    name              VARCHAR(255)   NOT NULL,
    type              VARCHAR(50),
    segment           VARCHAR(100),
    status            VARCHAR(30)    NOT NULL DEFAULT 'draft',
    content_subject   TEXT,
    content_body      TEXT,
    budget            DECIMAL(10,2)  NOT NULL DEFAULT 0,
    spent             DECIMAL(10,2)  NOT NULL DEFAULT 0,
    created_by_agent  VARCHAR(50)    NOT NULL DEFAULT 'marketing_agent',
    approved_by       UUID           REFERENCES users(user_id),
    scheduled_at      TIMESTAMPTZ,
    sent_at           TIMESTAMPTZ,
    created_at        TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS campaign_metrics (
    metric_id           UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    campaign_id         UUID           NOT NULL REFERENCES campaigns(campaign_id) ON DELETE CASCADE,
    recipients          INT            NOT NULL DEFAULT 0,
    opened              INT            NOT NULL DEFAULT 0,
    clicked             INT            NOT NULL DEFAULT 0,
    converted           INT            NOT NULL DEFAULT 0,
    revenue_attributed  DECIMAL(12,2)  NOT NULL DEFAULT 0,
    recorded_at         TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS agent_task_log (
    log_id           UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_name       VARCHAR(50)    NOT NULL,
    task_type        VARCHAR(100)   NOT NULL,
    status           VARCHAR(30)    NOT NULL,
    input_data       JSONB,
    output_data      JSONB,
    model_used       VARCHAR(50),
    tokens_used      INT,
    cost_usd         DECIMAL(10,4)  NOT NULL DEFAULT 0,
    correlation_id   UUID,
    human_approved   BOOLEAN        NOT NULL DEFAULT FALSE,
    created_at       TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS agent_config (
    config_id    UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_name   VARCHAR(50)    NOT NULL,
    config_key   VARCHAR(100)   NOT NULL,
    config_value JSONB,
    updated_at   TIMESTAMPTZ    NOT NULL DEFAULT now(),
    CONSTRAINT uq_agent_config UNIQUE (agent_name, config_key)
);
DROP TRIGGER IF EXISTS trg_agent_config_updated ON agent_config;
CREATE TRIGGER trg_agent_config_updated BEFORE UPDATE ON agent_config
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS review_queue (
    review_id     UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    item_type     VARCHAR(30)   NOT NULL,
    reference_id  UUID          NOT NULL,
    agent_name    VARCHAR(50)   NOT NULL,
    summary       TEXT          NOT NULL,
    payload       JSONB,
    status        VARCHAR(20)   NOT NULL DEFAULT 'pending',
    reviewed_by   UUID          REFERENCES users(user_id),
    review_note   TEXT,
    created_at    TIMESTAMPTZ   NOT NULL DEFAULT now(),
    reviewed_at   TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS knowledge_base (
    kb_id          UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    doc_type       VARCHAR(30)    NOT NULL,
    reference_id   UUID,
    title          VARCHAR(255),
    content        TEXT           NOT NULL,
    embedding      vector(768),
    metadata       JSONB,
    created_at     TIMESTAMPTZ    NOT NULL DEFAULT now()
);

-- HNSW index for fast vector similarity search (cosine).
CREATE INDEX IF NOT EXISTS idx_knowledge_base_embedding_hnsw
    ON knowledge_base USING hnsw (embedding vector_cosine_ops);