# Agent Reference Guide (Supabase + Local, No Docker)
## AI-Powered Autonomous E-Commerce Operations Platform

This is the updated reference for your stack:

- **No Docker** in local development.
- **Supabase** as the database and backend.
- **Local Ollama** for LLMs.
- **Python + LangGraph** for agents.
- **Next.js** for the admin dashboard.

It covers:
- how the agents are structured
- what each agent does
- how to simulate data for demos
- how the admin sidebar maps to agent activity
- how to use Supabase locally without Docker

---

## 1. Big Picture

The mental model is the same as before:

- The **orchestrator** is the manager.
- The **agents** are specialist employees.
- **Supabase** is the company memory (Postgres + auth + realtime).
- The **sidebar pages** are the admin control room.
- The **mock data / simulator** creates events so agents have work to do.

The only change is the infrastructure:

- Instead of Docker Postgres → you use **Supabase Postgres**.
- Instead of Docker Redis → you can skip it or use an in-memory cache.
- Instead of Docker vector DB → you use **pgvector in Supabase**.
- Instead of Docker Ollama → you run Ollama as a native app.

This keeps the same agent logic but changes how you connect to the database.

---

## 2. Supabase Setup (No Docker)

### 2.1 Create a Supabase project

1. Go to https://supabase.com
2. Create a new project (free tier is enough).
3. Choose a region close to you.
4. Wait for the project to be ready.

### 2.2 Get your connection details

In the Supabase dashboard:

- Go to **Project Settings → Database**.
- Copy the **Connection string (URI)**.
- You will use this as `DATABASE_URL` in your `.env`.

Example:

```text
postgresql://postgres:[YOUR-PASSWORD]@db.xxxxxxxxxxxxx.supabase.co:5432/postgres
```

### 2.3 Enable pgvector

In the Supabase SQL editor, run:

```sql
create extension if not exists vector;
```

This enables the `vector` type for RAG embeddings.

### 2.4 Run your schema

- Use the existing `schema.sql` from your project.
- Run it in the Supabase SQL editor or via the Supabase CLI.
- This creates all tables: `customers`, `products`, `orders`, `support_tickets`, `agent_task_log`, `review_queue`, `knowledge_base`, etc.

The database schema reference already describes all these tables and their roles. [file:159]

### 2.5 Environment variables

Create a `.env` file in your project root:

```bash
# Supabase
SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJ...your-anon-key
SUPABASE_SERVICE_ROLE_KEY=eyJ...your-service-role-key
DATABASE_URL=postgresql://postgres:[PASSWORD]@db.xxxxxxxxxxxxx.supabase.co:5432/postgres

# Ollama
OLLAMA_BASE_URL=http://localhost:11434

# App
NEXT_PUBLIC_API_URL=http://localhost:8001
```

You do **not** need Docker for any of this.

---

## 3. Agent Structure (Unchanged Logic)

The agent structure stays the same as in the previous guide. Only the database connection changes.

### Standard agent template

```python
agent = {
    "name": "inventory_agent",
    "role": "monitor stock and create purchase orders",
    "trigger": ["low_stock", "new_order", "stock_forecast"],
    "reads": ["inventory", "products", "order_items", "suppliers"],
    "writes": ["purchase_orders", "review_queue", "agent_task_log"],
    "tools": ["check_stock", "forecast_demand", "generate_purchase_order"],
    "approval_rules": {
        "po_auto_approve_limit": 5000
    }
}
```

### Database connection

Instead of a local Docker Postgres, you now connect to Supabase:

```python
from supabase import create_client

supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_SERVICE_ROLE_KEY")
supabase = create_client(supabase_url, supabase_key)
```

Or for raw SQL:

```python
import psycopg2

conn = psycopg2.connect(os.getenv("DATABASE_URL"))
```

All agent logic remains the same; only the connection string changes.

---

## 4. What Each Agent Does (Same as Before)

The agent responsibilities do not change. Only the backend changes.

### Orchestrator Agent

- Routes tasks to the right agent.
- Combines results.
- Sends risky actions to the review queue.
- Logs everything to `agent_task_log`.

### Inventory Agent

- Monitors stock.
- Forecasts demand.
- Creates purchase orders.
- Sends large POs to review queue.

### Order Agent

- Processes orders.
- Reserves stock.
- Updates order status.
- Handles returns.

### Support Agent

- Answers FAQs using `knowledge_base`.
- Resolves tickets.
- Escalates risky refunds.

### Pricing Agent

- Monitors competitor prices.
- Adjusts prices within limits.
- Logs changes to `price_history`.

### Marketing Agent

- Segments customers.
- Generates campaigns.
- Sends high-budget campaigns for approval.

### Logistics Agent

- Picks carriers.
- Creates shipments.
- Tracks delivery.

All of this matches the architecture document and database schema. [file:155][file:159]

---

## 5. How to Simulate Data (No Docker)

You still use the same three-layer data strategy:

1. **Real historical data** (Olist).
2. **Synthetic data** (Faker).
3. **Live event simulation** during demo. [file:156]

The only change is: instead of inserting into Docker Postgres, you insert into Supabase.

### 5.1 Seed real data

Use your existing transform scripts to:

- load customers
- load products
- load orders
- load order items
- load reviews as support tickets

Run these scripts once against your Supabase database.

### 5.2 Generate synthetic data

Use Python/Faker to generate:

- competitor prices
- suppliers
- extra support tickets
- campaigns
- agent task logs

Insert them into Supabase tables.

### 5.3 Live event simulator

Create a script that keeps firing events:

```python
while True:
    create_new_order()
    wait(30)
    create_support_ticket()
    wait(45)
    trigger_competitor_price_drop()
    wait(60)
    trigger_low_stock_alert()
```

Each function writes to Supabase:

- `orders` table for new orders.
- `support_tickets` for new tickets.
- `competitor_prices` for price changes.
- `inventory` updates for low stock.

The data strategy document specifically recommends this kind of live simulator for demos. [file:156]

---

## 6. Sidebar Pages and What They Show

The sidebar pages remain the same. Only the data source changes from local Postgres to Supabase.

### Recommended sidebar pages

- Dashboard
- Orders
- Inventory
- Support
- Pricing
- Marketing
- Logistics
- Agents
- Review Queue
- Audit Logs
- Settings

### What each page shows

| Page | What it shows | Why it matters |
|---|---|---|
| Dashboard | KPIs, alerts, active agents | Quick overview |
| Orders | order list, status, fulfillment | Order flow |
| Inventory | stock levels, reorder alerts | Stock control |
| Support | tickets, messages, refunds | Customer care |
| Pricing | competitor prices, price history | Pricing intelligence |
| Marketing | campaign drafts, metrics | Promo activity |
| Logistics | shipments, tracking, delays | Shipping flow |
| Agents | agent status, health, last action | Which agent is working |
| Review Queue | items pending approval | Human-in-the-loop |
| Audit Logs | all agent actions | Transparency |
| Settings | thresholds, limits, store config | Configurability |

Admin should still be able to:

- approve purchase orders
- approve refunds
- approve campaigns
- pause risky agents
- change thresholds
- inspect logs

This is supported by the admin endpoints and review queue in the architecture document. [file:155]

---

## 7. How to Use Local Ollama (No Docker)

Ollama runs as a native app, no Docker needed.

### Step 1: Install Ollama

```bash
# macOS / Linux
curl -fsSL https://ollama.com/install.sh | sh

# Windows
# download from ollama.com/download
```

### Step 2: Pull a model

```bash
ollama pull llama3.1:8b
ollama pull qwen3:8b
```

### Step 3: Start Ollama

Ollama runs as a background service on:

- `http://localhost:11434`

### Step 4: Connect LangGraph / LangChain

```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama",
    model="qwen3:8b",
    temperature=0.7,
)
```

### Step 5: Use in your agents

- Orchestrator: small fast model.
- OrderAgent: small fast model.
- LogisticsAgent: rule-heavy fast model.
- SupportAgent: slightly stronger model.
- PricingAgent: stronger model for reasoning.
- InventoryAgent: stronger model for forecasting.
- MarketingAgent: stronger model for copy generation.

This matches the model-splitting strategy in the zero-cost guide. [file:158]

---

## 8. Recommended Local Setup (No Docker)

Your local stack now looks like this:

- **Frontend:** Next.js dev server.
- **Agents:** Python + LangGraph.
- **Database:** Supabase Postgres (cloud).
- **LLM:** Ollama (native app).
- **Data:** seeded mock data + live simulator.

No Docker is involved.

### Practical folder idea

```text
ai-ecommerce-platform/
├── frontend/
│   ├── app/
│   ├── components/
│   └── package.json
├── agents/
│   ├── supervisor/
│   ├── inventory/
│   ├── order/
│   ├── support/
│   ├── pricing/
│   ├── marketing/
│   ├── logistics/
│   └── shared/
├── backend/
│   ├── api/
│   └── main.py
├── scripts/
│   ├── seed_data.py
│   ├── setup_kb.py
│   └── simulator.py
└── .env
```

---

## 9. Supabase-Specific Tips

### 9.1 Use Supabase client in Python

You can use the official Python client:

```bash
pip install supabase
```

```python
from supabase import create_client

supabase = create_client(
    os.getenv("SUPABASE_URL"),
    os.getenv("SUPABASE_SERVICE_ROLE_KEY")
)
```

Then:

```python
rows = supabase.table("products").select("*").execute()
```

### 9.2 Use Supabase Realtime for dashboard

For live updates on the dashboard:

- Enable Realtime on tables like `orders`, `support_tickets`, `agent_task_log`.
- In Next.js, use the Supabase JS client to subscribe:

```js
const channel = supabase
  .channel('orders')
  .on('postgres_changes', { event: '*', schema: 'public', table: 'orders' }, payload => {
    // update UI
  })
  .subscribe()
```

This gives you live KPI updates without WebSockets of your own.

### 9.3 Use Supabase Auth for admin login

- Create admin users in Supabase Auth.
- Use JWT tokens in your API.
- Protect admin routes with role checks.

This replaces the custom `users` table if you want, or you can keep both.

### 9.4 Use Supabase Storage for assets

If you need to store:

- campaign images
- product images
- exported reports

You can use Supabase Storage buckets instead of S3.

---

## 10. Best Demo Recipe (Updated for Supabase)

Same demo flow, but now powered by Supabase.

### Minimum working story

1. Open admin dashboard.
2. Show live KPI cards from Supabase.
3. Trigger a new order (insert into Supabase).
4. Show OrderAgent and InventoryAgent activity.
5. Show shipment creation.
6. Trigger a support ticket.
7. Show SupportAgent response.
8. Trigger competitor price drop.
9. Show PricingAgent and MarketingAgent response.
10. Show review queue for risky actions.

### What judges should understand

- The platform is autonomous.
- The orchestrator controls everything.
- Each agent has one clear responsibility.
- The admin can intervene when needed.
- The data is simulated but realistic.
- The whole thing runs locally using Ollama + Supabase.

---

## 11. Short Summary You Can Reuse

You can explain the platform like this:

> We built an e-commerce operations system where a central orchestrator routes work to specialized agents. Inventory handles stock, Orders handles order flow, Support handles customer issues, Pricing handles price changes, Marketing handles promotions, and Logistics handles shipment tracking. The admin dashboard shows status, logs, and approvals, while a simulator generates events so the agents appear active during the demo. We run the whole system locally using Ollama for LLMs and Supabase for the database, with no Docker.

---

## 12. Final Practical Advice

Keep the first version simple:

- one clear orchestrator
- 5 to 6 agents max
- one Supabase project
- one review queue
- one event simulator
- one admin dashboard
- one local Ollama model setup

Do not overcomplicate the first demo.

A narrow, working system is much better than a big system that does not finish.