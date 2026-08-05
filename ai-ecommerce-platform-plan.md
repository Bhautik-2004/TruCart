# AI-Powered Autonomous E-Commerce Operations Platform
## Hackathon Implementation Plan & Architecture Document

> **Team:** 2 Members  
> **Problem Statement:** Build an AI-powered multi-agent platform that automates end-to-end e-commerce operations using autonomous AI agents.  
> **Deployment Target:** Fully deployed on AWS (cloud-deployed AI agents, web application, solution architecture, DB schema, estimated costing, presentation, project documentation).  
> **Document Version:** 1.0  
> **Date:** July 2026

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [System Overview & Problem Decomposition](#2-system-overview--problem-decomposition)
3. [Solution Architecture](#3-solution-architecture)
4. [Multi-Agent Design](#4-multi-agent-design)
5. [Technology Stack](#5-technology-stack)
6. [Database Schema](#6-database-schema)
7. [API Design](#7-api-design)
8. [Deployment Architecture on AWS](#8-deployment-architecture-on-aws)
9. [Cost Estimation](#9-cost-estimation)
10. [Implementation Roadmap & Sprint Plan](#10-implementation-roadmap--sprint-plan)
11. [Task Division (2-Person Team)](#11-task-division-2-person-team)
12. [Presentation Structure](#12-presentation-structure)
13. [Project Documentation Checklist](#13-project-documentation-checklist)
14. [Risk Mitigation & Fallback Strategies](#14-risk-mitigation--fallback-strategies)
15. [Deliverables Checklist](#15-deliverables-checklist)

---

## 1. Executive Summary

This document outlines the complete implementation plan for an **AI-powered autonomous e-commerce operations platform** built with a multi-agent architecture. The platform deploys specialized AI agents that autonomously manage inventory, orders, customer support, dynamic pricing, marketing, and logistics — coordinating through a central orchestration layer. The entire system is deployed on AWS using serverless and containerized services, with a Next.js web dashboard for monitoring and control.

### Core Value Proposition

| Pain Point | Solution |
|---|---|
| Delayed decisions across siloed systems | Real-time multi-agent coordination with shared state |
| Stock issues & overselling | AI-driven inventory forecasting + auto-reorder agents |
| Poor customer experience | Autonomous customer support agent with order context |
| Manual pricing updates | Dynamic pricing agent reacting to market signals |
| Disconnected marketing & ops | Marketing agent fed by inventory & sales data |
| Lost revenue from inefficiency | End-to-end automation with human-in-the-loop escalation |

### Why Multi-Agent Over Monolithic AI

Multi-agent systems decompose complex e-commerce operations into specialized, independently scalable agents rather than a single mega-prompt. Each agent owns a domain (inventory, orders, support, pricing, marketing, logistics), has domain-specific tools, and can operate autonomously while coordinating through a central orchestrator. This mirrors how real e-commerce teams operate — specialists working in concert.

---

## 2. System Overview & Problem Decomposition

### 2.1 Problem Breakdown

The e-commerce operations lifecycle involves six core domains:

```
┌──────────────────────────────────────────────────────────────┐
│                    E-COMMERCE OPERATIONS                       │
├──────────┬──────────┬──────────┬──────────┬─────────┬────────┤
│ INVENTORY│  ORDERS  │  CUSTOMER│ PRICING  │MARKETING│LOGISTICS│
│          │          │ SUPPORT  │          │         │        │
│ Forecast │ Process  │ Respond  │ Adjust   | Create  │ Track  │
│ Reorder  │ Track    │ Resolve  │ prices   │ Campaigns│ Ship  │
│ Monitor  │ Route    │ Escalate │ Compete  │ Optimize│ Update │
└──────────┴──────────┴──────────┴──────────┴─────────┴────────┘
```

### 2.2 Agent Decomposition

| Domain | Agent Name | Key Responsibilities | Autonomy Level |
|---|---|---|---|
| Inventory | InventoryAgent | Stock monitoring, demand forecasting, auto-reorder triggers | Semi-autonomous (human approval on PO > threshold) |
| Orders | OrderAgent | Order processing, status tracking, fulfillment routing, returns handling | Fully autonomous for standard orders |
| Customer Support | SupportAgent | Query resolution, complaint handling, refund initiation, escalation | Autonomous for FAQs, human-in-loop for refunds |
| Pricing | PricingAgent | Dynamic pricing, competitor analysis, margin optimization | Semi-autonomous (price change limits) |
| Marketing | MarketingAgent | Campaign generation, audience segmentation, performance optimization | Content generation autonomous, budget requires approval |
| Logistics | LogisticsAgent | Shipping carrier selection, tracking, delivery optimization | Fully autonomous |
| Orchestration | OrchestratorAgent | Task routing, agent coordination, conflict resolution, state management | System-level |

### 2.3 Interaction Flows

**Flow 1: Low Stock → Reorder**
```
InventoryAgent detects low stock
    → Forecasts demand using historical data
    → Generates purchase order draft
    → Sends to human for approval (if PO > $X)
    → On approval, LogisticsAgent finds best supplier/shipping
    → OrderAgent updates expected inventory dates
```

**Flow 2: Customer Complaint → Resolution**
```
SupportAgent receives complaint
    → Retrieves order history from OrderAgent
    → Classifies issue (shipping delay, defective, wrong item)
    → Initiates refund/replacement if within policy
    → If refund > threshold, escalates to human
    → Logs resolution, updates customer record
```

**Flow 3: Competitor Price Drop → Dynamic Adjustment**
```
PricingAgent detects competitor price drop
    → Analyzes margin impact
    → Checks inventory levels (via InventoryAgent)
    → Calculates optimal price point
    → Applies price change within pre-approved bounds
    → MarketingAgent notified for promotion strategy update
```

---

## 3. Solution Architecture

### 3.1 High-Level Architecture Diagram

```
                              ┌─────────────────────┐
                              │   Next.js Frontend   │
                              │   (Dashboard + API)  │
                              └──────────┬──────────┘
                                         │
                              ┌──────────▼──────────┐
                              │   AWS CloudFront     │
                              │   + API Gateway      │
                              │   + AWS WAF          │
                              └──────────┬──────────┘
                                         │
                    ┌────────────────────▼────────────────────┐
                    │         AWS Step Functions              │
                    │      (Orchestrator Workflow)             │
                    └────────────────────┬────────────────────┘
                                         │
              ┌──────────────────────────┼──────────────────────────┐
              │                          │                          │
    ┌─────────▼─────────┐    ┌──────────▼──────────┐    ┌──────────▼──────────┐
    │  LangGraph         │    │  LangGraph           │    │  LangGraph            │
    │  Supervisor (ECS)  │    │  Supervisor (ECS)    │    │  Supervisor (ECS)     │
    └─────────┬─────────┘    └──────────┬──────────┘    └──────────┬──────────┘
              │                          │                          │
    ┌─────────▼─────────┐    ┌──────────▼──────────┐    ┌──────────▼──────────┐
    │ Agent Cluster 1    │    │ Agent Cluster 2      │    │ Agent Cluster 3      │
    │ (CPU: Order,       │    │ (GPU: Content,       │    │ (Integration:        │
    │  Support, Inventory│    │  Marketing, Pricing) │    │  External APIs,      │
    │  agents)           │    │                      │    │  Logistics)          │
    └─────────┬─────────┘    └──────────┬──────────┘    └──────────┬──────────┘
              │                          │                          │
    ┌─────────▼──────────────────────────▼──────────────────────────▼──────┐
    │                        SHARED STATE LAYER                            │
    │  ┌────────────┐  ┌──────────────┐  ┌─────────────┐  ┌─────────────┐  │
    │  │ ElastiCache│  │ Aurora       │  │ DynamoDB    │  │ S3 Data     │  │
    │  │ Redis      │  │ PostgreSQL   │  │ (Checkpoints│  │ Lake +      │  │
    │  │ (Session,  │  │ (Transactional│  │  + Review   │  │ OpenSearch  │  │
    │  │  Hot State)│  │  Data)       │  │  Queue)     │  │ (RAG)       │  │
    │  └────────────┘  └──────────────┘  └─────────────┘  └─────────────┘  │
    └──────────────────────────────────────────────────────────────────────┘
              │
    ┌─────────▼──────────────────────────────────────────────┐
    │              Amazon Bedrock (LLM Inference)             │
    │  ┌──────────────┐  ┌──────────────┐  ┌───────────────┐ │
    │  │ Claude Haiku │  │ Claude       │  │ Titan Embed   │ │
    │  │ (Triage/     │  │ Sonnet       │  │ (RAG vectors) │ │
    │  │  Routing)    │  │ (Reasoning)  │  │               │ │
    │  └──────────────┘  └──────────────┘  └───────────────┘ │
    └────────────────────────────────────────────────────────┘
```

### 3.2 Architecture Principles

| Principle | Implementation |
|---|---|
| **Agent isolation** | Each agent runs as an independent ECS task with its own SQS queue for backpressure and retry handling |
| **State persistence** | LangGraph checkpoints persist to DynamoDB, enabling time-travel debugging and recovery from partial failures |
| **Model tiering** | Fast/cheap models (Claude Haiku) for triage and routing; capable models (Claude Sonnet) for complex reasoning — reduces cost by 40-60% |
| **Human-in-the-loop** | Flagged tasks route to an SQS Review Queue consumed by a dedicated ECS review service |
| **Observability** | CloudWatch structured logs with correlation IDs per task graph; X-Ray for distributed tracing across ECS services |
| **Security** | AWS WAF with prompt-injection rules at the edge; Bedrock Guardrails for policy enforcement before agents receive tasks |
| **Graceful degradation** | If an LLM call fails, the agent retries with exponential backoff, then falls back to rule-based logic |

### 3.3 Agent Communication Pattern

The system uses a **supervisor pattern** (not peer-to-peer swarm) for predictability:

```
                    ┌──────────────────┐
                    │  Supervisor Agent │
                    │  (LangGraph on    │
                    │   ECS)            │
                    └────────┬─────────┘
                             │
           ┌─────────────────┼─────────────────┐
           │                 │                 │
    ┌──────▼──────┐  ┌──────▼──────┐  ┌──────▼──────┐
    │ Agent A     │  │ Agent B     │  │ Agent C     │
    │ (Inventory) │  │ (Order)    │  │ (Support)   │
    └──────┬──────┘  └──────┬──────┘  └──────┬──────┘
           │                │                 │
           └────────────────┼─────────────────┘
                            │
                    ┌───────▼───────┐
                    │  Shared State  │
                    │  (Redis +      │
                    │   DynamoDB)    │
                    └───────────────┘
```

The supervisor agent receives the task, determines which specialized agent(s) to dispatch to, routes the task, collects results, and coordinates any inter-agent dependencies. Agents do not communicate directly with each other — all coordination flows through the supervisor. This ensures deterministic state recovery and audit trails.

---

## 4. Multi-Agent Design

### 4.1 Framework Selection: LangGraph

**LangGraph** is chosen as the multi-agent framework based on the following evaluation:

| Criterion | LangGraph | CrewAI | AutoGen | OpenAI SDK |
|---|---|---|---|---|
| Orchestration model | Directed graph with conditional edges | Role-based crews | Conversational GroupChat | Explicit handoffs |
| State persistence | Built-in checkpointing with time-travel | Task outputs (sequential) | Conversation history (in-memory) | Context variables (ephemeral) |
| Model dependency | Fully model-agnostic | Fully model-agnostic | Fully model-agnostic | OpenAI models only |
| Production readiness | Highest (LangSmith, checkpointing, streaming) | Medium (limited checkpointing) | Medium (AG2 maturing) | High |
| Human-in-the-loop | Native (pause graph, wait for input, resume) | Limited | Limited | Limited |
| AWS integration | Official AWS guidance + samples | Community | Community | Limited |
| Learning curve | Medium (graph concepts, state schemas) | Low (20 lines to start) | Medium | Low |

**Decision rationale:** LangGraph's directed-graph model provides deterministic control over agent transitions, built-in checkpointing enables pause/inspect/resume (critical for human-in-the-loop approvals on purchase orders and refunds), and AWS has official architecture guidance and solution samples for LangGraph multi-agent systems on AWS.

### 4.2 Agent Specifications

#### 4.2.1 Orchestrator / Supervisor Agent

| Property | Value |
|---|---|
| Role | Central task router and coordinator |
| Model | Claude 3.5 Haiku (fast, cheap routing decisions) |
| Tools | `route_to_agent`, `get_agent_status`, `merge_results` |
| State | Global supervisor state in DynamoDB |
| Trigger | API Gateway → Step Functions |

**Responsibilities:**
- Parse incoming requests and determine intent
- Route tasks to appropriate specialized agents
- Collect and merge results from multiple agents
- Handle inter-agent dependencies (e.g., SupportAgent needs OrderAgent data)
- Manage conflict resolution (e.g., PricingAgent vs. MarketingAgent on promotions)
- Escalate to human review when confidence < threshold

#### 4.2.2 Inventory Agent

| Property | Value |
|---|---|
| Role | Stock monitoring, demand forecasting, auto-reorder |
| Model | Claude 3.5 Sonnet (complex reasoning for forecasting) |
| Tools | `check_stock`, `forecast_demand`, `generate_purchase_order`, `get_supplier_info` |
| Data sources | Aurora PostgreSQL (inventory table), historical sales data |
| Autonomy | Semi-autonomous (PO > $5,000 requires human approval) |

**Key workflows:**
- **Stock monitoring:** Poll inventory levels every 15 minutes; trigger reorder when stock < reorder point
- **Demand forecasting:** Use historical sales data + seasonal patterns + trending products to predict demand
- **Auto-reorder:** Generate PO draft → route to human review queue if above threshold → on approval, trigger LogisticsAgent
- **Oversell prevention:** Real-time stock reservation when orders are placed

#### 4.2.3 Order Agent

| Property | Value |
|---|---|
| Role | Order processing, tracking, fulfillment routing, returns |
| Model | Claude 3.5 Haiku (standard processing) / Sonnet (edge cases) |
| Tools | `process_order`, `update_status`, `route_fulfillment`, `handle_return`, `initiate_refund` |
| Data sources | Aurora PostgreSQL (orders, order_items tables) |
| Autonomy | Fully autonomous for standard orders |

**Key workflows:**
- **Order processing:** Validate payment → check inventory (via InventoryAgent) → confirm order → route to fulfillment
- **Status tracking:** Real-time order status updates to customer-facing dashboard
- **Returns handling:** Process return request → verify policy → initiate refund → update inventory
- **Fulfillment routing:** Select optimal warehouse + shipping carrier based on destination, weight, and cost

#### 4.2.4 Customer Support Agent

| Property | Value |
|---|---|
| Role | Query resolution, complaint handling, refunds, escalation |
| Model | Claude 3.5 Sonnet (nuanced reasoning for support) |
| Tools | `get_order_history`, `get_customer_info`, `initiate_refund`, `create_ticket`, `escalate_to_human` |
| Data sources | Aurora PostgreSQL (customers, orders, tickets), OpenSearch (FAQ/knowledge base) |
| Autonomy | Autonomous for FAQs; human-in-loop for refunds > $100 |

**Key workflows:**
- **Query resolution:** RAG-powered search over FAQ knowledge base + order context
- **Complaint classification:** Classify severity → route appropriately
- **Refund handling:** Check return policy → if eligible and < $100, auto-process; if > $100, route to human review
- **Escalation:** Escalate to human agent if confidence < 0.7 or after 3 failed resolution attempts

#### 4.2.5 Pricing Agent

| Property | Value |
|---|---|
| Role | Dynamic pricing, competitor analysis, margin optimization |
| Model | Claude 3.5 Sonnet (complex multi-factor reasoning) |
| Tools | `get_competitor_prices`, `calculate_margin`, `adjust_price`, `get_demand_elasticity` |
| Data sources | Aurora PostgreSQL (products, price_history), external competitor APIs |
| Autonomy | Semi-autonomous (max ±15% price change within 24h) |

**Key workflows:**
- **Competitor monitoring:** Poll competitor prices every 30 minutes
- **Dynamic pricing:** Analyze demand elasticity + competitor prices + inventory levels + margin targets → calculate optimal price
- **Guardrails:** Price changes capped at ±15% per 24h; price floors enforced (never below cost + minimum margin)
- **Alert triggers:** If competitor drops price > 20%, alert marketing agent for promotion strategy

#### 4.2.6 Marketing Agent

| Property | Value |
|---|---|
| Role | Campaign generation, audience segmentation, content creation |
| Model | Claude 3.5 Sonnet (creative + analytical) |
| Tools | `segment_audience`, `generate_campaign_content`, `send_campaign`, `analyze_performance` |
| Data sources | Aurora PostgreSQL (customers, campaigns), S3 (campaign assets) |
| Autonomy | Content generation autonomous; campaign budget requires approval |

**Key workflows:**
- **Audience segmentation:** Cluster customers by purchase history, LTV, engagement
- **Content generation:** Generate email/social content based on segment + inventory (promote overstocked items)
- **Campaign optimization:** A/B test subject lines, content; auto-optimize send times
- **Inventory-aware promotions:** Receive overstock alerts from InventoryAgent → generate clearance campaigns

#### 4.2.7 Logistics Agent

| Property | Value |
|---|---|
| Role | Shipping carrier selection, tracking, delivery optimization |
| Model | Claude 3.5 Haiku (rule-heavy, less reasoning needed) |
| Tools | `select_carrier`, `get_rates`, `create_shipment`, `track_shipment`, `update_tracking` |
| Data sources | Aurora PostgreSQL (shipments), external carrier APIs (ShipEngine, Shippo) |
| Autonomy | Fully autonomous |

**Key workflows:**
- **Carrier selection:** Compare rates + delivery times across carriers → select optimal
- **Shipment creation:** Generate labels, schedule pickups
- **Tracking:** Poll carrier APIs every hour → update shipment status → notify customer
- **Exception handling:** Detect delivery exceptions → trigger SupportAgent proactive outreach

### 4.3 Agent Tool Definitions Summary

```
┌─────────────────────────────────────────────────────────────────┐
│                    AGENT TOOL MAP                                │
├─────────────────┬───────────────────────────────────────────────┤
│ InventoryAgent  │ check_stock, forecast_demand,                 │
│                 │ generate_purchase_order, get_supplier_info     │
├─────────────────┼───────────────────────────────────────────────┤
│ OrderAgent      │ process_order, update_status, route_fulfillment│
│                 │ handle_return, initiate_refund                 │
├─────────────────┼───────────────────────────────────────────────┤
│ SupportAgent    │ get_order_history, get_customer_info,          │
│                 │ initiate_refund, create_ticket, escalate_human  │
├─────────────────┼───────────────────────────────────────────────┤
│ PricingAgent    │ get_competitor_prices, calculate_margin,       │
│                 │ adjust_price, get_demand_elasticity            │
├─────────────────┼───────────────────────────────────────────────┤
│ MarketingAgent  │ segment_audience, generate_campaign_content,    │
│                 │ send_campaign, analyze_performance             │
├─────────────────┼───────────────────────────────────────────────┤
│ LogisticsAgent  │ select_carrier, get_rates, create_shipment,    │
│                 │ track_shipment, update_tracking               │
└─────────────────┴───────────────────────────────────────────────┘
```

### 4.4 RAG / Knowledge Base Layer

```
                    ┌─────────────────────┐
                    │   Product Catalog   │
                    │   Customer FAQ      │
                    │   Return Policies   │
                    │   Shipping Policies  │
                    │   Historical Tickets │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │  AWS Glue (Crawler) │
                    │  → Data Catalog     │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │  Amazon OpenSearch  │
                    │  (kNN Vector Search)│
                    │  + Bedrock Titan    │
                    │  Embeddings         │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │  SupportAgent &      │
                    │  MarketingAgent      │
                    │  (unified retrieval) │
                    └─────────────────────┘
```

The RAG pipeline ingests product catalogs, FAQs, policies, and historical support tickets into OpenSearch with Titan-generated embeddings. The supervisor issues a single knowledge query and the RAG layer fans out across indexes, providing grounded context to agents.

---

## 5. Technology Stack

### 5.1 Complete Tech Stack

| Layer | Technology | Justification |
|---|---|---|
| **Frontend** | Next.js 15 (App Router) + TypeScript | Team expertise; SSR for dashboard; API routes for BFF |
| **UI Library** | Tailwind CSS + shadcn/ui | Rapid, consistent UI; hackathon speed |
| **State Management** | Zustand + TanStack Query | Lightweight state + server-state caching |
| **Charts** | Recharts / Tremor | Real-time ops dashboards |
| **Agent Framework** | LangGraph | Directed-graph orchestration; checkpointing; AWS-native |
| **LLM Provider** | Amazon Bedrock (Claude 3.5 Haiku + Sonnet) | Pay-per-token; no infra; model tiering; compliance |
| **Embeddings** | Amazon Bedrock Titan Text Embeddings | Native AWS integration for RAG |
| **Backend API** | Next.js API Routes (BFF) + AWS Lambda | Serverless; minimal infra overhead |
| **Orchestration** | AWS Step Functions | Top-level workflow; fault-tolerant state machine |
| **Message Queues** | Amazon SQS | Per-agent queues for backpressure, retry, and review |
| **Event Bus** | Amazon EventBridge | Inter-service event communication |
| **Relational DB** | Amazon Aurora Serverless v2 (PostgreSQL) | Transactional data; auto-scaling; pay-per-use |
| **NoSQL DB** | Amazon DynamoDB | Agent checkpoints, session state, review queue |
| **Cache** | Amazon ElastiCache (Redis) | Session state, agent scratch pads, hot data |
| **Vector Search** | Amazon OpenSearch Serverless | RAG knowledge base; kNN vector search |
| **Object Storage** | Amazon S3 | Campaign assets, product images, data lake |
| **Data Pipeline** | AWS Glue + Amazon Athena | Data catalog, ETL, analytics queries |
| **Container Compute** | Amazon ECS (Fargate) | Agent runtime; serverless containers; no EC2 management |
| **CDN** | Amazon CloudFront | Frontend distribution; edge caching |
| **API Gateway** | Amazon API Gateway | REST API management; throttling; auth |
| **Auth** | Amazon Cognito | User authentication; JWT tokens |
| **Security** | AWS WAF + Bedrock Guardrails | Prompt injection blocking; policy enforcement |
| **Observability** | CloudWatch + X-Ray + CloudTrail | Logs, distributed tracing, audit |
| **Analytics** | Amazon QuickSight | Ops dashboards; KPI visualization |
| **IaC** | AWS CDK (TypeScript) | Infrastructure as code; team knows TypeScript |
| **CI/CD** | GitHub Actions → AWS CodePipeline | Automated deployments |
| **Monitoring** | CloudWatch Alarms + SNS | Alerting on anomalies, cost thresholds |

### 5.2 Why Not Other Frameworks

| Framework | Reason for Rejection |
|---|---|
| CrewAI | No built-in checkpointing for long-running workflows; limited control over agent-to-agent communication; better for prototyping, not production |
| AutoGen / AG2 | Conversational model is expensive (every turn = full LLM call); high latency for real-time e-commerce use cases |
| OpenAI Agents SDK | Locked to OpenAI models; no AWS-native integration; team needs model portability |
| Google ADK | Newest framework, ecosystem still maturing; fewer AWS integration patterns |
| Bedrock Agents (native) | Less flexible than LangGraph for custom multi-agent orchestration; good for single-agent flows but complex for 6+ agents |

### 5.3 Model Tiering Strategy

```
┌─────────────────────────────────────────────────────────────┐
│                   MODEL TIERING                              │
├──────────────────┬───────────────┬───────────────────────────┤
│ Tier 1 (Cheap)  │ Claude 3.5    │ Triage, routing, status   │
│ Fast             │ Haiku         │ updates, simple lookups   │
│                  │ ~$0.002/req   │ Orchestrator, Logistics   │
├──────────────────┼───────────────┼───────────────────────────┤
│ Tier 2 (Smart)  │ Claude 3.5    │ Complex reasoning,        │
│ Capable          │ Sonnet        │ forecasting, content gen   │
│                  │ ~$0.015/req   │ Pricing, Marketing,       │
│                  │               │ Inventory, Support         │
└──────────────────┴───────────────┴───────────────────────────┘

Cost reduction: 40-60% vs running Sonnet on all agents
```

---

## 6. Database Schema

### 6.1 Aurora PostgreSQL (Transactional Data)

```sql
-- ============================================================
-- CORE E-COMMERCE SCHEMA
-- ============================================================

-- Customers
CREATE TABLE customers (
    customer_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email            VARCHAR(255) UNIQUE NOT NULL,
    full_name        VARCHAR(255) NOT NULL,
    phone            VARCHAR(20),
    segment          VARCHAR(50) DEFAULT 'standard', -- standard, vip, at_risk
    lifetime_value   DECIMAL(12,2) DEFAULT 0,
    total_orders     INT DEFAULT 0,
    created_at       TIMESTAMPTZ DEFAULT NOW(),
    updated_at       TIMESTAMPTZ DEFAULT NOW()
);

-- Addresses
CREATE TABLE addresses (
    address_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id     UUID REFERENCES customers(customer_id),
    line1           TEXT NOT NULL,
    line2           TEXT,
    city            VARCHAR(100) NOT NULL,
    state           VARCHAR(100),
    postal_code     VARCHAR(20),
    country         VARCHAR(2) DEFAULT 'IN',
    is_default      BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Products
CREATE TABLE products (
    product_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku             VARCHAR(100) UNIQUE NOT NULL,
    name            VARCHAR(255) NOT NULL,
    description     TEXT,
    category        VARCHAR(100),
    base_price      DECIMAL(10,2) NOT NULL,
    current_price   DECIMAL(10,2) NOT NULL,
    cost_price      DECIMAL(10,2) NOT NULL,
    weight_kg       DECIMAL(8,3),
    status          VARCHAR(20) DEFAULT 'active', -- active, discontinued, out_of_stock
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Inventory
CREATE TABLE inventory (
    inventory_id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id      UUID REFERENCES products(product_id),
    warehouse_id   UUID REFERENCES warehouses(warehouse_id),
    quantity_on_hand   INT NOT NULL DEFAULT 0,
    quantity_reserved  INT NOT NULL DEFAULT 0, -- allocated to pending orders
    quantity_available INT GENERATED ALWAYS AS (quantity_on_hand - quantity_reserved) STORED,
    reorder_point     INT NOT NULL,
    reorder_quantity  INT NOT NULL,
    last_restock_date DATE,
    updated_at        TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(product_id, warehouse_id)
);

-- Warehouses
CREATE TABLE warehouses (
    warehouse_id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(255) NOT NULL,
    location        VARCHAR(255),
    region          VARCHAR(50),
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Orders
CREATE TABLE orders (
    order_id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id     UUID REFERENCES customers(customer_id),
    order_number    VARCHAR(50) UNIQUE NOT NULL,
    status          VARCHAR(30) DEFAULT 'pending',
    -- pending, confirmed, processing, shipped, delivered, cancelled, returned
    total_amount    DECIMAL(12,2) NOT NULL,
    currency        VARCHAR(3) DEFAULT 'INR',
    shipping_address_id UUID REFERENCES addresses(address_id),
    payment_method  VARCHAR(50),
    payment_status  VARCHAR(20) DEFAULT 'pending', -- pending, paid, refunded, failed
    placed_at       TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at    TIMESTAMPTZ,
    shipped_at      TIMESTAMPTZ,
    delivered_at    TIMESTAMPTZ,
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Order Items
CREATE TABLE order_items (
    order_item_id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id        UUID REFERENCES orders(order_id),
    product_id      UUID REFERENCES products(product_id),
    quantity        INT NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL, -- price at time of order
    total_price     DECIMAL(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    status          VARCHAR(30) DEFAULT 'pending', -- pending, fulfilled, cancelled, returned
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Shipments
CREATE TABLE shipments (
    shipment_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id        UUID REFERENCES orders(order_id),
    carrier         VARCHAR(50), -- dtdc, delhivery, bluedart, fedex
    tracking_number VARCHAR(100),
    shipping_cost   DECIMAL(10,2),
    status          VARCHAR(30) DEFAULT 'label_created',
    -- label_created, picked_up, in_transit, out_for_delivery, delivered, exception
    shipped_at      TIMESTAMPTZ,
    delivered_at    TIMESTAMPTZ,
    estimated_delivery DATE,
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Purchase Orders (for restocking)
CREATE TABLE purchase_orders (
    po_id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    po_number       VARCHAR(50) UNIQUE NOT NULL,
    supplier_id     UUID REFERENCES suppliers(supplier_id),
    product_id      UUID REFERENCES products(product_id),
    quantity        INT NOT NULL,
    unit_cost       DECIMAL(10,2) NOT NULL,
    total_cost      DECIMAL(12,2) GENERATED ALWAYS AS (quantity * unit_cost) STORED,
    status          VARCHAR(30) DEFAULT 'draft', -- draft, pending_approval, approved, ordered, received
    created_by_agent VARCHAR(50) NOT NULL, -- which agent created this
    approved_by     UUID, -- admin user id
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    approved_at     TIMESTAMPTZ,
    expected_delivery DATE
);

-- Suppliers
CREATE TABLE suppliers (
    supplier_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(255) NOT NULL,
    contact_email   VARCHAR(255),
    contact_phone   VARCHAR(20),
    lead_time_days  INT DEFAULT 7,
    rating          DECIMAL(2,1) DEFAULT 5.0,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- CUSTOMER SUPPORT SCHEMA
-- ============================================================

-- Support Tickets
CREATE TABLE support_tickets (
    ticket_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id     UUID REFERENCES customers(customer_id),
    order_id        UUID REFERENCES orders(order_id),
    subject         VARCHAR(500),
    description     TEXT,
    category        VARCHAR(50), -- shipping_delay, defective, wrong_item, refund, other
    priority        VARCHAR(10) DEFAULT 'normal', -- low, normal, high, urgent
    status          VARCHAR(30) DEFAULT 'open', -- open, in_progress, resolved, escalated
    assigned_to_agent VARCHAR(50), -- support_agent, human_agent_X
    resolution      TEXT,
    confidence_score DECIMAL(3,2), -- agent's confidence in resolution
    created_at      TIMESTAMPTZ DEFAULT NOW(),
    resolved_at     TIMESTAMPTZ,
    updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Ticket Messages (conversation log)
CREATE TABLE ticket_messages (
    message_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticket_id       UUID REFERENCES support_tickets(ticket_id),
    sender_type     VARCHAR(20) NOT NULL, -- customer, agent, human_agent, system
    message_content TEXT NOT NULL,
    metadata        JSONB, -- attachments, agent reasoning, tool calls
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- PRICING SCHEMA
-- ============================================================

-- Price History (audit trail for all price changes)
CREATE TABLE price_history (
    history_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id      UUID REFERENCES products(product_id),
    old_price       DECIMAL(10,2),
    new_price       DECIMAL(10,2),
    change_reason   VARCHAR(200), -- competitor_drop, demand_increase, clearance, manual
    changed_by      VARCHAR(50), -- pricing_agent, admin
    competitor_price DECIMAL(10,2),
    margin_pct      DECIMAL(5,2),
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Competitor Price Tracking
CREATE TABLE competitor_prices (
    comp_price_id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id      UUID REFERENCES products(product_id),
    competitor_name VARCHAR(100),
    competitor_price DECIMAL(10,2),
    competitor_url  TEXT,
    detected_at     TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- MARKETING SCHEMA
-- ============================================================

-- Campaigns
CREATE TABLE campaigns (
    campaign_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(255) NOT NULL,
    type            VARCHAR(50), -- email, social, clearance, re_engagement
    segment         VARCHAR(100), -- audience segment targeted
    status          VARCHAR(30) DEFAULT 'draft', -- draft, pending_approval, active, completed
    content_subject TEXT,
    content_body    TEXT,
    budget          DECIMAL(10,2),
    spent           DECIMAL(10,2) DEFAULT 0,
    created_by_agent VARCHAR(50),
    approved_by     UUID,
    scheduled_at    TIMESTAMPTZ,
    sent_at         TIMESTAMPTZ,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Campaign Metrics
CREATE TABLE campaign_metrics (
    metric_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    campaign_id     UUID REFERENCES campaigns(campaign_id),
    recipients      INT DEFAULT 0,
    opened          INT DEFAULT 0,
    clicked         INT DEFAULT 0,
    converted       INT DEFAULT 0,
    revenue_attributed DECIMAL(12,2) DEFAULT 0,
    recorded_at     TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- AGENT OPERATIONS SCHEMA
-- ============================================================

-- Agent Task Log (audit trail for every agent action)
CREATE TABLE agent_task_log (
    log_id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_name      VARCHAR(50) NOT NULL, -- inventory_agent, order_agent, etc.
    task_type       VARCHAR(100) NOT NULL, -- reorder_triggered, price_changed, etc.
    status          VARCHAR(30) NOT NULL, -- success, failure, pending_review, escalated
    input_data      JSONB,
    output_data     JSONB,
    model_used      VARCHAR(50),
    tokens_used     INT,
    cost_usd        DECIMAL(10,4),
    correlation_id  UUID, -- for tracing across agents
    human_approved  BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Agent Config (dynamic agent parameters)
CREATE TABLE agent_config (
    config_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_name      VARCHAR(50) NOT NULL,
    config_key      VARCHAR(100) NOT NULL,
    config_value    JSONB,
    updated_at      TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(agent_name, config_key)
);
```

### 6.2 DynamoDB (Agent State & Checkpoints)

| Table | Partition Key | Sort Key | Purpose |
|---|---|---|---|
| `langgraph_checkpoints` | `thread_id` | `checkpoint_id` | LangGraph state snapshots for time-travel recovery |
| `agent_sessions` | `session_id` | — | Active agent conversation sessions |
| `review_queue` | `review_id` | `created_at` | Tasks pending human approval (POs, refunds, campaigns) |
| `agent_metrics` | `agent_name#date` | `metric_type` | Per-agent daily metrics (requests, tokens, cost, latency) |
| `rate_limits` | `agent_name` | — | Per-agent rate limiting state |

### 6.3 ElastiCache Redis (Hot State)

| Key Pattern | TTL | Purpose |
|---|---|---|
| `session:{session_id}` | 30 min | Active session state for real-time interactions |
| `agent:scratch:{agent_name}` | 5 min | Agent scratch pad for multi-step reasoning |
| `inventory:available:{product_id}` | 60 sec | Cached available inventory for fast lookups |
| `price:current:{product_id}` | 60 sec | Cached current prices |
| `order:status:{order_id}` | 2 min | Cached order status |
| `rate:limit:{agent_name}` | 60 sec | Rate limiting counters |

### 6.4 OpenSearch (RAG Knowledge Base)

| Index | Documents | Vector Field | Purpose |
|---|---|---|---|
| `product_catalog` | All products | `embedding` | Product search for support agent |
| `faq_kb` | FAQ entries | `embedding` | Customer query resolution |
| `policy_kb` | Return, shipping, refund policies | `embedding` | Policy-grounded support responses |
| `ticket_history` | Resolved tickets | `embedding` | Historical resolution patterns |

### 6.5 Entity Relationship Summary

```
customers ──┬── addresses
            ├── orders ──┬── order_items ── products ──┬── inventory ── warehouses
            │            └── shipments                 ├── price_history
            └── support_tickets ── ticket_messages     ├── competitor_prices
                        └── order (FK)                 ├── purchase_orders ── suppliers
                                                        └── campaigns ── campaign_metrics

agent_task_log (references all entities via JSONB input/output)
agent_config (standalone configuration)
```

---

## 7. API Design

### 7.1 REST API Endpoints

#### Customer-Facing API (via API Gateway → Lambda)

| Method | Endpoint | Description | Auth |
|---|---|---|---|
| `POST` | `/api/orders` | Place a new order (triggers OrderAgent) | Cognito JWT |
| `GET` | `/api/orders/{id}` | Get order status + tracking | Cognito JWT |
| `POST` | `/api/orders/{id}/return` | Initiate return (triggers OrderAgent + SupportAgent) | Cognito JWT |
| `POST` | `/api/support/ticket` | Create support ticket (triggers SupportAgent) | Cognito JWT |
| `GET` | `/api/support/ticket/{id}` | Get ticket status + conversation | Cognito JWT |
| `POST` | `/api/support/ticket/{id}/message` | Send message in ticket conversation | Cognito JWT |
| `GET` | `/api/products` | Browse products with current prices | Public |
| `GET` | `/api/products/{id}` | Product detail + availability | Public |

#### Admin Dashboard API (via API Gateway → Lambda, admin role)

| Method | Endpoint | Description | Auth |
|---|---|---|---|
| `GET` | `/api/admin/dashboard` | KPI overview (orders, revenue, stock alerts, active agents) | Admin JWT |
| `GET` | `/api/admin/agents/status` | Real-time agent status + metrics | Admin JWT |
| `GET` | `/api/admin/agents/{name}/logs` | Agent task log with filters | Admin JWT |
| `GET` | `/api/admin/review-queue` | Pending human-approval tasks | Admin JWT |
| `POST` | `/api/admin/review-queue/{id}/approve` | Approve pending task (PO, refund, campaign) | Admin JWT |
| `POST` | `/api/admin/review-queue/{id}/reject` | Reject pending task with reason | Admin JWT |
| `GET` | `/api/admin/inventory/forecast` | AI demand forecast for products | Admin JWT |
| `GET` | `/api/admin/pricing/history/{productId}` | Price change history + reasoning | Admin JWT |
| `GET` | `/api/admin/campaigns` | Campaign performance metrics | Admin JWT |
| `PUT` | `/api/admin/agent-config/{agentName}` | Update agent configuration (thresholds, bounds) | Admin JWT |
| `POST` | `/api/admin/agents/{name}/pause` | Pause a specific agent | Admin JWT |
| `POST` | `/api/admin/agents/{name}/resume` | Resume a paused agent | Admin JWT |

#### Agent Internal API (via SQS → ECS, not public)

| Consumer | Message Type | Purpose |
|---|---|---|
| InventoryAgent | `check_stock`, `reorder_alert` | Scheduled checks + threshold triggers |
| OrderAgent | `new_order`, `return_request`, `status_update` | Order lifecycle events |
| SupportAgent | `new_ticket`, `ticket_message`, `escalation` | Support events |
| PricingAgent | `competitor_update`, `price_eval` | Pricing events |
| MarketingAgent | `campaign_trigger`, `performance_check` | Marketing events |
| LogisticsAgent | `shipment_request`, `tracking_poll` | Shipping events |

### 7.2 WebSocket API (Real-Time Updates)

| Channel | Direction | Purpose |
|---|---|---|
| `/ws/dashboard` | Server → Client | Push KPI updates, agent status changes, new alerts |
| `/ws/ticket/{id}` | Server → Client | Real-time support ticket conversation updates |
| `/ws/order/{id}` | Server → Client | Order status + shipment tracking updates |

### 7.3 API Security

| Layer | Mechanism |
|---|---|
| Edge | AWS WAF with rules for prompt injection, SQL injection, rate limiting |
| Authentication | Amazon Cognito with JWT (access + ID tokens) |
| Authorization | Role-based: `customer`, `admin`, `agent_internal` |
| API Gateway | Throttling (1000 req/min per user), usage plans, API keys for internal |
| Bedrock Guardrails | Content filters, denied topics, PII redaction |
| Secrets | AWS Secrets Manager for DB credentials, API keys |

---

## 8. Deployment Architecture on AWS

### 8.1 AWS Services Map

```
┌─────────────────────────────────────────────────────────────────────┐
│                        AWS CLOUD (us-east-1)                         │
│                                                                     │
│  ┌──────────────────────────────────────────────┐                   │
│  │  EDGE LAYER                                   │                   │
│  │  Route 53 → CloudFront → WAF                  │                   │
│  │  (Next.js static assets from S3)               │                   │
│  └──────────────────────┬───────────────────────┘                   │
│                         │                                           │
│  ┌──────────────────────▼───────────────────────┐                   │
│  │  API LAYER                                    │                   │
│  │  API Gateway (REST + WebSocket)               │                   │
│  │  + Cognito (Auth)                             │                   │
│  │  → Lambda functions (BFF + API handlers)       │                   │
│  └──────────────────────┬───────────────────────┘                   │
│                         │                                           │
│  ┌──────────────────────▼───────────────────────┐                   │
│  │  ORCHESTRATION LAYER                          │                   │
│  │  AWS Step Functions (top-level workflow)      │                   │
│  │  + EventBridge (event bus)                    │                   │
│  │  + SQS (per-agent queues + review queue)      │                   │
│  └──────────────────────┬───────────────────────┘                   │
│                         │                                           │
│  ┌──────────────────────▼───────────────────────┐                   │
│  │  AGENT LAYER                                  │                   │
│  │  ECS Fargate (LangGraph supervisor + agents)  │                   │
│  │  + Bedrock Guardrails (sidecar governance)     │                   │
│  │  + Bedrock (LLM inference: Haiku + Sonnet)     │                   │
│  └──────────────────────┬───────────────────────┘                   │
│                         │                                           │
│  ┌──────────────────────▼───────────────────────┐                   │
│  │  DATA LAYER                                  │                   │
│  │  Aurora Serverless v2 (PostgreSQL)            │                   │
│  │  + DynamoDB (checkpoints, sessions)           │                   │
│  │  + ElastiCache Redis (hot state)              │                   │
│  │  + OpenSearch Serverless (RAG)                │                   │
│  │  + S3 (assets, data lake)                     │                   │
│  └──────────────────────────────────────────────┘                   │
│                                                                     │
│  ┌──────────────────────────────────────────────┐                   │
│  │  OBSERVABILITY LAYER                          │                   │
│  │  CloudWatch (logs, metrics, alarms)           │                   │
│  │  + X-Ray (distributed tracing)               │                   │
│  │  + CloudTrail (audit)                        │                   │
│  │  + QuickSight (dashboards)                   │                   │
│  └──────────────────────────────────────────────┘                   │
│                                                                     │
│  ┌──────────────────────────────────────────────┐                   │
│  │  CI/CD                                        │                   │
│  │  GitHub → CodePipeline → CodeBuild → ECS      │                   │
│  │  + ECR (container registry)                   │                   │
│  │  + CDK (IaC)                                  │                   │
│  └──────────────────────────────────────────────┘                   │
└─────────────────────────────────────────────────────────────────────┘
```

### 8.2 ECS Fargate Agent Deployment

Each agent is deployed as an ECS Fargate task with the following configuration:

| Agent | CPU | Memory | Min Tasks | Max Tasks | Scaling Trigger |
|---|---|---|---|---|---|
| Orchestrator | 0.5 vCPU | 1 GB | 1 | 4 | SQS queue depth > 10 |
| InventoryAgent | 0.5 vCPU | 1 GB | 1 | 2 | SQS queue depth > 5 |
| OrderAgent | 1 vCPU | 2 GB | 1 | 4 | SQS queue depth > 10 |
| SupportAgent | 1 vCPU | 2 GB | 1 | 3 | SQS queue depth > 5 |
| PricingAgent | 0.5 vCPU | 1 GB | 1 | 1 | Scheduled (every 30 min) |
| MarketingAgent | 1 vCPU | 2 GB | 1 | 2 | SQS queue depth > 5 |
| LogisticsAgent | 0.5 vCPU | 1 GB | 1 | 2 | SQS queue depth > 5 |
| Review Service | 0.25 vCPU | 0.5 GB | 1 | 1 | SQS queue depth > 0 |

### 8.3 VPC & Networking

```
VPC (10.0.0.0/16)
├── Public Subnets (2 AZs)
│   ├── NAT Gateway (for outbound internet)
│   ├── ALB (if needed for ECS)
│   └── Bastion host (optional, for debugging)
├── Private Subnets (2 AZs)
│   ├── ECS Fargate tasks (agents)
│   ├── Lambda functions
│   └── API Gateway VPC Link (if private API)
├── Data Subnets (2 AZs)
│   ├── Aurora Serverless v2
│   ├── ElastiCache Redis
│   └── OpenSearch
└── VPC Endpoints (cost optimization)
    ├── S3 Gateway Endpoint (free)
    ├── DynamoDB Gateway Endpoint (free)
    ├── Bedrock Interface Endpoint
    └── SQS Interface Endpoint
```

**Cost optimization note:** VPC endpoints for AWS-internal traffic eliminate NAT Gateway data processing fees ($0.045/GB), which is one of the top hidden costs in AWS AI deployments.

### 8.4 CI/CD Pipeline

```
GitHub Push
    │
    ▼
GitHub Actions (lint + test)
    │
    ▼
AWS CodePipeline
    ├── Source: GitHub webhook
    ├── Build: CodeBuild (Docker build → ECR push)
    ├── Deploy Staging: ECS Fargate (staging cluster)
    ├── Test: Automated smoke tests
    └── Deploy Prod: ECS Fargate (production cluster)
```

Infrastructure deployment is separate via AWS CDK:
```
cdk deploy --env staging   # Staging infrastructure
cdk deploy --env production # Production infrastructure
```

---

## 9. Cost Estimation

### 9.1 Monthly Cost Breakdown (Hackathon / Demo Tier)

> **Note:** For hackathon/demo purposes, we target the "multi-flow agent" tier (3-5 tools, 1K-5K req/day) at approximately $2,400-$9,000/month at full production scale. For the hackathon demo itself, we will use minimal configurations and AWS free tier / credits to keep costs under $500/month.

| Service | Configuration | Est. Monthly Cost |
|---|---|---|
| **Amazon Bedrock (LLM Inference)** | ~1,000 req/day, model tiering (Haiku + Sonnet) | $300 - $600 |
| **ECS Fargate (Agents)** | 8 tasks × 0.5 vCPU × 1GB, avg 30% utilization | $80 - $120 |
| **Aurora Serverless v2 (PostgreSQL)** | 2 ACU min, 16 ACU max, ~20GB storage | $90 - $130 |
| **DynamoDB** | On-demand, ~100K reads/writes/day | $15 - $25 |
| **ElastiCache Redis** | cache.t3.micro, single node | $12 - $15 |
| **OpenSearch Serverless** | 2 OCU min, small collection | $100 - $150 |
| **S3** | ~5GB data lake + assets | $1 - $5 |
| **CloudFront** | Low traffic for demo | $5 - $10 |
| **API Gateway** | ~1,000 req/day | $3 - $5 |
| **SQS** | ~5,000 messages/day | Free tier |
| **Step Functions** | ~1,000 state transitions/day | $2 - $5 |
| **EventBridge** | ~1,000 events/day | $1 - $3 |
| **CloudWatch + X-Ray** | Logs (~10GB/month) + traces | $10 - $20 |
| **Cognito** | <1,000 users | Free tier |
| **NAT Gateway** (if no VPC endpoints) | 1 NAT + ~5GB data processing | $35 - $45 |
| **VPC Endpoints** | S3 + DynamoDB (free) + Bedrock interface | $7 - $10 |
| **Estimated Total** | | **$670 - $1,150/month** |

### 9.2 Hidden Cost Watchlist

| Hidden Cost | Estimated Impact | Mitigation |
|---|---|---|
| NAT Gateway data processing ($0.045/GB) | $600-$2,400/month at scale | Use VPC endpoints for AWS-internal traffic; use Bedrock interface endpoint instead of NAT |
| Inter-AZ data transfer ($0.01-$0.02/GB) | $1,200-$3,600/month at scale | Minimize cross-AZ traffic; co-locate agents + DB in same AZ where possible |
| CloudWatch Logs ingest ($0.50/GB) | $15-$40/agent/month | Set log retention to 7 days for demo; use sampling for debug logs |
| Bedrock prompt token costs | Scales linearly with requests | Enable prompt caching; use Haiku for simple tasks; cache FAQ responses |
| OpenSearch OCU (always-on minimum) | $100+/month even with no traffic | Use OpenSearch Serverless with auto-scaling; stop collection when not in use |

### 9.3 Cost Comparison: Production Scale

| Tier | Daily Requests | Monthly AWS Cost | Use Case |
|---|---|---|---|
| Hackathon Demo | ~1,000/day | $670 - $1,150 | Proof of concept, judging |
| Multi-flow agent | 1K-5K/day | $2,400 - $9,000 | Small e-commerce, pilot |
| Full ops agent | 5K-25K/day | $9,000 - $22,000 | Mid-market e-commerce |
| Enterprise multi-agent | 25K+/day | $22,000 - $45,000 | Large-scale e-commerce |

### 9.4 Cost Optimization Levers (Ranked)

1. **Prompt caching** — Bedrock + Claude prompt caching reduces input token costs by up to 90% for repeated system prompts
2. **Model right-sizing** — Use Haiku for routing/simple tasks, Sonnet only for complex reasoning (saves 40-60%)
3. **VPC endpoints** — Eliminates NAT Gateway data processing fees for AWS-internal traffic
4. **CloudWatch retention** — Reduce log retention to 7-14 days for demo; sample debug logs
5. **Aurora auto-scaling** — Set minimum ACU to 0.5 for demo; scale up only during active testing
6. **OpenSearch Serverless** — Auto-scales to zero when idle; use only for demo queries
7. **ECS Fargate spot** — Use Spot capacity for non-critical agents (50-70% cheaper)
8. **Reserved instances** — For production: Aurora + ElastiCache reserved instances (30-40% savings)

---

## 10. Implementation Roadmap & Sprint Plan

### 10.1 Hackathon Timeline (Assuming 48-72 Hour Hackathon)

```
Hour 0-4:    Setup & Architecture Finalization
Hour 4-12:   Database + Infrastructure Setup
Hour 12-24:  Agent Development (Core 3 Agents)
Hour 24-36:  Agent Development (Remaining Agents) + Frontend
Hour 36-44:  Integration + End-to-End Testing
Hour 44-48:  Deployment + Presentation Prep
```

### 10.2 Detailed Sprint Breakdown

#### Sprint 1: Setup & Foundation (Hour 0-4)

| Task | Owner | Deliverable |
|---|---|---|
| Finalize architecture document | Both | This document reviewed & approved |
| Initialize Git repo + monorepo structure | Person A | GitHub repo with `frontend/`, `backend/`, `agents/`, `infra/` |
| Set up AWS CDK project | Person B | CDK app with VPC, subnets, basic IAM roles |
| Create GitHub Actions CI/CD skeleton | Person A | Build pipeline with lint + test |

**Monorepo structure:**
```
ai-ecommerce-platform/
├── frontend/              # Next.js dashboard
│   ├── app/
│   ├── components/
│   ├── lib/
│   └── package.json
├── agents/                # LangGraph multi-agent system
│   ├── supervisor/         # Orchestrator agent
│   ├── inventory/          # Inventory agent
│   ├── order/              # Order agent
│   ├── support/            # Customer support agent
│   ├── pricing/            # Pricing agent
│   ├── marketing/          # Marketing agent
│   ├── logistics/          # Logistics agent
│   ├── shared/             # Shared tools, state, utils
│   └── Dockerfile
├── infra/                  # AWS CDK infrastructure
│   ├── lib/
│   │   ├── vpc-stack.ts
│   │   ├── database-stack.ts
│   │   ├── agent-stack.ts
│   │   ├── api-stack.ts
│   │   └── monitoring-stack.ts
│   └── bin/
├── docs/                   # Project documentation
│   ├── architecture.md
│   ├── api-spec.yaml       # OpenAPI spec
│   ├── db-schema.sql
│   └── presentation.md
└── scripts/                # Seed data, setup scripts
    ├── seed-data.py
    └── setup-kb.py         # OpenSearch index setup
```

#### Sprint 2: Database & Infrastructure (Hour 4-12)

| Task | Owner | Deliverable |
|---|---|---|
| Deploy Aurora Serverless v2 via CDK | Person B | Running PostgreSQL instance |
| Create all DB tables (run schema SQL) | Person B | Schema deployed, seed data loaded |
| Deploy DynamoDB tables (checkpoints, review queue) | Person B | Tables created with correct keys |
| Deploy ElastiCache Redis | Person B | Redis cluster running |
| Set up OpenSearch Serverless + create indexes | Person B | Vector indexes ready |
| Create seed data script (products, customers, orders) | Person A | 50 products, 100 customers, 200 orders |
| Set up Bedrock model access (Haiku + Sonnet + Titan) | Person A | Bedrock models accessible |
| Deploy S3 buckets (assets, data lake) | Person B | Buckets created with policies |

#### Sprint 3: Core Agent Development (Hour 12-24)

| Task | Owner | Deliverable |
|---|---|---|
| Build LangGraph supervisor/orchestrator | Person A | Supervisor can route tasks to agents |
| Build InventoryAgent (stock monitoring + reorder) | Person A | Agent checks stock, generates PO drafts |
| Build OrderAgent (order processing + tracking) | Person B | Agent processes orders, updates status |
| Build SupportAgent (ticket handling + RAG) | Person A | Agent resolves tickets using FAQ KB |
| Set up Bedrock Guardrails | Person B | Content filter + policy enforcement |
| Create agent Dockerfile + ECS task definitions | Person B | Agents containerized |
| Deploy agents to ECS Fargate | Person B | Agents running, consuming from SQS |

#### Sprint 4: Remaining Agents + Frontend (Hour 24-36)

| Task | Owner | Deliverable |
|---|---|---|
| Build PricingAgent (dynamic pricing) | Person A | Agent adjusts prices within bounds |
| Build MarketingAgent (campaign generation) | Person A | Agent generates + sends campaigns |
| Build LogisticsAgent (carrier selection + tracking) | Person B | Agent creates shipments, tracks |
| Build Next.js admin dashboard | Person A | Dashboard with KPIs, agent status, review queue |
| Build customer-facing pages (order tracking, support) | Person B | Customer can track orders, create tickets |
| Set up API Gateway + Lambda (BFF) | Person B | REST API operational |
| Set up WebSocket for real-time updates | Person A | Dashboard receives live updates |

#### Sprint 5: Integration & Testing (Hour 36-44)

| Task | Owner | Deliverable |
|---|---|---|
| End-to-end integration: order → inventory → logistics | Both | Full order lifecycle working |
| End-to-end: customer complaint → support → refund | Both | Support flow with human-in-loop |
| End-to-end: competitor price → pricing → marketing | Both | Dynamic pricing + campaign trigger |
| Human-in-the-loop review queue testing | Person A | PO/refund/campaign approval flows |
| Error handling + fallback testing | Person B | Agents degrade gracefully on LLM failure |
| Load testing with sample traffic | Person B | System handles 100 concurrent requests |

#### Sprint 6: Deployment + Presentation (Hour 44-48)

| Task | Owner | Deliverable |
|---|---|---|
| Production deployment (CDK deploy) | Person B | Full stack deployed on AWS |
| Smoke testing production | Both | All endpoints responding |
| Create presentation deck | Person A | 10-slide presentation ready |
| Create demo script | Person B | Step-by-step demo walkthrough |
| Record demo video (backup) | Person A | 3-minute demo video |
| Final documentation review | Both | All docs complete and in repo |

### 10.3 If Hackathon is Longer (1-2 Weeks)

If the hackathon extends beyond 48 hours, add these sprints:

| Sprint | Duration | Focus |
|---|---|---|
| Sprint 7 | Days 4-5 | Agent fine-tuning, prompt optimization, edge case handling |
| Sprint 8 | Days 6-7 | QuickSight dashboards, advanced analytics, A/B testing for pricing |
| Sprint 9 | Days 8-9 | Security hardening, load testing, cost optimization |
| Sprint 10 | Days 10+ | Final polish, documentation, presentation prep |

---

## 11. Task Division (2-Person Team)

### 11.1 Role Definitions

#### Person A: Agent & AI Lead

**Focus:** Multi-agent system, AI logic, frontend dashboard

| Domain | Responsibilities |
|---|---|
| LangGraph framework | Supervisor + all agent graph definitions |
| Agent prompts | System prompts, tool definitions, reasoning chains |
| Bedrock integration | Model tiering, prompt caching, guardrails |
| RAG pipeline | OpenSearch indexing, embedding generation, retrieval |
| Frontend dashboard | Next.js admin dashboard (agent status, KPIs, review queue) |
| Presentation | Architecture diagrams, demo script |

#### Person B: Infrastructure & Backend Lead

**Focus:** AWS infrastructure, database, API, deployment

| Domain | Responsibilities |
|---|---|
| AWS CDK | All infrastructure stacks (VPC, DB, ECS, API) |
| Database | Schema design, migration scripts, seed data |
| API layer | API Gateway, Lambda functions, WebSocket |
| ECS deployment | Dockerfiles, task definitions, auto-scaling |
| CI/CD | GitHub Actions, CodePipeline, ECR |
| Observability | CloudWatch dashboards, alarms, X-Ray |
| Cost monitoring | AWS Cost Explorer, budget alerts |

### 11.2 Collaboration Points

| Activity | When | Format |
|---|---|---|
| Architecture review | Start of hackathon | 30-min whiteboard session |
| API contract agreement | After Sprint 1 | Define API spec, both implement against it |
| Integration checkpoints | End of Sprint 3, 4, 5 | Joint testing of agent ↔ API ↔ DB |
| Demo rehearsal | Hour 44-46 | Full walkthrough with both presenting |

### 11.3 Communication Protocol

- **Git:** Trunk-based development, short-lived branches, PR reviews for all merges
- **Shared state:** A `decisions.md` file in the repo documenting all architecture decisions and their rationale
- **Daily syncs:** 5-minute standup every 4 hours during hackathon to surface blockers

---

## 12. Presentation Structure

### 12.1 Presentation Outline (10 Minutes)

| Slide | Title | Duration | Content |
|---|---|---|---|
| 1 | Title + Problem | 30 sec | Problem statement, market context ($20.9B AI retail spend in 2026) |
| 2 | Solution Overview | 1 min | Multi-agent platform concept, 6 agents + orchestrator, autonomous operations |
| 3 | Architecture Diagram | 1 min | High-level AWS architecture, explain agent clusters + shared state |
| 4 | Multi-Agent Design | 1 min | LangGraph, supervisor pattern, model tiering, human-in-the-loop |
| 5 | Live Demo: Order Flow | 2 min | Customer places order → OrderAgent → InventoryAgent → LogisticsAgent → tracking |
| 6 | Live Demo: Support Flow | 1.5 min | Customer complaint → SupportAgent → RAG resolution → refund with human approval |
| 7 | Live Demo: Pricing + Marketing | 1 min | Competitor price drop → PricingAgent → MarketingAgent campaign trigger |
| 8 | Tech Stack & Innovation | 1 min | LangGraph + Bedrock + ECS, model tiering, checkpointing, guardrails |
| 9 | Cost Analysis | 30 sec | Cost tiers, optimization levers, $670/mo for demo |
| 10 | Future Roadmap + Q&A | 30 sec | Fine-tuning, multi-tenant, A2A protocol, UCP integration |

### 12.2 Demo Script

**Demo 1: Order Lifecycle (2 min)**
1. Show admin dashboard with all agents "idle/ready"
2. Place an order via customer-facing page (or API call)
3. Show OrderAgent picking up the task (status: processing)
4. Show InventoryAgent reserving stock (status: stock reserved)
5. Show LogisticsAgent selecting carrier + creating shipment
6. Show order status updating to "shipped" with tracking number
7. Show admin dashboard KPIs updating in real-time

**Demo 2: Customer Support with Human-in-Loop (1.5 min)**
1. Customer creates a support ticket: "My order arrived damaged"
2. SupportAgent classifies: defective_item, priority: high
3. Agent retrieves order history, checks return policy
4. Agent initiates refund ($150 > $100 threshold) → routes to review queue
5. Admin approves refund from review queue
6. SupportAgent notifies customer, updates ticket as resolved
7. Show agent confidence score + reasoning in task log

**Demo 3: Dynamic Pricing + Marketing (1 min)**
1. Simulate competitor price drop via API
2. PricingAgent detects, analyzes margin impact
3. Agent adjusts price within ±15% bounds
4. Show price_history table with reasoning ("competitor_drop, margin 22%")
5. MarketingAgent receives overstock/promotion trigger
6. Agent generates clearance campaign content
7. Show campaign in review queue → admin approves → "sent"

### 12.3 Presentation Tips

- **Start with the problem, not the tech** — judges care about the business impact
- **Show, don't tell** — live demos are more impactful than slides
- **Highlight autonomy** — emphasize that agents act without human intervention (except for guarded approvals)
- **Show the dashboard** — the admin dashboard is the "wow" moment; real-time agent status + KPIs
- **Have a backup video** — if live demo fails, have a 3-minute screen recording ready
- **Mention cost awareness** — judges love teams that understand cloud economics

---

## 13. Project Documentation Checklist

### 13.1 Required Documents

| Document | Format | Location | Status |
|---|---|---|---|
| Architecture document | Markdown | `docs/architecture.md` | ☐ |
| API specification | OpenAPI YAML | `docs/api-spec.yaml` | ☐ |
| Database schema | SQL + ERD | `docs/db-schema.sql` | ☐ |
| Cost estimation | Markdown | `docs/cost-estimation.md` | ☐ |
| Deployment guide | Markdown | `docs/deployment-guide.md` | ☐ |
| Presentation deck | PDF/PPTX | `docs/presentation.pdf` | ☐ |
| Demo video | MP4 | `docs/demo-video.mp4` | ☐ |
| README | Markdown | `README.md` | ☐ |
| Agent design docs | Markdown | `docs/agents/` | ☐ |

### 13.2 README Template

```markdown
# AI-Powered Autonomous E-Commerce Operations Platform

## Overview
A multi-agent AI platform that automates end-to-end e-commerce operations 
including inventory management, order processing, customer support, 
dynamic pricing, marketing, and logistics.

## Architecture
- **Agent Framework:** LangGraph (directed graph orchestration)
- **LLM:** Amazon Bedrock (Claude 3.5 Haiku + Sonnet)
- **Cloud:** AWS (ECS Fargate, Aurora Serverless, DynamoDB, etc.)
- **Frontend:** Next.js 15 + TypeScript
- **Infra:** AWS CDK (TypeScript)

## Quick Start
1. Prerequisites: Node.js 20+, Python 3.11+, AWS CLI, Docker
2. Clone repo
3. Deploy infrastructure: `cd infra && cdk deploy --all`
4. Start agents: `cd agents && docker build -t agents . && docker run agents`
5. Start frontend: `cd frontend && npm install && npm run dev`

## Demo
- Admin Dashboard: https://dashboard.your-domain.com
- Customer Portal: https://shop.your-domain.com
- API: https://api.your-domain.com

## Team
- Person A — Agent & AI Lead
- Person B — Infrastructure & Backend Lead

## Documentation
- [Architecture](docs/architecture.md)
- [API Spec](docs/api-spec.yaml)
- [Database Schema](docs/db-schema.sql)
- [Cost Estimation](docs/cost-estimation.md)
- [Deployment Guide](docs/deployment-guide.md)
```

### 13.3 Deployment Guide Template

```markdown
# Deployment Guide

## Prerequisites
- AWS account with Bedrock model access enabled
- AWS CLI v2 configured with credentials
- Node.js 20+ and Python 3.11+
- Docker Desktop
- AWS CDK v2 installed (`npm install -g aws-cdk`)

## Step 1: Deploy Infrastructure
cd infra/
cdk bootstrap
cdk deploy --all --context env=staging

## Step 2: Deploy Database Schema
# Get Aurora endpoint from CDK output
export DATABASE_URL="postgresql://user:pass@aurora-endpoint:5432/ecommerce"
python scripts/run-migrations.py
python scripts/seed-data.py

## Step 3: Set Up RAG Knowledge Base
python scripts/setup-kb.py --opensearch-endpoint <endpoint>

## Step 4: Build & Deploy Agents
cd agents/
docker build -t ai-ecommerce-agents .
aws ecr get-login-password | docker login --username AWS --password-stdin <account>.dkr.ecr.us-east-1.amazonaws.com
docker tag ai-ecommerce-agents <account>.dkr.ecr.us-east-1.amazonaws.com/agents:latest
docker push <account>.dkr.ecr.us-east-1.amazonaws.com/agents:latest
# ECS will auto-deploy new image

## Step 5: Deploy Frontend
cd frontend/
npm install
npm run build
# Deploy to S3 + CloudFront
aws s3 sync .next/static s3://frontend-bucket/static/
```

---

## 14. Risk Mitigation & Fallback Strategies

### 14.1 Technical Risks

| Risk | Probability | Impact | Mitigation | Fallback |
|---|---|---|---|---|
| Bedrock LLM API failure | Medium | High | Retry with exponential backoff (3 attempts) | Fall back to rule-based logic for critical operations (order processing, stock checks) |
| Agent infinite loop / hallucination | Medium | High | LangGraph max iterations (10); Bedrock Guardrails content filter | Supervisor kills agent after timeout, routes to human review |
| Aurora connection pool exhaustion | Low | Medium | Connection pooling via RDS Proxy; max connections configured | Use ElastiCache as read-through cache fallback |
| OpenSearch vector search timeout | Low | Medium | 5-second query timeout; fallback to keyword search | SupportAgent falls back to simple keyword match |
| ECS task crash | Low | Medium | ECS auto-restart policy; health checks | SQS retains messages for retry; dead-letter queue for poison messages |
| NAT Gateway cost overrun | High | Medium | VPC endpoints for all AWS-internal traffic | Monitor daily cost; set CloudWatch billing alarm at $50/day |

### 14.2 Hackathon-Specific Risks

| Risk | Mitigation |
|---|---|
| Demo fails live | Pre-recorded 3-minute demo video as backup |
| AWS deployment takes too long | Pre-deploy infrastructure before hackathon starts; use CDK for reproducibility |
| Agent prompts not working well | Prepare 5-10 tested prompt templates per agent beforehand |
| Time runs out | Prioritize: (1) Working deploy, (2) 3 core agents (Order, Support, Inventory), (3) Dashboard, (4) Remaining agents, (5) Presentation polish |
| Judge asks about scalability | Reference the enterprise cost tier ($22K-$45K/month) and architecture's auto-scaling design |
| Judge asks about security | Highlight WAF + Bedrock Guardrails + Cognito + human-in-the-loop for financial decisions |

### 14.3 Scope Reduction Priority

If time is running short, cut features in this order (least to most critical):

1. **Cut first:** MarketingAgent (standalone, least visible in demo)
2. **Cut second:** LogisticsAgent (can mock shipping carrier responses)
3. **Cut third:** PricingAgent (can show as "configured rules" instead of AI)
4. **Keep always:** Orchestrator + OrderAgent + InventoryAgent + SupportAgent + Dashboard
5. **Must have for demo:** At least one end-to-end flow working (order → inventory → tracking)

---

## 15. Deliverables Checklist

### 15.1 Required by Problem Statement

| Deliverable | Status | Location |
|---|---|---|
| Deployed web application | ☐ | CloudFront URL |
| Cloud-deployed AI agents | ☐ | ECS Fargate cluster |
| Solution architecture | ☐ | This document + `docs/architecture.md` |
| DB schema | ☐ | Section 6 + `docs/db-schema.sql` |
| Estimated costing | ☐ | Section 9 + `docs/cost-estimation.md` |
| Presentation | ☐ | `docs/presentation.pdf` |
| Project documentation | ☐ | `docs/` directory + README.md |

### 15.2 Bonus Deliverables (For Judges)

| Deliverable | Impact |
|---|---|
| Live demo video | Shows working product, not just slides |
| OpenAPI specification | Professional API documentation |
| AWS CDK infrastructure code | Shows IaC maturity |
| Cost optimization analysis | Demonstrates cloud economics awareness |
| Human-in-the-loop review queue | Shows responsible AI deployment |
| Agent task audit log | Shows transparency and accountability |

---

## Appendix A: Key AWS Service Links

| Service | Documentation | Pricing |
|---|---|---|
| Amazon Bedrock | https://docs.aws.amazon.com/bedrock/ | Pay-per-token |
| LangGraph on AWS | https://github.com/aws-samples/langgraph-multi-agent | — |
| Bedrock AgentCore | https://aws.amazon.com/bedrock/agentcore/ | Consumption-based |
| Aurora Serverless v2 | https://docs.aws.amazon.com/aurora/ | $0.12/ACU-hour |
| ECS Fargate | https://docs.aws.amazon.com/ecs/ | $0.04048/vCPU-hour |
| OpenSearch Serverless | https://docs.aws.amazon.com/opensearch-service/ | $0.024/OCU-hour |

## Appendix B: Reference Architecture Sources

- AWS Blog: "Build multi-agent systems with LangGraph and Amazon Bedrock" (April 2025)
- AWS Solutions Library: "Guidance for Multi-Agent Orchestration using LangGraph on AWS" (July 2025)
- AWS Solutions Library: "Guidance for Multi-Agent Orchestration using Bedrock AgentCore on AWS" (November 2025)
- AWS Marketplace: Multi-agent architectures with LangGraph workshop series
- Braincuber: "AI on AWS: Real Cost from 24 Builds" (February 2026)
- GuruSup: "Best Multi-Agent Frameworks in 2026" (May 2026)

---

*End of Document — Version 1.0*
