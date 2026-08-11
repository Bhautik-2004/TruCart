-- ============================================================================
-- 002 - Foundation tables
-- Depends on: 001
-- ============================================================================

CREATE TABLE IF NOT EXISTS store_config (
    config_key   VARCHAR(100) PRIMARY KEY,
    config_value JSONB        NOT NULL,
    description  TEXT,
    updated_at   TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS users (
    user_id       UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
    auth_user_id  UUID         UNIQUE REFERENCES auth.users(id),
    email         VARCHAR(255) NOT NULL UNIQUE,
    full_name     VARCHAR(255) NOT NULL,
    password_hash TEXT         NOT NULL,
    role          VARCHAR(20)  NOT NULL DEFAULT 'admin',
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at    TIMESTAMPTZ  NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_users_updated ON users;
CREATE TRIGGER trg_users_updated BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS customers (
    customer_id   UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    auth_user_id  UUID          UNIQUE REFERENCES auth.users(id),
    email         VARCHAR(255)  NOT NULL UNIQUE,
    full_name     VARCHAR(255)  NOT NULL,
    phone         VARCHAR(20),
    segment       VARCHAR(50)   NOT NULL DEFAULT 'standard',
    lifetime_value DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_orders  INT           NOT NULL DEFAULT 0,
    created_at    TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at    TIMESTAMPTZ   NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_customers_updated ON customers;
CREATE TRIGGER trg_customers_updated BEFORE UPDATE ON customers
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS addresses (
    address_id   UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id  UUID         NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    line1        TEXT         NOT NULL,
    line2        TEXT,
    city         VARCHAR(100) NOT NULL,
    state        VARCHAR(100),
    postal_code  VARCHAR(20),
    country      VARCHAR(2)   NOT NULL DEFAULT 'IN',
    is_default   BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at   TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS warehouses (
    warehouse_id UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
    name         VARCHAR(255) NOT NULL,
    location     VARCHAR(255),
    region       VARCHAR(50),
    is_active    BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at   TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id    UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    name           VARCHAR(255)   NOT NULL,
    contact_email  VARCHAR(255),
    contact_phone  VARCHAR(20),
    lead_time_days INT            NOT NULL DEFAULT 7,
    rating         DECIMAL(2,1)   NOT NULL DEFAULT 5.0,
    is_active      BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at     TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS products (
    product_id    UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    sku           VARCHAR(100)  NOT NULL UNIQUE,
    name          VARCHAR(255)  NOT NULL,
    description   TEXT,
    category      VARCHAR(100),
    base_price    DECIMAL(10,2) NOT NULL CHECK (base_price >= 0),
    current_price DECIMAL(10,2) NOT NULL CHECK (current_price >= 0),
    cost_price    DECIMAL(10,2) NOT NULL CHECK (cost_price >= 0),
    weight_kg     DECIMAL(8,3),
    status        VARCHAR(20)   NOT NULL DEFAULT 'active',
    created_at    TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at    TIMESTAMPTZ   NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_products_updated ON products;
CREATE TRIGGER trg_products_updated BEFORE UPDATE ON products
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();