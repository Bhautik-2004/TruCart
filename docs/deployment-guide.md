# TruCart — Deployment Guide ($0 target)

> Status: **pending execution.** This is the runbook for the free-tier cloud
> deployment; the app currently runs locally only. Target rationale and limits
> are in `cost-estimate.md`.

## Target topology

| Piece | Service (free tier) |
|---|---|
| Dashboard (`apps/web`) | Vercel Hobby |
| Agent backend (`backend/`) | Fly.io free / Render free / Oracle Cloud Always Free VM |
| Database | Supabase Free (Postgres + `pgvector`) |
| LLM | Groq / Google AI Studio / OpenRouter free model, or Ollama on the VM |
| Tracing | Langfuse Cloud Free (optional) |

## Provision order

1. **Supabase project.** Create it, then in the SQL editor run, in order:
   1. `database/migrations/001_*.sql` … `005_*.sql`
   2. every file in `database/migrations/seed_data/` (`00_*` … `22_*`)
   3. `database/migrations/006_*.sql` … `015_*.sql`
   Confirm `pgvector` is enabled (migration 001 does this).
   Note the project URL and the **service-role** key.
2. **Knowledge-base embeddings** (support-agent RAG), once, with an LLM/embeddings
   endpoint reachable: `npm run seed:rag`.
3. **Agent backend.** Deploy `backend/` (uvicorn `backend.main:app`). Set env
   (below). Set `SCHEDULER_ENABLED=true` here so cycles run autonomously.
   Prefer Fly.io or the Oracle VM over Render free if the schedule must be
   punctual (Render free sleeps after 15 min idle).
4. **Dashboard.** Deploy `apps/web` to Vercel. Set env (below).
   `NEXT_PUBLIC_API_URL` = the backend's public URL.
5. **Smoke test** (see below).

## Environment variables

From `.env.example`. Split by tier:

**Backend host**
- `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`
- `OLLAMA_BASE_URL` + `OLLAMA_MODEL` (or the free LLM API base URL / key via the
  same `openai`-compatible settings), `EMBEDDING_MODEL`
- `SCHEDULER_ENABLED=true`, `ORCHESTRATOR_INTERVAL_MINUTES=10`
- optional: `LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`, `LANGFUSE_HOST`,
  `LANGFUSE_TRACING_ENVIRONMENT`

**Vercel (dashboard)**
- `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` (server components read Supabase
  directly)
- `NEXT_PUBLIC_API_URL` = backend public URL
- `SESSION_SECRET` = a long random string
  (`node -e "console.log(require('crypto').randomBytes(48).toString('base64url'))"`)
  — **required**; the app refuses to start in production without it.

## Smoke test

1. `GET <backend>/health` → `{ "status": "ok" }`.
2. Load the dashboard, log in with `admin@techbazaar.local` / `trucart-demo`
   (or your reseeded password). Confirm redirect to `/dashboard`.
3. `GET <backend>/api/agents/scheduler` → `enabled:true`.
4. `/dashboard/orders` → "Simulate incoming orders" → new rows appear.
5. `/dashboard/agents` → "Run full cycle" → summary toast; `/dashboard/audits`
   shows an `orchestrator` row with non-zero `tokens_used` (if an LLM is
   configured); `/dashboard/notifications` shows fresh agent notifications.
6. Wait one `ORCHESTRATOR_INTERVAL_MINUTES`; a new `orchestrator` cycle appears
   with no manual action.

## Rollback

Vercel and Fly/Render keep previous deploys — redeploy the prior build. The
database is migration-based; keep a Supabase backup before re-running migrations.
