# TruCart — Presentation Content (Feed this to Claude Slides)

> **Team:** Daksh Patel (202302626010099, SEM-7) · Bhautik Vaghamshi (202302626010154, SEM-7)
> **Project:** TruCart — an AI-agent operations platform for e-commerce stores
> **Slides:** 15

---

## 📌 INSTRUCTIONS FOR CLAUDE SLIDES (read this before generating)

1. **One idea per slide.** Do not cram two sub-topics on one slide even if this doc groups them — split if needed, but stay close to 15 slides total.
2. **Diagrams over paragraphs.** Every slide marked `[DIAGRAM]` below MUST be rendered as an actual visual (flowchart, boxes-and-arrows, table, or timeline) — not restated as bullet text. Use the ASCII/mermaid sketches given as the *structure* to follow, redrawn cleanly with shapes, arrows, and color-coded boxes.
3. **Text density:** max ~35–40 words of body bullet text per slide (title + 4–6 short bullets). Long explanations in this doc are speaker notes / backup material, not slide body copy — compress them into short phrases on the slide itself.
4. **Speaker notes:** put the fuller explanation (the paragraph under each slide) into the speaker-notes field if the tool supports it, so the presenter has depth to draw from during Q&A without cluttering the slide.
5. **Consistent color language:** use ONE color for "AI Agent / automated" elements and a DIFFERENT color for "Human / review queue" elements across every diagram in the deck (e.g., blue = agent/automated, orange = human-in-the-loop). This visual consistency is itself a way of showing design maturity to judges.
6. **Numbers stay real.** Every number in this doc (₹ thresholds, percentages, table sizes, thresholds like "5000", "15%", "100") came from the actual, working codebase — do not round them off or invent nicer-sounding numbers to make slides "cleaner."
7. **Avoid walls of generic AI hype text** ("revolutionize," "game-changing," "cutting-edge") — judges are told to penalize generic AI-sounding content. Keep language plain, specific, and evidence-backed (cite the research stats given below verbatim, they include sources).
8. **Table slides**: render as an actual visual table (grid with header row), not as bullet-converted text.
9. **Title slide and closing slide** should carry the team details exactly as given — don't paraphrase names/roll numbers.
10. Keep a consistent template/theme across all 15 slides (same font pairing, same header style, same accent colors) — visual inconsistency between slides reads as rushed.

---

## Slide 1 — Title Slide

**TruCart**
*An AI Agent Team That Runs Your Store's Back-Office — So You Don't Have To*

- Multi-agent AI platform for autonomous e-commerce operations
- Demo store: TechBazaar (fictional Indian electronics retailer)
- Team: Daksh Patel (202302626010099) · Bhautik Vaghamshi (202302626010154) — SEM-7

*Speaker notes: Open by stating in one line what the audience is about to see — six AI agents that run inventory, orders, support, pricing, marketing, and logistics for an online store, with a human only approving the risky calls.*

---

## Slide 2 — The Problem

**Running an e-commerce back-office is manual, siloed, and slow**

- Inventory, orders, support, pricing, marketing, and logistics are usually handled by separate people/tools that don't talk to each other
- Decisions wait on a human even when the answer is obvious and low-risk (e.g., reorder stock that's clearly below threshold)
- Delay has a direct cost: a competitor cuts price and it takes days for a human to notice and react; a stockout triggers a refund cascade; a support ticket sits for 24 hours

**[DIAGRAM — "Before" picture]**
```
Inventory spreadsheet     Support inbox      Pricing sheet
        |                     |                    |
        v                     v                    v
   [Human A]            [Human B]            [Human C]  ← no shared state,
        \___________________|____________________/       decisions delayed
                             v
                    Slow, inconsistent, manual actions
```

*Speaker notes: Emphasize "humans are acting as the glue between disconnected systems" — that's the core failure mode, not any single tool being bad.*

---

## Slide 3 — Why Now (Market Research)

**Agentic AI in retail is moving from advice-giving to action-taking**

- AI platforms are projected to account for **$20.9B in retail spending in 2026** — nearly 4× 2025's figure
- Analysts call agentic AI "the industry's biggest shift" of 2026 — moving past generative AI (chat, content) into autonomous action (execution)
- Real deployments already exist at scale: one global marketplace's agentic AI handled **900,000 weekly self-service sessions** with a **75% containment rate** (no human needed); a confectionery enterprise reached **74% automation** on internal inquiries with 90% employee satisfaction

**[Table]**

| Signal | Data point |
|---|---|
| Retail AI spend, 2026 (projected) | $20.9B (~4× 2025) |
| Self-service containment (case study) | 75% of 900K weekly sessions |
| Internal-inquiry automation (case study) | 74%, 90% employee satisfaction |

*Speaker notes: This slide exists to prove the idea is grounded in real market movement, not a hackathon-only fantasy — cite these numbers when asked "why should this exist?"*

---

## Slide 4 — Passive AI vs. Agentic AI (The Real Distinction)

**Most "AI in e-commerce" today only informs. TruCart's agents act.**

| Passive AI (status quo) | Agentic AI (TruCart) |
|---|---|
| Chatbot answers FAQs | Agent resolves the ticket end-to-end, including refunds |
| Dashboard shows low stock | Agent generates and files the purchase order |
| Human checks competitor prices manually | Agent reprices within guardrails automatically |
| Marketing team writes campaigns from scratch | Agent drafts and launches campaigns from live inventory signals |

> "What makes them 'agentic' is not the interface, but the ownership: interpret intent, pull real data, apply business rules, decide, and execute."

*Speaker notes: This is the single sentence to repeat if a judge asks "how is this different from a dashboard with alerts?"*

---

## Slide 5 — The Solution: Six Specialist Agents

**Instead of six people, six AI agents — each an expert in one function**

**[DIAGRAM — org-chart style]**
```
                     ┌─────────────────────┐
                     │   ORCHESTRATOR       │
                     │ (runs pipeline on a  │
                     │  schedule, or on     │
                     │  demand from the UI) │
                     └──────────┬───────────┘
        ┌───────────┬───────────┼───────────┬───────────┬───────────┐
        v           v           v           v           v           v
   [Inventory]   [Orders]  [Logistics]  [Pricing]  [Marketing]  [Support]
   restock POs   confirm+  ship labels  reprice    clearance   triage +
                 reserve   + tracking   on margin  campaigns   refunds
                 stock                  & velocity
```

- Every agent reads the same operational database — no silo, shared state by design
- Each agent acts on its own for low-risk moves, and escalates the rest

*Speaker notes: Name each agent's job in one breath — inventory reorders stock, orders confirms and reserves, logistics moves shipments through their lifecycle, pricing adjusts margin-aware prices, marketing drafts clearance campaigns, support triages tickets.*

---

## Slide 6 — Guardrails: How Autonomy Stays Safe

**Every agent acts inside a hard limit — the human only sees what crosses it**

| Agent | Auto-approved if… | Else → human review |
|---|---|---|
| Inventory | Purchase order total ≤ ₹5,000 (`po_auto_approve_limit`) | Sent to review queue |
| Pricing | Price move ≤ 15% (`price_change_max_pct`), stays above margin floor | Sent to review queue |
| Support | Refund ≤ ₹100 (`refund_auto_approve_limit`) | Sent to review queue |
| Marketing | Campaign budget ≤ configured cap | Sent to review queue |

**[DIAGRAM — decision gate]**
```
 Agent decision → [ within guardrail? ] --yes--> executes automatically
                          |
                          no
                          v
                 Human Review Queue → admin approves/rejects → action applied
```

*Speaker notes: This is the trust mechanism — the thresholds live in an editable config table (`store_config`, `agent_config`), so an operator tunes risk appetite without touching code.*

---

## Slide 7 — System Architecture (Workflow Diagram)

**From dashboard click (or scheduled tick) to a booked, auditable decision**

**[DIAGRAM — redraw this as a clean layered architecture diagram, input at top, output at bottom]**
```
 Browser (Next.js dashboard)
        │  admin views orders / tickets / triggers "Run Agent"
        v
 Web tier — middleware (session auth) → server components/actions
        │  proxies to backend
        v
 Agent tier — FastAPI
   ┌───────────────────────────────────────────┐
   │ Orchestrator → 6 agents → base.py helpers  │
   │   (call_llm_json, enqueue_review, notify)  │
   └───────────────────────────────────────────┘
        │                          │
        v                          v
 LLM (local Ollama qwen2.5:7b,   Langfuse
 or free API) — one JSON call    (trace every
 per agent decision              agent run)
        │
        v
 Supabase Postgres (22 tables + pgvector)
   - decisions applied to orders / prices / POs / tickets
   - Autopilot Ledger records the decision + outcome
        │
        v
 Dashboard reflects new state + notifications feed
```

- Input: real store data (orders, stock, tickets, sales) — Output: an executed action or a queued human decision
- Everything runs on free tiers: Vercel + Supabase + local/free LLM — **$0 cost** to operate this build

*Speaker notes: Walk left-to-right/top-to-bottom exactly once — this is the one diagram judges will screenshot, so it must be legible and unhurried.*

---

## Slide 8 — Multi-Agent Coordination (No Chaos by Design)

**Agents don't talk to each other directly — they hand off through shared state**

- The Orchestrator runs a **fixed pipeline**: inventory → orders → logistics → pricing → marketing → support, once per cycle, under one `correlation_id`
- Hand-offs happen **through the database**, not messages: inventory writes a purchase order that pricing later reads for cost basis; orders marks a sale "confirmed," which logistics then picks up
- One agent failing doesn't abort the cycle — this is a deliberate simplicity choice over a full message-bus architecture, chosen for auditability

**[DIAGRAM]**
```
Inventory ──writes PO──> [DB] <──reads cost basis── Pricing
Orders ──marks confirmed──> [DB] <──reads confirmed orders── Logistics
                    all agents share correlation_id → one traceable cycle
```

*Speaker notes: If asked "why not LangGraph / a real agent-to-agent protocol?" — answer: this sequential + shared-state pattern is simpler to audit and was the right scope call for a time-boxed build; the production plan (AWS/LangGraph) is documented separately as the scale-up path.*

---

## Slide 9 — USP: The Autopilot Ledger

**Most "autonomous AI" projects can't answer one question: was the AI actually right?**

**TruCart's headline feature answers it, automatically, for every decision.**

- Every judgment call (pricing, inventory, marketing, support) is booked against a **counterfactual "do nothing" baseline** at decision time — computed from real data the agent already has (sales velocity, margins, stock cover)
- After a settle window, a verification sweep checks what **actually** happened and grades the decision **win / loss / neutral**
- Results roll up into a per-agent **Trust Score** — and if an agent's win-rate falls outside its target band, the system **proposes tightening that agent's own auto-approve limit**, one click to accept

**[DIAGRAM — the feedback loop that is the USP]**
```
 Agent decides ──> baseline recorded ("if we did nothing, outcome = X")
        │
        v
 settle window passes (e.g. N days)
        │
        v
 Verification sweep compares real outcome vs. baseline → win / loss / neutral
        │
        v
 Trust Score per agent  ──low win-rate──>  auto-proposed guardrail tightening
                                            (human clicks to approve)
```

*Speaker notes: This is the answer to "why should anyone trust an autonomous agent?" — the system grades its own decisions against reality and self-corrects its risk limits. This closes the loop that most agent demos leave open.*

---

## Slide 10 — Why This Is Different From Existing Solutions

**[Table — this is the USP-vs-competition slide]**

| Existing approach | Limitation | TruCart's answer |
|---|---|---|
| Rule-based automation (e.g., simple reorder triggers) | No judgment — brittle to edge cases | LLM-advised decisions inside deterministic guardrails |
| Chatbot / FAQ support tools | Passive — informs, doesn't resolve | Support agent resolves tickets end-to-end (incl. refunds) |
| Manual competitor-price tracking | Slow, reactive | Margin-aware repricing agent, no manual monitoring |
| "AI dashboard" alerting tools | Human still does 100% of the action | Agent executes the low-risk 95%, escalates the rest |
| Most agent demos | No way to prove the AI made good calls | Autopilot Ledger scores every decision against reality |

*Speaker notes: The last row is the one to linger on — it's the differentiator no comparable hackathon project or common commercial tool currently offers in this form.*

---

## Slide 11 — Walkthrough: One Decision, Start to Finish

**Example: Inventory Agent reorders "Wireless Earbuds Pro"**

**[DIAGRAM — sequence/timeline]**
```
1. Stock check: 12 units on hand, reorder point = 20        [agent: inventory]
2. Forecast from last 30 days of sales → runs out in ~1.5 days
3. Draft PO for 100 units, cost ≈ well under ₹5,000 threshold
4. Auto-approved (under po_auto_approve_limit) → order placed
5. Autopilot Ledger books baseline: "if not reordered, stockout in 1.5 days"
6. After lead time, PO received → stock incremented automatically
7. Verification sweep later grades this decision win/neutral/loss
```

- Same pattern applies to a price change, a refund, or a clearance campaign — decide → guardrail check → act or escalate → ledger records → later verified

*Speaker notes: Use this as the live-demo script if time allows — it's concrete enough for judges to follow without reading code.*

---

## Slide 12 — Tech Stack (What Actually Runs)

**[Table — render as a clean two-column stack diagram if possible]**

| Layer | Technology | Why |
|---|---|---|
| Dashboard | Next.js 16 (App Router) + shadcn/ui | Server components read data directly, fast to build |
| Backend / agents | FastAPI (Python) + APScheduler | One process per agent, simple scheduler for autonomy |
| Database | Supabase Postgres (+ pgvector) | Free tier, RLS-capable, vector search for support RAG |
| LLM | Local Ollama (qwen2.5:7b) or any free OpenAI-compatible API | Zero marginal cost per decision, swappable model |
| Observability | Langfuse (optional) | Full trace of every agent's reasoning call |

- **Total operating cost of this build: $0** — every component runs on a free tier or locally
- Model-agnostic by design: swapping to a paid/production model (e.g., via Bedrock) is a config change, not a rewrite

*Speaker notes: If asked about production scaling — the AWS/Bedrock/LangGraph version is a fully specced production target document, deliberately not built here to keep the hackathon build free and fast to run.*

---

## Slide 13 — Human's Role: Manager, Not Operator

**The system doesn't remove humans — it moves them up a level**

| Before (manual) | With TruCart |
|---|---|
| Check inventory every morning | Approve only purchase orders above the threshold |
| Process every order by hand | Handle only escalated/edge-case orders |
| Answer repetitive support questions | Handle only high-value refunds and disputes |
| Track competitor prices manually | Set pricing guardrails; agent executes inside them |
| Write every marketing campaign from scratch | Approve budget; agent drafts content and targeting |

- The **review queue** (`/dashboard/review`) is where every escalated decision lands, with the agent's reasoning attached
- Rejecting a decision can attach a standing rule that the agent's future prompts respect — the human's correction becomes part of the agent's policy going forward

*Speaker notes: "The human is the manager; the agents are the employees" — one line worth saying out loud.*

---

## Slide 14 — Scope, Honesty, and What's Simulated

**A transparent build — say plainly what's real vs. simulated for the demo**

- **Real:** all six agents run live LLM-advised decisions, guardrails are enforced in the database, the Autopilot Ledger genuinely computes and verifies outcomes
- **Simulated for demo purposes:** order intake (a "Simulate incoming orders" button, no live storefront/checkout), carrier tracking numbers, campaign send/email delivery, payment gateway for refunds
- These are integration points, not architecture gaps — TruCart is designed to plug into real storefront/payment/carrier/ESP APIs through the same agent interfaces already built

**[Small table]**

| Simulated in demo | Real integration point it stands in for |
|---|---|
| "Simulate incoming orders" button | Storefront checkout / payment webhook |
| Invented carrier + tracking number | Delivery carrier API (e.g., Delhivery, BlueDart) |
| Campaign "sent" as a DB row | Email service provider (ESP) |
| Refund flips order status | Payment gateway refund API |

*Speaker notes: Judges respect honesty about scope far more than an unqualified "it's fully autonomous" claim that falls apart under a follow-up question — lead with this transparency, don't wait to be asked.*

---

## Slide 15 — Impact, Roadmap & Team

**Impact**
- Faster decisions: reorder/repricing calls made in seconds, not days
- Fewer errors: no forgotten reorders, no oversold stock
- Provable trust: the Ledger is the mechanism that lets autonomy expand safely over time, agent by agent

**Roadmap (production target, documented separately)**
- Event-driven triggers (DB webhooks) instead of fixed-interval scheduling
- Real carrier / ESP / payment integrations behind the same agent interfaces
- Swap local/free LLM for a managed model (Bedrock or equivalent) via config only

**Team**
- Daksh Patel — 202302626010099 — SEM-7
- Bhautik Vaghamshi — 202302626010154 — SEM-7

*Speaker notes: Close on the Ledger again if there's time for one final sentence — it's the one idea most likely to be remembered after the pitch.*

---

## Appendix — Sources Cited on Slide 3 (keep for Q&A, not on slide)

- Retail AI spend 2026 projection ($20.9B, ~4× 2025)
- "Agentic AI as 2026's biggest industry shift" (analyst commentary)
- Case study: global marketplace, 900K weekly self-service sessions, 75% containment
- Case study: confectionery enterprise, 74% automation, 90% employee satisfaction

*(Original source citations are in `the-idea-explained.md` in the project repo — pull the live links before presenting if you want clickable citations in the deck.)*
