# TruCart

An admin platform for **AI-assisted e-commerce operations**. A store's day-to-day work —
restocking, order confirmation, shipment progress, competitor-driven pricing, clearance
campaigns, and support-ticket triage — is handled by six domain agents that either act within
configured guardrails or push a decision to a human **review queue**.

Demo scenario: **TechBazaar**, a fictional Indian electronics retailer.

---

## What actually runs in this build

| Layer | Tech | Notes |
|---|---|---|
| Dashboard | Next.js 16 (App Router) + shadcn/ui, in `apps/web` | Server components read Supabase directly; server actions for mutations. |
| Backend | FastAPI, in `backend/` | One login endpoint + `POST /api/agents/{name}/run`. |
| Database | Supabase Postgres | Schema + seed as raw SQL in `database/migrations/`. RLS policies defined (see limitations). |
| LLM | Local **Ollama** (`qwen2.5:7b`) via the OpenAI-compatible API | One JSON call per agent run. |
| Tracing | **Langfuse** (optional) | Best-effort; if keys are unset, agents run with tracing silently disabled. |

### The six agents (`backend/agents/`)

| Agent | What it does | LLM role |
|---|---|---|
| `inventory_agent` | Finds stock at/below reorder point, raises purchase orders (auto-approve under `po_auto_approve_limit`, else review). | Writes the restock justification text. |
| `pricing_agent` | Reprices on our own economics: the unit cost of the latest purchase order vs. a target gross margin, days of stock cover given recent sales, and time since the last change. Proposes which products to raise/reduce and to what, within a margin floor and a max-change cap. No competitor analysis. | Judges each move (raise/reduce/hold + target price + urgency) within the deterministic guardrails. |
| `support_agent` | Triages open tickets: resolve / refund / escalate. | **Chooses the action** and confidence. |
| `order_agent` | Confirms paid pending orders, reserves stock, escalates payment/stock problems. | None (rules only). |
| `marketing_agent` | Detects overstock, drafts a clearance campaign (auto-activate under budget cap, else review). | Writes subject / body / segment. |
| `logistics_agent` | Advances shipment lifecycle (label → in transit → delivered), flags stalled shipments. | None (rules only). |

Guardrail thresholds live in the `store_config` table
(`po_auto_approve_limit`, `refund_auto_approve_limit`, `price_change_max_pct`); per-agent knobs
live in `agent_config`.

---

## Scope & limitations (read before evaluating)

This is a time-boxed build. The following are **deliberately simulated**, not integrated:

- **Agents run on demand**, from the "Run Agent" button on `/dashboard/agents`. There is no
  scheduler yet, so "autonomous / 24-7" describes the intended operating mode, not this build.
- **No orchestrator.** Each agent runs independently; they do not call each other.
- **Pricing** uses `products.cost_price` and the most recent `approved`/`received` purchase
  order as the cost basis; it does not itself update `cost_price` when stock is received.
- **Logistics** invents carrier, tracking number, and a flat shipping cost — no carrier API.
  Lifecycle transitions are time-driven (`transit_hours`), not carrier events.
- **Inventory** still orders a fixed `reorder_quantity` (not demand-derived), and an
  auto-approved PO does not itself increment stock. **Marketing** detects overstock with a
  coarse `on_hand > reorder_point × multiplier` test and may promote a product the pricing
  agent has just marked down in the same cycle.
- **Marketing** "sends" a campaign by inserting a row — no email service.
- **Support refunds** flip `orders.status`/`payment_status` — no payment gateway.
- **RAG:** the support agent retrieves from `knowledge_base` (pgvector) before triaging,
  but only after you run the embedding backfill; without it, it triages with no context.
- **Auth** is a login endpoint + a client-side check; it is not a hardened session yet, and the
  backend uses the Supabase service-role key (RLS is bypassed server-side).
- Some seed tables (`agent_task_log`, `agent_config`, `notifications`) contain generated demo
  rows; treat historical numbers there as illustrative.

The AWS / Bedrock / LangGraph / multi-agent-orchestration design in
`ai-ecommerce-platform-plan.md` is the **production target**, not what is implemented here.
`hackathon-context.md` explains the local-first substitutions.

---

## Setup

### Prerequisites
- Node 20+, npm 11+
- Python 3.11+
- [Ollama](https://ollama.com) with `ollama pull qwen2.5:7b` and `ollama pull nomic-embed-text`
- A Supabase project

### 1. Install
```bash
npm install
pip install -r backend/requirements.txt      # or requirements-dev.txt for tests
```
Backend smoke tests: `python -m pytest backend/tests`

### 2. Environment
Copy `.env.example` to `.env.local` at the repo root (the FastAPI backend reads this) and to
`apps/web/.env.local` (Next.js reads this). Fill in:
- `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` — browser client
- `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` — server-side only
- `NEXT_PUBLIC_API_URL` — FastAPI base, default `http://localhost:8000`
- `OLLAMA_BASE_URL`, `OLLAMA_MODEL=qwen2.5:7b`
- `LANGFUSE_*` — optional

Do **not** put `SUPABASE_SERVICE_ROLE_KEY` in `apps/web/.env.local`; the backend `.env.local`
is the only place it belongs.

### 3. Database
In the Supabase SQL editor, run in order:
1. `database/migrations/001_*.sql` … `005_*.sql`
2. every file in `database/migrations/seed_data/` in numeric order (`00_*` … `22_*`)
3. `database/migrations/006_*.sql` … `015_*.sql`

The seeded admin is `admin@techbazaar.local`. Its password hash in the seed is a placeholder —
replace it with a real bcrypt hash to log in:
```bash
python -c "import bcrypt; print(bcrypt.hashpw(b'YOUR_PASSWORD', bcrypt.gensalt()).decode())"
```
Paste the result into `database/migrations/005_seed_data.sql` and
`database/migrations/seed_data/02_users.sql`, then re-run that insert.

Then embed the knowledge base for support-agent RAG (one-off, needs Ollama running):
```bash
python -m backend.scripts.backfill_kb_embeddings
```

### 4. Run
```bash
npm run dev:all          # Next on :3000 + FastAPI on :8000
# or separately:
npm run dev              # Next only
npm run dev:python       # FastAPI only
ollama serve            # if not already running
```
Open http://localhost:3000.

---

## Repo layout
```
apps/web/          Next.js dashboard
  app/dashboard/   one folder per screen (page.tsx = server fetch, *-client.tsx = UI)
  app/api/         thin route handlers (agent-run proxy is the one the UI uses)
backend/
  main.py          FastAPI app + /api/auth/login
  routers/agents.py  POST /api/agents/{name}/run
  agents/          one module per agent + base.py (LLM, Langfuse, DB helpers)
database/migrations/  numbered schema + seed SQL
packages/ui/       shared shadcn component library
```
