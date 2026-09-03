# TruCart Documentation

| Document | What it covers |
|---|---|
| [`architecture.md`](architecture.md) | Solution architecture of the **built** system — components, the six agents, multi-agent coordination, autonomy, security. Includes a Mermaid diagram. |
| [`cost-estimate.md`](cost-estimate.md) | Estimated costing: **$0/month**, free-tier service mapping with ceilings. AWS-at-scale figures in the appendix. |
| [`api-reference.md`](api-reference.md) | FastAPI endpoints, Next.js route handlers, and dashboard server actions. |
| [`deployment-guide.md`](deployment-guide.md) | Free-tier cloud deployment runbook (pending execution). |
| [`../database-schema-reference.md`](../database-schema-reference.md) | All 22 tables column-by-column + the "Migrations 007–015 addendum". |
| [`../README.md`](../README.md) | Quick start / local setup. |

### Background / planning docs (pre-implementation, aspirational)
`../ai-ecommerce-platform-plan.md` (AWS production design + cost + presentation
outline), `../the-idea-explained.md`, `../hackathon-context.md`,
`../scope-and-data-strategy.md`, `../agent-reference-guide-supabase.md`,
`../zero-cost-local-dev-guide.md`. These informed the build; where they disagree
with the docs in this folder, the docs here describe what is actually running.

### Still pending
- **Presentation deck** — only a text outline exists
  (`../ai-ecommerce-platform-plan.md` §12).
- **Cloud deployment** — see `deployment-guide.md`.
