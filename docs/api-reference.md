# TruCart — API Reference

Two API surfaces:

- **FastAPI** (`backend/`) — agent execution, auth verification, simulation.
  Interactive docs are served live at `http://localhost:8000/docs` (Swagger) and
  `/redoc` when the backend is running; export with
  `curl localhost:8000/openapi.json > backend/openapi.json`.
- **Next.js route handlers** (`apps/web/app/api/`) — thin proxies the browser
  calls; they attach the session and forward to FastAPI. Gated by
  `middleware.ts` (valid `trucart_session` cookie required, except `/api/auth/*`).

## FastAPI endpoints

| Method | Path | Body / query | Purpose |
|---|---|---|---|
| GET | `/` , `/health` | — | Liveness. |
| POST | `/api/auth/login` | `{ email, password }` | Verify credentials (bcrypt/SHA1), in-memory rate limit 5 / 15 min per email+IP. Returns `{ status, user:{ id, email, full_name, role } }`. No token issued here — the web route signs the session. |
| POST | `/api/auth/change-password` | `{ user_id, current_password, new_password }` | Re-verifies current password, writes a fresh bcrypt hash. `user_id` is supplied by the web layer from the verified session, never the browser. |
| POST | `/api/agents/{agent_name}/run` | — | Run one agent. `agent_name` ∈ `inventory_agent, pricing_agent, support_agent, order_agent, marketing_agent, logistics_agent, orchestrator`. Returns `{ status, agent_name, log_id, correlation_id, summary:{ scanned, auto_executed, escalated } }`; HTTP 500 + `status:"error"` on failure. |
| GET | `/api/agents/scheduler` | — | `{ enabled, running, interval_minutes, last_cycle_at, last_cycle_status }` for the dashboard's autonomous-mode badge. |
| POST | `/api/simulate/orders` | `?count=1..50` (default 5), `?trigger_agents=true|false` | Insert realistic `orders` + `order_items` (≈15 % from a new customer). With `trigger_agents=true`, runs one orchestrator cycle afterwards. Returns `{ status, created, new_customers, order_ids, cycle? }`. |

## Next.js route handlers (browser-facing)

| Method | Path | Forwards to | Notes |
|---|---|---|---|
| POST | `/api/auth/login` | FastAPI `/api/auth/login` | On success signs the HS256 `trucart_session` cookie (httpOnly, 8 h). |
| POST | `/api/auth/logout` | — | Clears the cookie. |
| POST | `/api/agents/[agent_name]/run` | FastAPI `/api/agents/{agent_name}/run` | Auth-gated. |
| POST | `/api/simulate/orders` | FastAPI `/api/simulate/orders` | Auth-gated; passes `count` / `trigger_agents` through. |

## Server actions (not REST — invoked from dashboard components)

Defined in `apps/web/app/dashboard/actions.ts`, each runs on the server with the
Supabase service-role client and (where noted) the verified session user:

`updateReviewStatus(reviewId, status, { reviewerId, note })` · `updateProfileName`
· `changePassword` · `deactivateAccount` · `updateAgentConfig(agent, key, value)`
· `updateStoreConfig` · `updateOrderStatus` · `updateTicketStatus` ·
`insertTicket` / `insertTicketMessage` · `insertCampaign` · `insertProduct` ·
notification read/delete helpers.
