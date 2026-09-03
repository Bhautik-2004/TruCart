# TruCart — Estimated Costing

## Summary: **$0 / month**

TruCart is built and operated entirely on permanently-free service tiers — not
trials. This is a deliberate constraint: no paid service is used anywhere in the
stack. The table below maps every Expected-Solution capability to the free
service that provides it, its free-tier ceiling, and what would trigger the
first charge if the project ever outgrew it.

| Capability | Free service | Free-tier ceiling (as of writing) | First paid trigger |
|---|---|---|---|
| Web app hosting (dashboard) | **Vercel Hobby** | 100 GB bandwidth/mo, serverless function execution for personal use | Commercial use or exceeding bandwidth → Pro $20/mo |
| Database (Postgres + `pgvector`) | **Supabase Free** | 500 MB DB, 5 GB egress, 2 projects, pauses after 7 days idle | > 500 MB data or needing no-pause → Pro $25/mo |
| Agent backend (FastAPI + scheduler) | **Fly.io** free allowance / **Render** free web service / **Hugging Face Space** / **Oracle Cloud Always Free** VM | ~1 shared-CPU instance; Render free sleeps after 15 min idle, Oracle Always Free is genuinely always-on (2 AMD micro VMs) | Needing more RAM/CPU or guaranteed uptime |
| LLM inference | **Groq free** / **Google AI Studio free** / **OpenRouter** free models — or self-hosted **Ollama** `qwen2.5:7b` | Per-minute / per-day request caps (varies by provider) | Sustained high throughput → per-token pricing |
| Embeddings (support RAG) | **Ollama** `nomic-embed-text` (local, 768-dim) or a free embeddings API | Local: only your hardware | Managed embeddings API usage |
| LLM tracing / observability | **Langfuse Cloud Free** | 50k observations/mo | > 50k observations → Core $29/mo |
| Scheduled agent cycles | In-process **APScheduler** on the FastAPI host | none (runs in the existing process) | — (no separate cron service needed) |
| Auth | Self-issued HS256 JWT (`jose`) + bcrypt in FastAPI | none | — |
| Source / CI | GitHub free + GitHub Actions free minutes | 2,000 Actions min/mo (private) | Heavy CI usage |

### Operating notes for the $0 setup
- **LLM is optional at runtime.** `call_llm_json` returns `None` on any failure
  (rate-limited free key, provider down), and every agent falls back to a
  deterministic rule-based decision. Cost and availability risk are both bounded.
- **Supabase free pauses after 7 days idle** — a scheduled agent cycle (or any
  dashboard visit) keeps it warm; otherwise the first request after a pause is
  slow.
- **Render free sleeps after 15 min idle.** If the scheduler must fire on time,
  prefer Fly.io or the Oracle Always-Free VM, which stay up.
- Token usage is recorded per run in `agent_task_log.tokens_used` and in
  Langfuse, so "spend if this were a paid model" is measurable at any time.

## Appendix — if this were funded and run at scale on AWS

The original production design (`../ai-ecommerce-platform-plan.md` §9) estimates
**$670 – $1,150 / month** for a demo-scale AWS deployment (Bedrock, ECS Fargate,
Aurora Serverless v2, DynamoDB, ElastiCache, OpenSearch Serverless, Step
Functions, API Gateway + CloudFront + WAF), rising to ~$45,000/month at high
production scale. Those numbers are retained there for reference; they are **not**
what this project costs, which is $0.
