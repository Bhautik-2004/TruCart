# AI-Powered Autonomous E-Commerce Operations Platform
## Hackathon Context — Open-Source, Local-First Build

> **Team:** 2 Members
> **Problem Statement:** Multi-agent AI platform automating end-to-end e-commerce operations (inventory, orders, support, pricing, marketing, logistics).
> **Constraint:** Time-limited hackathon. Paid LLM APIs too costly; free-tier APIs insufficient to orchestrate all agents.
> **Strategy:** Maximize open-source, self-hosted components. Build custom where no open-source fit exists. Keep the original AWS-based plan as the "cloud-ready" story, but actually run everything locally.

---

## 1. Why This Approach

The original plan (`ai-ecommerce-platform-plan.md`) specs a fully AWS-managed architecture: Bedrock, Aurora, DynamoDB, OpenSearch, ECS Fargate, Step Functions, Cognito, etc. That's the right shape for production, but wrong for a hackathon:

- Too costly to run live LLM calls for 6+ agents on metered APIs.
- Too slow to provision/deploy across a 2-person team in limited time.
- Judges care about a working demo, not necessarily a live AWS account.

**Fix:** keep the multi-agent architecture and LangGraph orchestration exactly as designed, but swap every managed AWS service for a self-hosted open-source equivalent, run via Docker Compose on a laptop. Frame it in the presentation as "cloud-ready and model-agnostic" — swapping back to Bedrock/AWS later is a config change, not a rewrite.

---

## 2. Core Cost Problem: LLM Calls

Solved with two tools sitting in front of every agent:

- **Ollama** — runs models locally (Llama 3.1 8B, Qwen2.5 7B/14B, Phi-4). No GPU needed for a working demo; quantized 7–8B models run fine on CPU. With a GPU, 14B is comfortable.
- **LiteLLM** (self-hosted proxy) — routes every agent call. Defaults to local Ollama; falls back to a paid/free API key *only* for the few agents that genuinely need stronger reasoning. Also handles response caching so repeated calls during testing/demo don't burn quota.

Model tiering from the original plan still applies — just point the "cheap/fast" tier at Ollama and the "capable" tier at your one reserved paid key, both routed through LiteLLM.

---

## 3. Service Swap Table

| Original AWS Service | Open-Source Local Replacement |
|---|---|
| Amazon Bedrock | Ollama + LiteLLM |
| Aurora PostgreSQL | Postgres (Docker) |
| DynamoDB (agent checkpoints) | Postgres — LangGraph has a native Postgres checkpointer, no separate NoSQL store needed |
| ElastiCache Redis | Redis (Docker) |
| OpenSearch (RAG / vector search) | pgvector extension on the same Postgres instance (or Qdrant if RAG scope grows) |
| Amazon S3 | MinIO (S3-compatible) or local disk for the demo |
| SQS / EventBridge | Redis Streams, or plain in-process function calls at this scale |
| AWS Step Functions | Not needed — LangGraph's graph *is* the orchestrator |
| Amazon Cognito | Skipped for demo, or NextAuth with a local user table |
| CDK / ECS Fargate | Docker Compose |
| CloudWatch + X-Ray | Prometheus + Grafana (infra metrics) + Langfuse (LLM-specific tracing: tokens, latency, tool calls per agent) |
| AWS WAF / API Gateway | Not needed at hackathon scale — Next.js API routes are the backend |
| Glue / Athena / QuickSight | Skipped — a dashboard page reading directly from Postgres is enough |

**Kept as-is from the original plan:** LangGraph (agent framework, supervisor pattern), Next.js + TypeScript frontend, Tailwind + shadcn/ui, agent decomposition (Orchestrator, Inventory, Order, Support, Pricing, Marketing, Logistics).

---

## 4. Minimal Local Stack

```
postgres        # transactional data + pgvector for RAG
redis           # cache, session state, agent scratch pads
ollama          # local LLM inference
litellm         # LLM routing/proxy: local-first, cloud fallback, caching
langfuse        # LLM observability/tracing (self-hosted)
prometheus      # optional: infra metrics
grafana         # optional: infra dashboards
```
Plus: LangGraph agents (Python) and the Next.js frontend, run as normal processes or their own containers.

Run everything with a single `docker compose up`.

---

## 5. Additional Open-Source Options (add only if a gap appears)

| Need | Tool |
|---|---|
| Input/output guardrails, PII redaction, jailbreak detection | Guardrails AI, NeMo Guardrails |
| Higher-throughput LLM serving (GPU available) | vLLM |
| Lightest-weight CPU-only serving | llama.cpp |
| Vector DB beyond pgvector | Qdrant, Weaviate, or Chroma (simplest, less production-grade) |
| All-in-one backend (Postgres + Auth + Storage + Realtime) | **Supabase (self-hosted)** — strongest recommendation; collapses several services into one, saves real setup time for a 2-person team |
| Visual agent/workflow prototyping | Flowise, LangFlow, or Dify |
| Log aggregation alongside Grafana | Loki |
| Load/demo testing (simulate concurrent orders/tickets) | Locust |
| Reverse proxy / routing / rate-limiting | Traefik |

**Recommendation:** don't add all of these. The core stack in Section 4 is complete and sufficient. The one addition worth strongly considering is **Supabase self-hosted**, since it replaces three services with one. Everything else is optional polish, added only if a specific gap shows up while building.

---

## 6. Agent Design (unchanged from original plan)

| Agent | Role | Model Tier | Autonomy |
|---|---|---|---|
| Orchestrator | Task routing, coordination, conflict resolution | Cheap/fast (Ollama) | System-level |
| InventoryAgent | Stock monitoring, demand forecasting, auto-reorder | Capable | Semi-autonomous (PO > $5,000 needs approval) |
| OrderAgent | Order processing, tracking, fulfillment, returns | Cheap/fast, capable for edge cases | Fully autonomous for standard orders |
| SupportAgent | Query resolution, complaints, refunds, escalation | Capable | Autonomous for FAQs; human-in-loop for refunds > $100 |
| PricingAgent | Dynamic pricing, competitor analysis, margin optimization | Capable | Semi-autonomous (±15% price change / 24h cap) |
| MarketingAgent | Campaign generation, segmentation, performance | Capable | Content generation autonomous; budget needs approval |
| LogisticsAgent | Carrier selection, tracking, delivery optimization | Cheap/fast | Fully autonomous |

Communication pattern: **supervisor pattern** — agents never talk peer-to-peer; all coordination flows through the Orchestrator for deterministic state recovery and audit trails.

---

## 7. Scope-Cutting Priority (if time runs short)

1. Cut first: MarketingAgent (least visible in demo)
2. Cut second: LogisticsAgent (mock shipping carrier responses)
3. Cut third: PricingAgent (show as "configured rules" instead of AI)
4. Always keep: Orchestrator + OrderAgent + InventoryAgent + SupportAgent + Dashboard
5. Must-have for demo: one end-to-end flow working (order → inventory → tracking)

---

## 8. Presentation Framing

- Position the local open-source stack as a deliberate architecture choice, not a fallback: "model-agnostic, vendor-lock-in-free, cloud-portable."
- Show the original AWS architecture diagram as the production target; show the local Docker Compose stack as what's actually running in the demo.
- Emphasize LiteLLM's routing/fallback as the mechanism that makes both stacks interchangeable with a config change, not a rewrite.

---

*Consolidated from the original hackathon plan (`ai-ecommerce-platform-plan.md`) and follow-up discussion on running the platform locally with open-source tooling.*
