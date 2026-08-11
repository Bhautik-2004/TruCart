-- ============================================================================
-- 003 - Transactional tables
-- Depends on: 001, 002
-- ============================================================================

CREATE TABLE IF NOT EXISTS inventory (
    inventory_id       UUID  PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id         UUID  NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    warehouse_id       UUID  NOT NULL REFERENCES warehouses(warehouse_id) ON DELETE CASCADE,
    quantity_on_hand   INT   NOT NULL DEFAULT 0 CHECK (quantity_on_hand >= 0),
    quantity_reserved  INT   NOT NULL DEFAULT 0 CHECK (quantity_reserved >= 0),
    quantity_available INT   GENERATED ALWAYS AS (quantity_on_hand - quantity_reserved) STORED,
    reorder_point      INT   NOT NULL DEFAULT 10,
    reorder_quantity   INT   NOT NULL DEFAULT 50,
    last_restock_date  DATE,
    updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_inventory_product_warehouse UNIQUE (product_id, warehouse_id)
);
DROP TRIGGER IF EXISTS trg_inventory_updated ON inventory;
CREATE TRIGGER trg_inventory_updated BEFORE UPDATE ON inventory
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS orders (
    order_id            UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id         UUID          NOT NULL REFERENCES customers(customer_id),
    order_number        VARCHAR(50)   NOT NULL UNIQUE,
    status              VARCHAR(30)   NOT NULL DEFAULT 'pending',
    total_amount        DECIMAL(12,2) NOT NULL DEFAULT 0 CHECK (total_amount >= 0),
    currency            VARCHAR(3)    NOT NULL DEFAULT 'INR',
    shipping_address_id UUID          REFERENCES addresses(address_id),
    payment_method      VARCHAR(50),
    payment_status      VARCHAR(20)   NOT NULL DEFAULT 'pending',
    placed_at           TIMESTAMPTZ   NOT NULL DEFAULT now(),
    confirmed_at        TIMESTAMPTZ,
    shipped_at          TIMESTAMPTZ,
    delivered_at        TIMESTAMPTZ,
    created_at          TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at          TIMESTAMPTZ   NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_orders_updated ON orders;
CREATE TRIGGER trg_orders_updated BEFORE UPDATE ON orders
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id      UUID           NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id    UUID           NOT NULL REFERENCES products(product_id),
    quantity      INT            NOT NULL CHECK (quantity > 0),
    unit_price    DECIMAL(10,2)  NOT NULL CHECK (unit_price >= 0),
    total_price   DECIMAL(12,2)  GENERATED ALWAYS AS (quantity * unit_price) STORED,
    status        VARCHAR(30)    NOT NULL DEFAULT 'pending',
    created_at    TIMESTAMPTZ    NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS shipments (
    shipment_id        UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id           UUID          NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    carrier            VARCHAR(50),
    tracking_number    VARCHAR(100),
    shipping_cost      DECIMAL(10,2),
    status             VARCHAR(30)   NOT NULL DEFAULT 'label_created',
    shipped_at         TIMESTAMPTZ,
    delivered_at       TIMESTAMPTZ,
    estimated_delivery DATE,
    created_at         TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at         TIMESTAMPTZ   NOT NULL DEFAULT now()
);
DROP TRIGGER IF EXISTS trg_shipments_updated ON shipments;
CREATE TRIGGER trg_shipments_updated BEFORE UPDATE ON shipments
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS purchase_orders (
    po_id            UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    po_number        VARCHAR(50)    NOT NULL UNIQUE,
    supplier_id      UUID           NOT NULL REFERENCES suppliers(supplier_id),
    product_id       UUID           NOT NULL REFERENCES products(product_id),
    quantity         INT            NOT NULL CHECK (quantity > 0),
    unit_cost        DECIMAL(10,2)  NOT NULL CHECK (unit_cost >= 0),
    total_cost       DECIMAL(12,2)  GENERATED ALWAYS AS (quantity * unit_cost) STORED,
    status           VARCHAR(30)    NOT NULL DEFAULT 'draft',
    created_by_agent VARCHAR(50)    NOT NULL DEFAULT 'inventory_agent',
    approved_by      UUID           REFERENCES users(user_id),
    created_at       TIMESTAMPTZ    NOT NULL DEFAULT now(),
    approved_at      TIMESTAMPTZ,
    expected_delivery DATE
);
DROP TRIGGER IF EXISTS trg_purchase_orders_updated ON purchase_orders;
CREATE TRIGGER trg_purchase_orders_updated BEFORE UPDATE ON purchase_orders
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();