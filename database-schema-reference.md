# Database Schema Reference
## AI-Powered Autonomous E-Commerce Operations Platform

> **Purpose of this document:** Understand every table, column, data type, and its role *before* you run `schema.sql`. Read this first, then create the database.

**Database:** PostgreSQL (with `pgvector` extension for RAG embeddings)
**Primary key convention:** All tables use `UUID` generated via `gen_random_uuid()`
**Timestamp convention:** All timestamps use `TIMESTAMPTZ` (timezone-aware)

---

## Table of Contents

1. [store_config](#1-store_config)
2. [users](#2-users)
3. [customers](#3-customers)
4. [addresses](#4-addresses)
5. [warehouses](#5-warehouses)
6. [suppliers](#6-suppliers)
7. [products](#7-products)
8. [inventory](#8-inventory)
9. [orders](#9-orders)
10. [order_items](#10-order_items)
11. [shipments](#11-shipments)
12. [purchase_orders](#12-purchase_orders)
13. [support_tickets](#13-support_tickets)
14. [ticket_messages](#14-ticket_messages)
15. [price_history](#15-price_history)
16. [competitor_prices](#16-competitor_prices)
17. [campaigns](#17-campaigns)
18. [campaign_metrics](#18-campaign_metrics)
19. [agent_task_log](#19-agent_task_log)
20. [agent_config](#20-agent_config)
21. [review_queue](#21-review_queue)
22. [knowledge_base](#22-knowledge_base)
23. [LangGraph Checkpoint Tables (auto-created)](#23-langgraph-checkpoint-tables-auto-created)
24. [Entity Relationship Overview](#24-entity-relationship-overview)

---

## 1. store_config

**Purpose:** Holds store-specific settings as data (not hardcoded in agent code). This is what keeps the platform "store-agnostic" — swapping stores means changing rows here, not rewriting agents.

| Column | Data Type | Explanation |
|---|---|---|
| `config_key` | `VARCHAR(100)` **PK** | The setting's name, e.g. `store_name`, `po_auto_approve_limit`. Primary key — each key exists once. |
| `config_value` | `JSONB` | The setting's value, stored as JSON so it can hold strings, numbers, arrays, or objects (e.g. `"INR"`, `5000`, `["Audio","Mobile"]`). |
| `description` | `TEXT` | Human-readable note explaining what this setting controls. Optional. |
| `updated_at` | `TIMESTAMPTZ` | When this setting was last changed. |

**Example rows:** `store_name → "TechBazaar"`, `po_auto_approve_limit → 5000`, `refund_auto_approve_limit → 100`, `price_change_max_pct → 15`.

---

## 2. users

**Purpose:** Admin/staff accounts — the humans who log into the dashboard and approve or reject agent actions in the review queue.

| Column | Data Type | Explanation |
|---|---|---|
| `user_id` | `UUID` **PK** | Unique identifier for the user. |
| `email` | `VARCHAR(255)` **UNIQUE, NOT NULL** | Login email. Must be unique across all users. |
| `full_name` | `VARCHAR(255)` **NOT NULL** | Display name shown in the dashboard. |
| `password_hash` | `TEXT` **NOT NULL** | Hashed password (never store plaintext). |
| `role` | `VARCHAR(20)` **DEFAULT 'admin'** | Either `admin` (full access) or `reviewer` (can only approve/reject review queue items). |
| `is_active` | `BOOLEAN` **DEFAULT TRUE** | Set to `FALSE` to disable a user without deleting their record. |
| `created_at` | `TIMESTAMPTZ` | Account creation timestamp. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated whenever the row changes (via trigger). |

---

## 3. customers

**Purpose:** The people who shop on the platform. Every order, ticket, and address links back to a customer.

| Column | Data Type | Explanation |
|---|---|---|
| `customer_id` | `UUID` **PK** | Unique identifier for the customer. |
| `email` | `VARCHAR(255)` **UNIQUE, NOT NULL** | Customer's email — also used to contact them for order/support updates. |
| `full_name` | `VARCHAR(255)` **NOT NULL** | Customer's display name. |
| `phone` | `VARCHAR(20)` | Contact number, optional. |
| `segment` | `VARCHAR(50)` **DEFAULT 'standard'** | Marketing/behavior classification: `standard`, `regular`, `vip`, or `at_risk`. Used by the MarketingAgent to target campaigns. |
| `lifetime_value` | `DECIMAL(12,2)` **DEFAULT 0** | Total amount this customer has spent historically. Updated as orders complete. |
| `total_orders` | `INT` **DEFAULT 0** | Count of orders placed. Used to derive segment (e.g., 10+ orders → `vip`). |
| `created_at` | `TIMESTAMPTZ` | When the customer record was created. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated on any change. |

---

## 4. addresses

**Purpose:** Shipping/billing addresses for customers. A customer can have multiple addresses; orders reference one.

| Column | Data Type | Explanation |
|---|---|---|
| `address_id` | `UUID` **PK** | Unique identifier for the address. |
| `customer_id` | `UUID` **FK → customers** | Which customer this address belongs to. Deleting the customer deletes their addresses (`ON DELETE CASCADE`). |
| `line1` | `TEXT` **NOT NULL** | Street address line 1. |
| `line2` | `TEXT` | Apartment/suite/floor, optional. |
| `city` | `VARCHAR(100)` **NOT NULL** | City name. |
| `state` | `VARCHAR(100)` | State/province. |
| `postal_code` | `VARCHAR(20)` | PIN/ZIP code — used by LogisticsAgent for carrier rate lookups. |
| `country` | `VARCHAR(2)` **DEFAULT 'IN'** | 2-letter country code. |
| `is_default` | `BOOLEAN` **DEFAULT FALSE** | Marks the customer's primary address. |
| `created_at` | `TIMESTAMPTZ` | When the address was added. |

---

## 5. warehouses

**Purpose:** Physical fulfillment locations. Inventory is tracked per-warehouse, and LogisticsAgent picks the nearest warehouse to fulfill an order from.

| Column | Data Type | Explanation |
|---|---|---|
| `warehouse_id` | `UUID` **PK** | Unique identifier for the warehouse. |
| `name` | `VARCHAR(255)` **NOT NULL** | Display name, e.g. "Mumbai Hub". |
| `location` | `VARCHAR(255)` | Human-readable location string, e.g. "Mumbai, MH". |
| `region` | `VARCHAR(50)` | Broad region grouping, e.g. "West", "North", "South" — used for routing logic. |
| `is_active` | `BOOLEAN` **DEFAULT TRUE** | Set to `FALSE` to take a warehouse offline without deleting historical data. |
| `created_at` | `TIMESTAMPTZ` | When the warehouse was added. |

**Seeded rows:** Mumbai Hub, Delhi Hub, Bangalore Hub.

---

## 6. suppliers

**Purpose:** Vendors that InventoryAgent orders stock from when generating purchase orders.

| Column | Data Type | Explanation |
|---|---|---|
| `supplier_id` | `UUID` **PK** | Unique identifier for the supplier. |
| `name` | `VARCHAR(255)` **NOT NULL** | Supplier/company name. |
| `contact_email` | `VARCHAR(255)` | Email for placing purchase orders. |
| `contact_phone` | `VARCHAR(20)` | Phone contact, optional. |
| `lead_time_days` | `INT` **DEFAULT 7** | How many days this supplier typically takes to deliver — InventoryAgent uses this to time reorders. |
| `rating` | `DECIMAL(2,1)` **DEFAULT 5.0** | Supplier reliability score (e.g., 1.0–5.0), can factor into supplier selection. |
| `is_active` | `BOOLEAN` **DEFAULT TRUE** | Whether this supplier is currently usable. |
| `created_at` | `TIMESTAMPTZ` | When the supplier was added. |

---

## 7. products

**Purpose:** The product catalog. Every order item, inventory record, and price change references a product.

| Column | Data Type | Explanation |
|---|---|---|
| `product_id` | `UUID` **PK** | Unique identifier for the product. |
| `sku` | `VARCHAR(100)` **UNIQUE, NOT NULL** | Stock-keeping unit code, e.g. "TB-0001" — human-readable product code. |
| `name` | `VARCHAR(255)` **NOT NULL** | Product display name, e.g. "Wireless Earbuds Pro". |
| `description` | `TEXT` | Longer product description, also used as RAG source text. |
| `category` | `VARCHAR(100)` | Product category, e.g. "Audio", "Computing" — used for segmentation and reporting. |
| `base_price` | `DECIMAL(10,2)` **NOT NULL, ≥ 0** | The original/list price before any dynamic adjustments. |
| `current_price` | `DECIMAL(10,2)` **NOT NULL, ≥ 0** | The live selling price — this is what PricingAgent updates. |
| `cost_price` | `DECIMAL(10,2)` **NOT NULL, ≥ 0** | What it costs the store to acquire/produce this product — used to calculate margin. |
| `weight_kg` | `DECIMAL(8,3)` | Product weight — used by LogisticsAgent for shipping cost calculations. |
| `status` | `VARCHAR(20)` **DEFAULT 'active'** | One of `active`, `discontinued`, `out_of_stock`. |
| `created_at` | `TIMESTAMPTZ` | When the product was added. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated on any change (e.g., price update). |

---

## 8. inventory

**Purpose:** Stock levels per product per warehouse. This is what InventoryAgent monitors to trigger reorders and prevent overselling.

| Column | Data Type | Explanation |
|---|---|---|
| `inventory_id` | `UUID` **PK** | Unique identifier for this inventory record. |
| `product_id` | `UUID` **FK → products, NOT NULL** | Which product this stock record is for. |
| `warehouse_id` | `UUID` **FK → warehouses, NOT NULL** | Which warehouse holds this stock. |
| `quantity_on_hand` | `INT` **DEFAULT 0, ≥ 0** | Total physical units currently in the warehouse. |
| `quantity_reserved` | `INT` **DEFAULT 0, ≥ 0** | Units already allocated to placed-but-unfulfilled orders (prevents overselling). |
| `quantity_available` | `INT` **GENERATED (computed)** | Automatically calculated as `quantity_on_hand − quantity_reserved`. You never write to this column directly — Postgres computes it. |
| `reorder_point` | `INT` **DEFAULT 10** | The stock threshold that triggers InventoryAgent to generate a purchase order. |
| `reorder_quantity` | `INT` **DEFAULT 50** | How many units to order when a reorder is triggered. |
| `last_restock_date` | `DATE` | Date of the most recent stock replenishment. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated whenever stock changes. |

**Constraint:** `UNIQUE(product_id, warehouse_id)` — a product can only have one inventory row per warehouse.

---

## 9. orders

**Purpose:** Customer orders — the central record OrderAgent processes and tracks through its lifecycle.

| Column | Data Type | Explanation |
|---|---|---|
| `order_id` | `UUID` **PK** | Unique identifier for the order. |
| `customer_id` | `UUID` **FK → customers, NOT NULL** | Who placed this order. |
| `order_number` | `VARCHAR(50)` **UNIQUE, NOT NULL** | Human-readable order reference shown to the customer, e.g. "TB-ORD-000123". |
| `status` | `VARCHAR(30)` **DEFAULT 'pending'** | Lifecycle stage: `pending`, `confirmed`, `processing`, `shipped`, `delivered`, `cancelled`, or `returned`. |
| `total_amount` | `DECIMAL(12,2)` **NOT NULL, ≥ 0** | Total order value including all items. |
| `currency` | `VARCHAR(3)` **DEFAULT 'INR'** | Currency code for this order. |
| `shipping_address_id` | `UUID` **FK → addresses** | Which address to ship this order to. |
| `payment_method` | `VARCHAR(50)` | How the customer paid, e.g. "credit_card", "upi". |
| `payment_status` | `VARCHAR(20)` **DEFAULT 'pending'** | One of `pending`, `paid`, `refunded`, `failed`. |
| `placed_at` | `TIMESTAMPTZ` | When the customer submitted the order. |
| `confirmed_at` | `TIMESTAMPTZ` | When OrderAgent confirmed payment/stock and locked the order in. |
| `shipped_at` | `TIMESTAMPTZ` | When the order left the warehouse. |
| `delivered_at` | `TIMESTAMPTZ` | When the order reached the customer. |
| `created_at` | `TIMESTAMPTZ` | Row creation timestamp (system-level, may differ slightly from `placed_at`). |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated on any change. |

---

## 10. order_items

**Purpose:** Line items within an order — each row is one product + quantity within a specific order.

| Column | Data Type | Explanation |
|---|---|---|
| `order_item_id` | `UUID` **PK** | Unique identifier for this line item. |
| `order_id` | `UUID` **FK → orders, NOT NULL** | Which order this item belongs to. Deleting the order deletes its items (`ON DELETE CASCADE`). |
| `product_id` | `UUID` **FK → products, NOT NULL** | Which product was ordered. |
| `quantity` | `INT` **NOT NULL, > 0** | How many units of this product were ordered. |
| `unit_price` | `DECIMAL(10,2)` **NOT NULL, ≥ 0** | The price per unit *at the time of order* (kept even if the product's price changes later — important for accurate historical records). |
| `total_price` | `DECIMAL(12,2)` **GENERATED (computed)** | Automatically calculated as `quantity × unit_price`. |
| `status` | `VARCHAR(30)` **DEFAULT 'pending'** | One of `pending`, `fulfilled`, `cancelled`, `returned` — tracked per line item since a customer might return only one item from a multi-item order. |
| `created_at` | `TIMESTAMPTZ` | When this line item was created. |

---

## 11. shipments

**Purpose:** Shipping/delivery tracking for an order, managed by LogisticsAgent.

| Column | Data Type | Explanation |
|---|---|---|
| `shipment_id` | `UUID` **PK** | Unique identifier for the shipment. |
| `order_id` | `UUID` **FK → orders, NOT NULL** | Which order this shipment fulfills. |
| `carrier` | `VARCHAR(50)` | Shipping company used, e.g. "Delhivery", "BlueDart", "FedEx". |
| `tracking_number` | `VARCHAR(100)` | Carrier-issued tracking number shown to the customer. |
| `shipping_cost` | `DECIMAL(10,2)` | What it cost the store to ship this order — used for margin/cost analysis. |
| `status` | `VARCHAR(30)` **DEFAULT 'label_created'** | One of `label_created`, `picked_up`, `in_transit`, `out_for_delivery`, `delivered`, `exception`. |
| `shipped_at` | `TIMESTAMPTZ` | When the package was picked up by the carrier. |
| `delivered_at` | `TIMESTAMPTZ` | When the package reached the customer. |
| `estimated_delivery` | `DATE` | Carrier's promised delivery date. |
| `created_at` | `TIMESTAMPTZ` | When the shipment record was created. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated as tracking status changes. |

---

## 12. purchase_orders

**Purpose:** Restock orders that InventoryAgent generates when a product's stock drops to its reorder point. High-value POs go through the review queue for human approval.

| Column | Data Type | Explanation |
|---|---|---|
| `po_id` | `UUID` **PK** | Unique identifier for the purchase order. |
| `po_number` | `VARCHAR(50)` **UNIQUE, NOT NULL** | Human-readable PO reference number. |
| `supplier_id` | `UUID` **FK → suppliers, NOT NULL** | Which supplier this stock is being ordered from. |
| `product_id` | `UUID` **FK → products, NOT NULL** | Which product is being restocked. |
| `quantity` | `INT` **NOT NULL, > 0** | How many units are being ordered. |
| `unit_cost` | `DECIMAL(10,2)` **NOT NULL, ≥ 0** | Cost per unit from this supplier. |
| `total_cost` | `DECIMAL(12,2)` **GENERATED (computed)** | Automatically calculated as `quantity × unit_cost`. Compared against `store_config.po_auto_approve_limit` to decide if human approval is needed. |
| `status` | `VARCHAR(30)` **DEFAULT 'draft'** | One of `draft`, `pending_approval`, `approved`, `rejected`, `ordered`, `received`. |
| `created_by_agent` | `VARCHAR(50)` **DEFAULT 'inventory_agent'** | Which agent generated this PO (for audit purposes). |
| `approved_by` | `UUID` **FK → users** | Which admin approved this PO (null if auto-approved or still pending). |
| `created_at` | `TIMESTAMPTZ` | When the PO was drafted. |
| `approved_at` | `TIMESTAMPTZ` | When it was approved. |
| `expected_delivery` | `DATE` | Estimated arrival date based on the supplier's lead time. |

---

## 13. support_tickets

**Purpose:** Customer complaints/questions handled by SupportAgent.

| Column | Data Type | Explanation |
|---|---|---|
| `ticket_id` | `UUID` **PK** | Unique identifier for the ticket. |
| `customer_id` | `UUID` **FK → customers** | Who raised the ticket. |
| `order_id` | `UUID` **FK → orders** | Which order this ticket relates to, if any. |
| `subject` | `VARCHAR(500)` | Short summary of the issue. |
| `description` | `TEXT` | Full text of the customer's message. |
| `category` | `VARCHAR(50)` | One of `shipping_delay`, `defective`, `wrong_item`, `refund`, `other` — classified by SupportAgent. |
| `priority` | `VARCHAR(10)` **DEFAULT 'normal'** | One of `low`, `normal`, `high`, `urgent`. |
| `status` | `VARCHAR(30)` **DEFAULT 'open'** | One of `open`, `in_progress`, `resolved`, `escalated`. |
| `assigned_to_agent` | `VARCHAR(50)` **DEFAULT 'support_agent'** | Which agent (or human) is handling this ticket. |
| `resolution` | `TEXT` | Final resolution text once the ticket is closed. |
| `confidence_score` | `DECIMAL(3,2)` | SupportAgent's self-reported confidence in its resolution (0.00–1.00) — low scores trigger escalation. |
| `created_at` | `TIMESTAMPTZ` | When the ticket was opened. |
| `resolved_at` | `TIMESTAMPTZ` | When the ticket was closed. |
| `updated_at` | `TIMESTAMPTZ` | Auto-updated on any change. |

---

## 14. ticket_messages

**Purpose:** The full conversation thread within a support ticket — every message from the customer, the AI agent, a human agent, or the system.

| Column | Data Type | Explanation |
|---|---|---|
| `message_id` | `UUID` **PK** | Unique identifier for the message. |
| `ticket_id` | `UUID` **FK → support_tickets, NOT NULL** | Which ticket this message belongs to. Deleting the ticket deletes its messages. |
| `sender_type` | `VARCHAR(20)` **NOT NULL** | One of `customer`, `agent`, `human_agent`, `system`. |
| `message_content` | `TEXT` **NOT NULL** | The actual message text. |
| `metadata` | `JSONB` | Extra structured data — e.g. attachments, the agent's reasoning trace, or which tools it called. |
| `created_at` | `TIMESTAMPTZ` | When the message was sent. |

---

## 15. price_history

**Purpose:** Audit trail of every price change PricingAgent makes, with the reasoning behind it.

| Column | Data Type | Explanation |
|---|---|---|
| `history_id` | `UUID` **PK** | Unique identifier for this price-change record. |
| `product_id` | `UUID` **FK → products, NOT NULL** | Which product's price changed. |
| `old_price` | `DECIMAL(10,2)` | Price before the change. |
| `new_price` | `DECIMAL(10,2)` | Price after the change. |
| `change_reason` | `VARCHAR(200)` | Short explanation, e.g. "competitor_drop", "demand_increase", "clearance". |
| `changed_by` | `VARCHAR(50)` **DEFAULT 'pricing_agent'** | Who/what made the change (agent name or "admin" for manual overrides). |
| `competitor_price` | `DECIMAL(10,2)` | The competitor price that triggered this change, if applicable. |
| `margin_pct` | `DECIMAL(5,2)` | Profit margin at the new price — lets you verify PricingAgent stayed profitable. |
| `created_at` | `TIMESTAMPTZ` | When the change occurred. |

---

## 16. competitor_prices

**Purpose:** Tracked competitor pricing data that PricingAgent monitors and reacts to.

| Column | Data Type | Explanation |
|---|---|---|
| `comp_price_id` | `UUID` **PK** | Unique identifier for this observation. |
| `product_id` | `UUID` **FK → products, NOT NULL** | Which of your products this competitor price corresponds to. |
| `competitor_name` | `VARCHAR(100)` | Name of the competitor, e.g. "Amazon", "Flipkart". |
| `competitor_price` | `DECIMAL(10,2)` | The observed competitor price. |
| `competitor_url` | `TEXT` | Link to the competitor's product page (if scraped/tracked). |
| `detected_at` | `TIMESTAMPTZ` | When this price was observed. |

---

## 17. campaigns

**Purpose:** Marketing campaigns generated by MarketingAgent (email/social/clearance/re-engagement).

| Column | Data Type | Explanation |
|---|---|---|
| `campaign_id` | `UUID` **PK** | Unique identifier for the campaign. |
| `name` | `VARCHAR(255)` **NOT NULL** | Campaign name/title. |
| `type` | `VARCHAR(50)` | One of `email`, `social`, `clearance`, `re_engagement`. |
| `segment` | `VARCHAR(100)` | Target customer segment, e.g. matches `customers.segment` or a custom cohort description. |
| `status` | `VARCHAR(30)` **DEFAULT 'draft'** | One of `draft`, `pending_approval`, `approved`, `active`, `completed`, `rejected`. |
| `content_subject` | `TEXT` | Email subject line / social post headline. |
| `content_body` | `TEXT` | Full campaign content generated by the agent. |
| `budget` | `DECIMAL(10,2)` **DEFAULT 0** | Planned spend — any nonzero budget requires human approval per `store_config`. |
| `spent` | `DECIMAL(10,2)` **DEFAULT 0** | Actual amount spent so far. |
| `created_by_agent` | `VARCHAR(50)` **DEFAULT 'marketing_agent'** | Which agent created this campaign. |
| `approved_by` | `UUID` **FK → users** | Which admin approved it. |
| `scheduled_at` | `TIMESTAMPTZ` | When the campaign is set to go out. |
| `sent_at` | `TIMESTAMPTZ` | When it actually went out. |
| `created_at` | `TIMESTAMPTZ` | When the campaign was drafted. |

---

## 18. campaign_metrics

**Purpose:** Performance tracking for a sent campaign — feeds back into MarketingAgent's optimization decisions.

| Column | Data Type | Explanation |
|---|---|---|
| `metric_id` | `UUID` **PK** | Unique identifier for this metrics snapshot. |
| `campaign_id` | `UUID` **FK → campaigns, NOT NULL** | Which campaign these metrics belong to. |
| `recipients` | `INT` **DEFAULT 0** | Number of customers the campaign was sent to. |
| `opened` | `INT` **DEFAULT 0** | Number of opens (emails) or views (social). |
| `clicked` | `INT` **DEFAULT 0** | Number of link clicks. |
| `converted` | `INT` **DEFAULT 0** | Number of recipients who made a purchase as a result. |
| `revenue_attributed` | `DECIMAL(12,2)` **DEFAULT 0** | Revenue attributed to this campaign. |
| `recorded_at` | `TIMESTAMPTZ` | When this metrics snapshot was taken. |

---

## 19. agent_task_log

**Purpose:** The complete audit trail of every action every agent takes — critical for transparency, debugging, and demoing "what the AI actually did" to hackathon judges.

| Column | Data Type | Explanation |
|---|---|---|
| `log_id` | `UUID` **PK** | Unique identifier for this log entry. |
| `agent_name` | `VARCHAR(50)` **NOT NULL** | Which agent performed the action, e.g. `inventory_agent`, `order_agent`. |
| `task_type` | `VARCHAR(100)` **NOT NULL** | What kind of task this was, e.g. `reorder_triggered`, `price_changed`, `ticket_resolved`. |
| `status` | `VARCHAR(30)` **NOT NULL** | One of `success`, `failure`, `pending_review`, `escalated`. |
| `input_data` | `JSONB` | What the agent received as input (the task/request). |
| `output_data` | `JSONB` | What the agent produced (its decision/action/reasoning). |
| `model_used` | `VARCHAR(50)` | Which LLM handled this task, e.g. "qwen3:8b" or "gemini-2.5-flash" — useful for cost/quality analysis. |
| `tokens_used` | `INT` | Total tokens consumed by this LLM call. |
| `cost_usd` | `DECIMAL(10,4)` **DEFAULT 0** | Estimated cost of this call (0 if using free/local models). |
| `correlation_id` | `UUID` | Groups related log entries across multiple agents that handled the same overall task (for tracing a full workflow). |
| `human_approved` | `BOOLEAN` **DEFAULT FALSE** | Whether a human had to approve this specific action. |
| `created_at` | `TIMESTAMPTZ` | When this action occurred. |

---

## 20. agent_config

**Purpose:** Dynamic, per-agent settings that can be tuned without redeploying code (e.g., thresholds, model choice).

| Column | Data Type | Explanation |
|---|---|---|
| `config_id` | `UUID` **PK** | Unique identifier for this config entry. |
| `agent_name` | `VARCHAR(50)` **NOT NULL** | Which agent this setting applies to. |
| `config_key` | `VARCHAR(100)` **NOT NULL** | The setting's name, e.g. "max_iterations", "confidence_threshold". |
| `config_value` | `JSONB` | The setting's value (flexible JSON type). |
| `updated_at` | `TIMESTAMPTZ` | When this setting was last changed. |

**Constraint:** `UNIQUE(agent_name, config_key)` — each agent can only have one value per setting key.

---

## 21. review_queue

**Purpose:** The human-in-the-loop inbox. Any high-stakes agent action (large purchase order, big refund, campaign with a budget, large price swing) lands here before it's finalized.

| Column | Data Type | Explanation |
|---|---|---|
| `review_id` | `UUID` **PK** | Unique identifier for this review item. |
| `item_type` | `VARCHAR(30)` **NOT NULL** | What kind of item needs review: `purchase_order`, `refund`, `campaign`, `price_change`, `other`. |
| `reference_id` | `UUID` **NOT NULL** | Points to the actual record (e.g., `purchase_orders.po_id`) — no formal foreign key since it can reference different tables depending on `item_type` (polymorphic reference). |
| `agent_name` | `VARCHAR(50)` **NOT NULL** | Which agent submitted this item for review. |
| `summary` | `TEXT` **NOT NULL** | A short, human-readable description for the reviewer, e.g. "Reorder 100 units of Wireless Earbuds Pro — ₹3,500". |
| `payload` | `JSONB` | Full context/reasoning behind the agent's request, so the human reviewer understands *why*. |
| `status` | `VARCHAR(20)` **DEFAULT 'pending'** | One of `pending`, `approved`, `rejected`. |
| `reviewed_by` | `UUID` **FK → users** | Which admin made the decision. |
| `review_note` | `TEXT` | Optional note explaining the approval/rejection decision. |
| `created_at` | `TIMESTAMPTZ` | When the item was submitted for review. |
| `reviewed_at` | `TIMESTAMPTZ` | When the decision was made. |

---

## 22. knowledge_base

**Purpose:** The RAG (Retrieval-Augmented Generation) store — FAQs, policies, and product info that SupportAgent and MarketingAgent search over using vector similarity. This replaces a separate vector database (like OpenSearch) by using the `pgvector` extension directly in Postgres.

| Column | Data Type | Explanation |
|---|---|---|
| `kb_id` | `UUID` **PK** | Unique identifier for this knowledge document. |
| `doc_type` | `VARCHAR(30)` **NOT NULL** | One of `faq`, `policy`, `product`, `ticket_history` — lets you filter searches by document type. |
| `reference_id` | `UUID` | Optional link back to the source record, e.g. a `products.product_id` or `support_tickets.ticket_id`. |
| `title` | `VARCHAR(255)` | Short title/heading for the document. |
| `content` | `TEXT` **NOT NULL** | The actual text content that gets embedded and searched. |
| `embedding` | `vector(768)` | The numeric vector representation of `content`, generated by an embedding model (e.g., `nomic-embed-text` via Ollama). Dimension must match whatever embedding model you actually use — **change 768 if your model outputs a different size**. |
| `metadata` | `JSONB` | Any extra structured info (e.g., category, source URL). |
| `created_at` | `TIMESTAMPTZ` | When this document was added to the knowledge base. |

**Special index:** An HNSW index on `embedding` (`vector_cosine_ops`) makes similarity search fast even with thousands of documents.

---

## 23. LangGraph Checkpoint Tables (auto-created)

**Purpose:** LangGraph needs to persist agent state (conversation history, tool call results, graph position) so agents can pause, resume, and recover from failures. This is not something you design yourself.

| What Happens | Explanation |
|---|---|
| No manual table creation needed | LangGraph's `PostgresSaver` class creates its own tables (`checkpoints`, `checkpoint_blobs`, `checkpoint_writes`) automatically the first time you call `checkpointer.setup()` in Python. |
| Same database, different tables | These tables live in the same Postgres database as everything else — no separate DynamoDB or NoSQL store required. |
| You just point LangGraph at your `DATABASE_URL` | `PostgresSaver.from_conn_string(DATABASE_URL)` then `.setup()`. |

---

## 24. Entity Relationship Overview

```
users ──┬── purchase_orders (approved_by)
        ├── campaigns (approved_by)
        └── review_queue (reviewed_by)

customers ──┬── addresses
            ├── orders ──┬── order_items ── products ──┬── inventory ── warehouses
            │            └── shipments                 ├── price_history
            └── support_tickets ── ticket_messages      ├── competitor_prices
                        └── orders (FK)                 └── purchase_orders ── suppliers

campaigns ── campaign_metrics

agent_task_log        (references all entities loosely via JSONB input/output)
agent_config          (standalone, per-agent settings)
review_queue          (polymorphic reference to purchase_orders / campaigns / price_history / etc.)
knowledge_base         (loosely references products / support_tickets via reference_id)
store_config           (standalone, global settings)
```

### Which Agent Touches Which Tables

| Agent | Reads | Writes |
|---|---|---|
| Orchestrator | All tables (for routing) | `agent_task_log` |
| InventoryAgent | `inventory`, `products`, `order_items` | `inventory`, `purchase_orders`, `review_queue` |
| OrderAgent | `orders`, `order_items`, `inventory`, `customers` | `orders`, `order_items`, `inventory` (reserve stock) |
| SupportAgent | `support_tickets`, `orders`, `knowledge_base`, `customers` | `support_tickets`, `ticket_messages`, `review_queue` |
| PricingAgent | `products`, `competitor_prices`, `inventory` | `products`, `price_history`, `review_queue` |
| MarketingAgent | `customers`, `campaigns`, `inventory`, `products` | `campaigns`, `campaign_metrics`, `review_queue` |
| LogisticsAgent | `orders`, `shipments`, `addresses` | `shipments` |

---

## Suggested Reading Order Before Building the Database

1. Read **store_config**, **users** — the foundational/setup tables.
2. Read **customers → addresses → warehouses → suppliers → products → inventory** — the core commerce data.
3. Read **orders → order_items → shipments → purchase_orders** — the transactional flow.
4. Read **support_tickets → ticket_messages** — the support flow.
5. Read **price_history → competitor_prices** and **campaigns → campaign_metrics** — the pricing/marketing flow.
6. Read **agent_task_log → agent_config → review_queue** — the AI-operations layer that ties everything together.
7. Read **knowledge_base** — the RAG layer.
8. Skim **LangGraph checkpoint tables** — just know they exist and are auto-managed.

Once this makes sense, run `schema.sql` against your Postgres instance and you'll have a fully working database matching every table described here.
