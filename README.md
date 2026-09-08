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
| Backend | FastAPI, in `backend/` | Auth + `POST /api/agents/{name}/run` + orchestrator + `POST /api/simulate/orders`. Optional APScheduler loop. |
| Database | Supabase Postgres | Schema + seed as raw SQL in `database/migrations/` (001–016). RLS policies defined (see limitations). |
| LLM | Local **Ollama** (`qwen2.5:7b`) via the OpenAI-compatible API, or any free OpenAI-compatible endpoint | One JSON call per agent run; deterministic fallback if unreachable. |
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
live in `agent_config` (editable at `/dashboard/agents` → Configure).

---

## Documentation

Full docs are in [`docs/`](docs/README.md):
[architecture](docs/architecture.md) (with diagram) ·
[cost estimate](docs/cost-estimate.md) (**$0 / free-tier**) ·
[API reference](docs/api-reference.md) ·
[deployment guide](docs/deployment-guide.md) ·
[DB schema reference](database-schema-reference.md).

**Autopilot Ledger** (`/dashboard/ledger`) is the headline capability: every
autonomous decision is booked against a counterfactual "do nothing" baseline,
verified against the real outcome after a settle window, and rolled up into a
per-agent Trust Score. Agents that underperform get a one-click proposal to
tighten their own auto-approve limits (`docs/architecture.md` §4a).

---

## Scope & limitations (read before evaluating)

This is a time-boxed build. The following are **deliberately simulated**, not integrated:

- **Orders enter via a simulator.** There is no storefront/checkout; the "Simulate incoming
  orders" button on `/dashboard/orders` (`POST /api/simulate/orders`) inserts realistic
  orders for the agents to act on.
- **Autonomy** is a fixed-interval orchestrator cycle (`backend/scheduler.py`, enabled with
  `SCHEDULER_ENABLED=true`); there is no event-driven triggering. Agents also run on demand
  from `/dashboard/agents`.
- **Logistics** invents carrier, tracking number, and a flat shipping cost — no carrier API.
  Lifecycle transitions are time-driven (`transit_hours`), not carrier events.
- **Inventory** orders a fixed `reorder_quantity` (not demand-derived). It *does* now receive
  approved POs after `receiving_lead_days` and increment on-hand stock, but does not update
  `products.cost_price`. **Marketing** detects overstock with a coarse
  `on_hand > reorder_point × multiplier` test.
- **Marketing** "sends" a campaign by inserting a row — no email service. Campaign metrics
  are fabricated.
- **Support refunds** flip `orders.status`/`payment_status` — no payment gateway; refunds are
  whole-order only (no partial / RMA).
- **Customer notifications** are internal only — the `notifications` feed on the dashboard;
  no outbound email/SMS to customers.
- **Autopilot Ledger** grades the four judgement-call agents (pricing, inventory, marketing,
  support). Marketing and support outcomes are *modelled* (no real campaign metrics / CSAT),
  and are labelled "estimated" in the UI; order/logistics are not scored.
- **RAG:** the support agent retrieves from `knowledge_base` (pgvector) before triaging,
  but only after you run the embedding backfill; without it, it triages with no context.
- **Auth** is a signed httpOnly-cookie session (`jose` HS256, verified in `middleware.ts`)
  with password change and account deactivation; there is no signup, MFA, or session
  revocation store. The backend uses the Supabase service-role key (RLS bypassed
  server-side), so it must sit behind the web proxy in a real deployment.
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
3. `database/migrations/006_*.sql` … `016_*.sql`

`016_ledger.sql` is required for the Autopilot Ledger (tables `agent_action` /
`agent_policy`, RPCs `receive_purchase_order` / `release_order_reservation`).
The six agents still run without it — decisions just aren't recorded and stock
reservations aren't released on cancel/refund — so apply it before relying on
`/dashboard/ledger`.

The seeded admin is `admin@techbazaar.local` with password `trucart-demo` (a real
bcrypt hash ships in the seed, so you can log in immediately). To use a different
password, regenerate the hash and paste it into both
`database/migrations/005_seed_data.sql` and
`database/migrations/seed_data/02_users.sql`, then re-run that insert:
```bash
python -c "import bcrypt; print(bcrypt.hashpw(b'YOUR_PASSWORD', bcrypt.gensalt(rounds=10)).decode())"
```

Then embed the knowledge base for support-agent RAG (one-off, needs Ollama running):
```bash
npm run seed:rag   # = python -m backend.scripts.backfill_kb_embeddings
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
  main.py            FastAPI app + auth endpoints
  routers/agents.py    POST /api/agents/{name}/run, GET /api/agents/scheduler
  routers/simulate.py  POST /api/simulate/orders  (synthetic order intake)
  agents/            one module per agent + orchestrator.py + base.py
  scheduler.py       APScheduler orchestrator loop (SCHEDULER_ENABLED)
database/migrations/  numbered schema + seed SQL (001–016)
docs/                architecture, cost, API, deployment
packages/ui/         shared shadcn component library
```
