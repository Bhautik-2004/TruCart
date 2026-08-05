# Zero-Cost Development & Local Testing Guide
## AI-Powered Autonomous E-Commerce Operations Platform

> **For students with no cloud credits.** This guide covers how to develop, test, and run the entire multi-agent e-commerce platform locally for $0, and how to deploy for free when ready.

---

## Table of Contents

1. [The Zero-Cost Strategy](#1-the-zero-cost-strategy)
2. [Free LLM APIs You Can Use](#2-free-llm-apis-you-can-use)
3. [Running LLMs Locally with Ollama (Zero API Cost)](#3-running-llms-locally-with-ollama-zero-api-cost)
4. [Local Development Environment Setup](#4-local-development-environment-setup)
5. [Docker Compose: Full Local Stack](#5-docker-compose-full-local-stack)
6. [LocalStack: AWS Services on Your Laptop](#6-localstack-aws-services-on-your-laptop)
7. [LiteLLM: One Gateway for All LLM Providers](#7-litellm-one-gateway-for-all-llm-providers)
8. [LangGraph Local Development Workflow](#8-langgraph-local-development-workflow)
9. [Step-by-Step: From Clone to Running Locally](#9-step-by-step-from-clone-to-running-locally)
10. [Free Deployment Options (No Credit Card)](#10-free-deployment-options-no-credit-card)
11. [Hackathon Dev-to-Deploy Pipeline](#11-hackathon-dev-to-deploy-pipeline)
12. [Cost Comparison: Local vs AWS](#12-cost-comparison-local-vs-aws)

---

## 1. The Zero-Cost Strategy

### The Core Idea

You don't need AWS Bedrock or expensive cloud services to build and demo this platform. The strategy is:

```
┌─────────────────────────────────────────────────────────────────┐
│                    ZERO-COST STACK                               │
│                                                                  │
│  LLM Layer:     Free API tiers (Groq + Gemini)                  │
│                 OR Ollama (run models on your laptop, $0 API)   │
│                 Unified via LiteLLM gateway                     │
│                                                                  │
│  Agent Layer:   LangGraph running locally in Python             │
│                                                                  │
│  Database:      PostgreSQL in Docker (local)                    │
│                 Redis in Docker (local)                          │
│                                                                  │
│  Frontend:      Next.js dev server (localhost:3000)            │
│                                                                  │
│  AWS Services:  LocalStack (emulates AWS on your laptop)        │
│                 OR just use Docker alternatives directly        │
│                                                                  │
│  Deployment:    Vercel (frontend, free)                         │
│                 Railway/Render (backend, free tier)             │
│                 OR keep it running on your laptop for demo      │
│                                                                  │
│  Total cost:   $0.00                                             │
└─────────────────────────────────────────────────────────────────┘
```

### Why This Works for a Hackathon

| Concern | AWS Production Approach | Zero-Cost Local Approach |
|---|---|---|
| LLM inference | Amazon Bedrock ($300-600/mo) | Groq free tier (14,400 req/day) + Gemini free (1,500 req/day) |
| Database | Aurora Serverless ($90-130/mo) | PostgreSQL in Docker (free) |
| Cache | ElastiCache Redis ($12-15/mo) | Redis in Docker (free) |
| Vector search | OpenSearch Serverless ($100-150/mo) | ChromaDB or Qdrant in Docker (free) |
| Agent runtime | ECS Fargate ($80-120/mo) | Python process on your laptop (free) |
| Frontend hosting | CloudFront + S3 ($5-10/mo) | Vercel free tier (free) |
| Backend hosting | API Gateway + Lambda ($3-5/mo) | Railway/Render free tier (free) |

**For the hackathon demo, judges care about a working product — not where it's hosted. You can run the entire platform on your laptop and screen-share the demo.**

---

## 2. Free LLM APIs You Can Use

### Provider Comparison (Verified July 2026)

| Provider | Free Quota | Best Models | Credit Card? | Speed | Best For |
|---|---|---|---|---|---|
| **Groq** | 14,400 req/day, 30 RPM | Llama 3.3 70B, Qwen 3 32B, Kimi K2 | No | Ultra-fast (~394 TPS) | Primary agent LLM — most requests |
| **Google Gemini** | 1,500 req/day (Flash), 50 req/day (Pro) | Gemini 2.5 Flash, Gemini 2.5 Pro | No | Fast | Complex reasoning tasks |
| **OpenRouter** | 1,000 req/day (after $10 one-time) | DeepSeek R1, Qwen3 Coder 480B, Llama 4 Scout | No (for free tier) | Varies | Model diversity + fallback |
| **Cerebras** | Free tier available | Llama 3.1 8B, Qwen | No | Ultra-fast | High-volume simple tasks |
| **GitHub Models** | Free tier available | GPT-4o, Llama, Phi | No (GitHub account) | Varies | Experimentation |

### Recommended Multi-Provider Stack

The key insight from research: **stacking multiple free tiers gives you effectively unlimited capacity** [web:52]. Gemini's 1,500 RPD + Groq's 14,400 RPD + OpenRouter's 1,000 RPD = **16,900 free requests per day** — more than enough for a hackathon demo [web:52].

```
┌──────────────────────────────────────────────────┐
│          LLM ROUTING STRATEGY                     │
│                                                   │
│  Tier 1 (Fast/Cheap tasks):                       │
│  Groq → Llama 3.3 70B (14,400 req/day)           │
│  Used by: Orchestrator, LogisticsAgent,           │
│           OrderAgent (standard processing)         │
│                                                   │
│  Tier 2 (Complex reasoning):                      │
│  Gemini 2.5 Flash (1,500 req/day)                 │
│  Used by: PricingAgent, InventoryAgent,           │
│           SupportAgent, MarketingAgent             │
│                                                   │
│  Tier 3 (Hardest tasks, low volume):              │
│  Gemini 2.5 Pro (50 req/day)                      │
│  Used by: Complex edge cases, deep analysis       │
│                                                   │
│  Fallback: OpenRouter → DeepSeek R1 (free)        │
│  Triggered when: Groq or Gemini rate limit hit    │
└──────────────────────────────────────────────────┘
```

### How to Get API Keys (5 Minutes Each)

**Groq (best free tier for agents):**
1. Go to console.groq.com
2. Sign up with Google or email
3. Navigate to API Keys → Create Key
4. Copy key → set as `GROQ_API_KEY` environment variable
5. No credit card required [web:52]

**Google Gemini (most generous frontier free tier):**
1. Go to ai.google.dev (Google AI Studio)
2. Sign in with Google account
3. Click "Get API Key" → Create API Key
4. Copy key → set as `GEMINI_API_KEY` environment variable
5. No credit card required [web:52]

**OpenRouter (breadth of models):**
1. Go to openrouter.ai
2. Sign up
3. Keys → Create Key
4. Copy key → set as `OPENROUTER_API_KEY`
5. Free tier gives 50 req/day; adding $10 credits (one-time) bumps to 1,000 req/day [web:52]

### Environment Variables Setup

Create a `.env` file in your project root:

```bash
# LLM API Keys (all free tiers)
GROQ_API_KEY=gsk_your_groq_key_here
GEMINI_API_KEY=AIza_your_gemini_key_here
OPENROUTER_API_KEY=sk-or-v1-your_openrouter_key_here

# LiteLLM Gateway (runs locally)
LITELLM_PROXY_URL=http://localhost:4000
LITELLM_MASTER_KEY=sk-local-dev-key

# Database (local Docker)
DATABASE_URL=postgresql://ecommerce:password@localhost:5432/ecommerce
REDIS_URL=redis://localhost:6379

# Vector DB (local Docker)
CHROMA_URL=http://localhost:8000

# Frontend
NEXT_PUBLIC_API_URL=http://localhost:8001
```

---

## 3. Running LLMs Locally with Ollama (Zero API Cost)

If you want **zero API dependency** (no rate limits, no internet needed, no keys), run LLMs directly on your laptop using Ollama.

### What Is Ollama?

Ollama is a free, open-source tool that lets you download and run LLMs (Llama, Qwen, DeepSeek, Gemma, Mistral) locally on your machine. No API costs, no rate limits, no data sent to cloud — completely free and offline [web:69].

### Installation

```bash
# macOS / Linux
curl -fsSL https://ollama.com/install.sh | sh

# Windows
# Download installer from https://ollama.com/download
```

### Download Models for Your Agents

```bash
# Pull models (one-time download, 2-8GB each)
ollama pull qwen3:8b           # Best balance for agent reasoning (5GB RAM)
ollama pull llama3.1:8b        # Fast, reliable for general tasks (5GB RAM)
ollama pull qwen2.5-coder:7b   # Good for structured output / tool calling (4GB RAM)

# If you have 16GB+ RAM, you can run stronger models:
ollama pull llama3.1:13b        # Higher quality reasoning (8GB RAM)
ollama pull qwen3:14b           # Strong reasoning + tool use (9GB RAM)
```

### Model Selection by Agent

| Agent | Recommended Model | RAM Needed | Why |
|---|---|---|---|
| Orchestrator | llama3.1:8b | 5 GB | Fast routing decisions, tool calling |
| InventoryAgent | qwen3:8b | 5 GB | Good reasoning for forecasting |
| OrderAgent | llama3.1:8b | 5 GB | Standard processing, doesn't need deep reasoning |
| SupportAgent | qwen3:8b | 5 GB | Nuanced reasoning for complaints |
| PricingAgent | qwen3:8b | 5 GB | Multi-factor analysis |
| MarketingAgent | qwen3:8b | 5 GB | Creative content generation |
| LogisticsAgent | llama3.1:8b | 5 GB | Rule-heavy, less reasoning needed |

### Using Ollama with Python / LangGraph

```python
# Ollama exposes a local API at http://localhost:11434
# It's OpenAI-compatible, so LangChain/LangGraph works directly

from langchain_openai import ChatOpenAI

# Point LangChain to Ollama instead of OpenAI
llm = ChatOpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama",  # Ollama doesn't need a real key
    model="qwen3:8b",
    temperature=0.7,
)

# Use this llm in your LangGraph agents exactly as you would with OpenAI
```

### Ollama + Open WebUI (ChatGPT-Style Interface)

```bash
# Run a local chat UI to test your models
docker run -d -p 3000:8080 \
  -v open-webui:/app/backend/data \
  --name open-webui \
  ghcr.io/open-webui/open-webui:main

# Visit http://localhost:3000 for a ChatGPT-style interface
```

### When to Use Ollama vs Free APIs

| Scenario | Use | Why |
|---|---|---|
| Hackathon day, developing agents | Ollama | No rate limits, no internet dependency, iterate fast |
| Need highest quality reasoning | Gemini 2.5 Flash | Ollama models are smaller (8B vs 70B+ cloud models) |
| Need speed for demo | Groq | Groq is 5-10x faster than local Ollama |
| No GPU, low RAM (8GB) | Groq + Gemini APIs | Ollama may be slow on low-end machines |
| Presenting/demo, need reliability | Groq API (backup: Ollama) | API is faster; Ollama is fallback if internet drops |

---

## 4. Local Development Environment Setup

### Prerequisites

```bash
# Required tools (all free)
# 1. Python 3.11+
python --version

# 2. Node.js 20+
node --version

# 3. Docker + Docker Compose
docker --version
docker compose version

# 4. Git
git --version

# 5. Ollama (optional, for local LLMs)
ollama --version

# 6. AWS CLI (for LocalStack + later deployment)
aws --version
```

### Project Structure (Local Dev)

```
ai-ecommerce-platform/
├── frontend/                  # Next.js dashboard
│   ├── app/
│   ├── components/
│   ├── lib/
│   └── package.json
├── agents/                    # LangGraph multi-agent system
│   ├── supervisor/
│   ├── inventory/
│   ├── order/
│   ├── support/
│   ├── pricing/
│   ├── marketing/
│   ├── logistics/
│   ├── shared/
│   │   ├── llm_config.py       # LLM provider config (Groq/Gemini/Ollama)
│   │   ├── tools.py            # Shared tool definitions
│   │   └── state.py            # Shared state schema
│   ├── main.py                 # Entry point — runs all agents locally
│   └── requirements.txt
├── backend/                   # FastAPI backend (replaces API Gateway + Lambda)
│   ├── api/
│   │   ├── routes/
│   │   └── websocket.py
│   ├── main.py
│   └── requirements.txt
├── docker-compose.yml          # Local infrastructure (Postgres, Redis, etc.)
├── .env                        # Environment variables
└── scripts/
    ├── seed_data.py            # Populate database with test data
    └── setup_kb.py             # Set up vector knowledge base
```

---

## 5. Docker Compose: Full Local Stack

This single `docker-compose.yml` file replaces ALL AWS infrastructure locally:

```yaml
# docker-compose.yml
version: '3.8'

services:
  # ─── PostgreSQL (replaces Aurora Serverless) ───────────────
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: ecommerce
      POSTGRES_PASSWORD: password
      POSTGRES_DB: ecommerce
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./scripts/schema.sql:/docker-entrypoint-initdb.d/schema.sql
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ecommerce"]
      interval: 5s
      timeout: 5s
      retries: 5

  # ─── Redis (replaces ElastiCache) ──────────────────────────
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 5s
      retries: 5

  # ─── ChromaDB (replaces OpenSearch for RAG) ────────────────
  # ChromaDB is a free, lightweight vector database — perfect for local dev
  chroma:
    image: chromadb/chroma:latest
    ports:
      - "8000:8000"
    volumes:
      - chroma_data:/chroma/chroma
    environment:
      - IS_PERSISTENT=TRUE
      - PERSIST_DIRECTORY=/chroma/chroma

  # ─── LiteLLM Proxy (LLM Gateway — routes to Groq/Gemini/Ollama) ─
  litellm:
    image: ghcr.io/berriai/litellm:main-latest
    ports:
      - "4000:4000"
    environment:
      - GROQ_API_KEY=${GROQ_API_KEY}
      - GEMINI_API_KEY=${GEMINI_API_KEY}
      - OPENROUTER_API_KEY=${OPENROUTER_API_KEY}
      - LITELLM_MASTER_KEY=sk-local-dev-key
    volumes:
      - ./litellm_config.yaml:/app/config.yaml
    command: ["--config", "/app/config.yaml", "--port", "4000"]
    depends_on:
      - redis

  # ─── Ollama (local LLM — optional, zero API cost) ──────────
  ollama:
    image: ollama/ollama:latest
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    # Note: If you have a GPU, uncomment below for acceleration
    # deploy:
    #   resources:
    #     reservations:
    #       devices:
    #         - driver: nvidia
    #           count: all
    #           capabilities: [gpu]

volumes:
  postgres_data:
  redis_data:
  chroma_data:
  ollama_data:
```

### LiteLLM Configuration File

```yaml
# litellm_config.yaml
# This file tells LiteLLM how to route requests to different providers
# All providers use free tiers — $0 cost

model_list:
  # ─── Tier 1: Fast tasks (Groq — 14,400 req/day free) ──────
  - model_name: agent-fast          # Use this name in your code
    litellm_params:
      model: groq/llama-3.3-70b-versatile
      api_key: os.environ/GROQ_API_KEY

  # ─── Tier 2: Complex reasoning (Gemini — 1,500 req/day free) ─
  - model_name: agent-smart         # Use this name in your code
    litellm_params:
      model: gemini/gemini-2.5-flash
      api_key: os.environ/GEMINI_API_KEY

  # ─── Tier 3: Hardest tasks (Gemini Pro — 50 req/day free) ──
  - model_name: agent-expert        # Use this name in your code
    litellm_params:
      model: gemini/gemini-2.5-pro
      api_key: os.environ/GEMINI_API_KEY

  # ─── Fallback: OpenRouter free models ─────────────────────
  - model_name: agent-fallback
    litellm_params:
      model: openrouter/deepseek/deepseek-r1:free
      api_key: os.environ/OPENROUTER_API_KEY

  # ─── Local LLM (Ollama — unlimited, $0, offline) ─────────
  - model_name: agent-local
    litellm_params:
      model: ollama/qwen3:8b
      api_base: http://ollama:11434

# ─── Fallback routing: if Groq rate-limited, try Gemini, then Ollama ─
router_settings:
  fallbacks:
    - agent-fast: [agent-smart, agent-local]
    - agent-smart: [agent-fast, agent-local]
```

### Start the Entire Stack

```bash
# Start all services (PostgreSQL, Redis, ChromaDB, LiteLLM, Ollama)
docker compose up -d

# Check all services are healthy
docker compose ps

# Expected output:
# NAME         STATUS         PORTS
# postgres     Up (healthy)   0.0.0.0:5432->5432/tcp
# redis        Up (healthy)   0.0.0.0:6379->6379/tcp
# chroma       Up             0.0.0.0:8000->8000/tcp
# litellm      Up             0.0.0.0:4000->4000/tcp
# ollama       Up             0.0.0.0:11434->11434/tcp

# Pull Ollama models (only needed once, ~5GB download)
docker exec -it ollama ollama pull qwen3:8b
docker exec -it ollama ollama pull llama3.1:8b
```

---

## 6. LocalStack: AWS Services on Your Laptop

LocalStack emulates AWS services locally — so you can develop against SQS, DynamoDB, S3, etc. without an AWS account.

> **Important:** As of March 2026, LocalStack's Community Edition was replaced with a free non-commercial tier that requires a user account. Students verified with GitHub get free access [web:59][web:61]. This is still $0 for hackathon/student use.

### When You Actually Need LocalStack

| Use Case | Need LocalStack? | Alternative |
|---|---|---|
| Running LangGraph agents | No | Run agents as Python processes directly |
| PostgreSQL database | No | Use Docker PostgreSQL directly |
| Redis cache | No | Use Docker Redis directly |
| Vector search | No | Use ChromaDB in Docker |
| SQS queues (agent message queues) | Yes, if you want to mimic AWS architecture | OR use Python's `asyncio.Queue` / Redis pub-sub |
| DynamoDB (agent checkpoints) | Yes, if mimicking AWS | OR use PostgreSQL table for checkpoints |
| S3 (file storage) | Yes, if mimicking AWS | OR use local filesystem |
| Step Functions (orchestration) | Yes | OR use LangGraph's built-in orchestration |

### Recommendation for Hackathon

**Skip LocalStack entirely for development.** Use Docker services directly:
- PostgreSQL instead of Aurora → same SQL, same schema
- Redis instead of ElastiCache → same API
- ChromaDB instead of OpenSearch → simpler, free, Python-native
- Python `asyncio.Queue` or Redis pub-sub instead of SQS → same async pattern
- LangGraph's built-in orchestration instead of Step Functions → LangGraph IS the orchestrator

**You only need LocalStack if you want to demonstrate the AWS architecture for judges.** Even then, you can describe the AWS architecture in your presentation while running locally on Docker.

### If You Do Want LocalStack

```bash
# Install LocalStack
pip install localstack

# Start LocalStack
localstack start -d

# Use AWS CLI against LocalStack (set endpoint to localhost)
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export EDGE_PORT=4566

# Create an SQS queue (emulated locally)
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name inventory-queue

# Create a DynamoDB table (emulated locally)
aws --endpoint-url=http://localhost:4566 dynamodb create-table \
  --table-name langgraph_checkpoints \
  --attribute-definitions AttributeName=thread_id,AttributeType=S \
  --key-schema AttributeName=thread_id,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```

---

## 7. LiteLLM: One Gateway for All LLM Providers

### Why LiteLLM?

LiteLLM is a proxy that provides a **single OpenAI-compatible API endpoint** that routes to any LLM provider (Groq, Gemini, OpenRouter, Ollama). Your code only talks to `http://localhost:4000` — LiteLLM handles the rest [web:76].

### Benefits for Your Hackathon

| Benefit | How It Helps |
|---|---|
| **One API key** | Your agents call `http://localhost:4000` — no need to manage multiple API keys in code |
| **Automatic fallback** | If Groq rate-limits, LiteLLM auto-switches to Gemini, then to Ollama |
| **Model abstraction** | Change `agent-fast` from Groq Llama to Ollama Qwen by editing config, not code |
| **Cost tracking** | LiteLLM logs every request — you can see how many free requests you've used |
| **Local + cloud** | Ollama runs locally (offline), Groq/Gemini are cloud (online) — LiteLLM routes to either |

### Using LiteLLM in Your LangGraph Code

```python
# agents/shared/llm_config.py
from langchain_openai import ChatOpenAI

# All agents use the same endpoint — LiteLLM handles routing
# "agent-fast" routes to Groq (fast, cheap tasks)
# "agent-smart" routes to Gemini (complex reasoning)
# "agent-local" routes to Ollama (offline, unlimited)

LITELLM_BASE_URL = "http://localhost:4000"  # LiteLLM proxy
LITELLM_API_KEY = "sk-local-dev-key"

def get_fast_llm():
    """For routing, simple tasks — uses Groq Llama 3.3 70B (free)"""
    return ChatOpenAI(
        base_url=f"{LITELLM_BASE_URL}/v1",
        api_key=LITELLM_API_KEY,
        model="agent-fast",  # LiteLLM routes to Groq
        temperature=0.3,
    )

def get_smart_llm():
    """For complex reasoning — uses Gemini 2.5 Flash (free)"""
    return ChatOpenAI(
        base_url=f"{LITELLM_BASE_URL}/v1",
        api_key=LITELLM_API_KEY,
        model="agent-smart",  # LiteLLM routes to Gemini
        temperature=0.7,
    )

def get_local_llm():
    """For offline / no-rate-limit — uses Ollama Qwen3 (free, local)"""
    return ChatOpenAI(
        base_url=f"{LITELLM_BASE_URL}/v1",
        api_key=LITELLM_API_KEY,
        model="agent-local",  # LiteLLM routes to Ollama
        temperature=0.7,
    )
```

### Testing LiteLLM

```bash
# Test that LiteLLM is working
curl http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-local-dev-key" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "agent-fast",
    "messages": [{"role": "user", "content": "Say hello in 5 words"}]
  }'

# Should get a response from Groq Llama 3.3 70B
```

---

## 8. LangGraph Local Development Workflow

### Running Agents Locally (No Cloud Needed)

LangGraph runs as a Python process — no ECS, no containers, no AWS. You run it directly:

```python
# agents/main.py
import asyncio
from supervisor.graph import build_supervisor_graph
from shared.llm_config import get_fast_llm

async def main():
    # Build the multi-agent graph
    llm = get_fast_llm()  # Uses Groq via LiteLLM
    graph = build_supervisor_graph(llm)

    # Test: simulate an order coming in
    result = await graph.ainvoke({
        "messages": [{"role": "user", "content": "Process order #1001 for 2x Wireless Earbuds"}],
    })

    print("Agent response:", result["messages"][-1].content)

if __name__ == "__main__":
    asyncio.run(main())
```

### LangGraph Studio (Visual Debugging)

LangGraph Studio is a free desktop app that visualizes your agent graph — you can see each agent node, watch messages flow between agents, and debug in real-time [web:72].

```bash
# Install LangGraph Studio (free desktop app)
# Download from https://github.com/langchain-ai/langgraph-studio

# Or run via CLI
pip install langgraph-cli
langgraph dev  # Starts LangGraph Studio on http://localhost:2024
```

### Local Checkpointing (Replacing DynamoDB)

LangGraph needs checkpoint storage for state persistence. Locally, use SQLite or PostgreSQL:

```python
# agents/shared/state.py
from langgraph.checkpoint.postgres import PostgresSaver
from langgraph.checkpoint.memory import MemorySaver  # Simplest option

# Option 1: In-memory (fastest for dev, lost on restart)
checkpointer = MemorySaver()

# Option 2: PostgreSQL (persistent, same as production but local)
# from psycopg_pool import ConnectionPool
# pool = ConnectionPool("postgresql://ecommerce:password@localhost:5432/ecommerce")
# checkpointer = PostgresSaver(pool)

graph = build_supervisor_graph(llm, checkpointer=checkpointer)
```

### Testing Individual Agents

```python
# tests/test_inventory_agent.py
import pytest
from agents.inventory.agent import build_inventory_agent
from agents.shared.llm_config import get_smart_llm

@pytest.mark.asyncio
async def test_low_stock_reorder():
    llm = get_smart_llm()  # Gemini via LiteLLM
    agent = build_inventory_agent(llm)

    result = await agent.ainvoke({
        "messages": [
            {"role": "user", "content": "Check stock for product SKU-001 and reorder if low"}
        ],
    })

    # Assert agent detected low stock and generated a PO
    assert "purchase order" in result["messages"][-1].content.lower()

@pytest.mark.asyncio
async def test_forecast_demand():
    llm = get_smart_llm()
    agent = build_inventory_agent(llm)

    result = await agent.ainvoke({
        "messages": [
            {"role": "user", "content": "Forecast demand for SKU-001 for next 7 days"}
        ],
    })

    assert result["messages"][-1].content is not None
```

---

## 9. Step-by-Step: From Clone to Running Locally

### Step 1: Clone & Install (10 minutes)

```bash
# Clone the repo
git clone https://github.com/your-team/ai-ecommerce-platform.git
cd ai-ecommerce-platform

# Copy environment template
cp .env.example .env

# Add your free API keys to .env
# GROQ_API_KEY=gsk_xxx
# GEMINI_API_KEY=AIza_xxx
# OPENROUTER_API_KEY=sk-or-v1-xxx

# Install Python dependencies
cd agents
pip install -r requirements.txt
cd ../backend
pip install -r requirements.txt
cd ..

# Install frontend dependencies
cd frontend
npm install
cd ..
```

### Step 2: Start Infrastructure (2 minutes)

```bash
# Start PostgreSQL, Redis, ChromaDB, LiteLLM, Ollama
docker compose up -d

# Wait for services to be healthy
docker compose ps

# (Optional) Pull Ollama models if using local LLMs
docker exec -it ollama ollama pull qwen3:8b
```

### Step 3: Initialize Database (2 minutes)

```bash
# Run the schema SQL (creates all tables)
docker exec -i postgres psql -U ecommerce -d ecommerce < scripts/schema.sql

# Seed test data (50 products, 100 customers, 200 orders)
python scripts/seed_data.py

# Set up vector knowledge base (FAQs, product catalog)
python scripts/setup_kb.py
```

### Step 4: Test LLM Connectivity (1 minute)

```bash
# Test LiteLLM proxy
curl http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-local-dev-key" \
  -H "Content-Type: application/json" \
  -d '{"model": "agent-fast", "messages": [{"role": "user", "content": "Hello"}]}'

# Test Ollama directly
curl http://localhost:11434/api/generate -d '{"model": "qwen3:8b", "prompt": "Hello"}'
```

### Step 5: Run the Agent System (1 minute)

```bash
# Terminal 1: Run the agent backend
cd agents
python main.py
# Agents are now running, listening for tasks via Redis pub/sub

# Terminal 2: Run the API server
cd backend
uvicorn main:app --reload --port 8001
# API available at http://localhost:8001

# Terminal 3: Run the frontend
cd frontend
npm run dev
# Dashboard available at http://localhost:3000
```

### Step 6: Test End-to-End (2 minutes)

```bash
# Test 1: Place an order (triggers OrderAgent → InventoryAgent → LogisticsAgent)
curl -X POST http://localhost:8001/api/orders \
  -H "Content-Type: application/json" \
  -d '{"customer_id": "...", "product_id": "...", "quantity": 2}'

# Test 2: Create a support ticket (triggers SupportAgent)
curl -X POST http://localhost:8001/api/support/ticket \
  -H "Content-Type: application/json" \
  -d '{"customer_id": "...", "subject": "Damaged product", "description": "Earbuds won't charge"}'

# Test 3: Simulate competitor price drop (triggers PricingAgent → MarketingAgent)
curl -X POST http://localhost:8001/api/admin/simulate-competitor-price \
  -H "Content-Type: application/json" \
  -d '{"product_id": "...", "competitor_price": 149.99}'
```

### Step 7: Watch the Dashboard

Open `http://localhost:3000` in your browser. You should see:
- Agent status panel (all agents showing "active")
- KPI dashboard (orders, revenue, stock alerts)
- Review queue (pending human approvals)
- Real-time agent task logs

### Total Time: ~18 minutes from clone to running

---

## 10. Free Deployment Options (No Credit Card)

When you're ready to deploy for the hackathon (instead of running locally), here are free hosting options:

### Frontend: Vercel (Free Forever)

| Feature | Free Tier |
|---|---|
| Bandwidth | 100 GB/month |
| Build minutes | 6,000 minutes/month |
| Custom domain | Yes (free .vercel.app subdomain) |
| Credit card | Not required |

```bash
# Deploy frontend to Vercel
cd frontend
npx vercel --yes
# Your dashboard is live at https://your-project.vercel.app
```

### Backend: Railway (Free Trial) or Render (Free Tier)

| Platform | Free Offering | Limitation |
|---|---|---|
| **Render** | Free web service | Spins down after 15 min idle; 750 hours/month |
| **Railway** | $5 free credits (trial) | Credits run out after ~500 hours of usage |
| **Fly.io** | Free tier (3 shared-cpu VMs) | 256MB RAM per VM |

```bash
# Deploy backend to Render (free tier)
# 1. Push code to GitHub
# 2. Go to render.com → New → Web Service
# 3. Connect your GitHub repo
# 4. Set build: pip install -r requirements.txt
# 5. Set start: uvicorn main:app --host 0.0.0.0 --port $PORT
# 6. Deploy — free, no credit card
```

### Database: Neon (Free PostgreSQL)

| Feature | Free Tier |
|---|---|
| Storage | 3 GB |
| Compute | 191.9 compute hours/month |
| Branches | Unlimited (great for testing) |
| Credit card | Not required |

```bash
# Neon gives you a free cloud PostgreSQL (replaces local Docker Postgres for deployed version)
# 1. Go to neon.tech → Sign up (free, no credit card)
# 2. Create a project → Get connection string
# 3. Update DATABASE_URL in your environment
```

### Vector DB: ChromaDB Cloud (Free Tier)

ChromaDB offers a free cloud tier for vector search when you're ready to deploy.

### LLM APIs: Same Free Tiers

Your Groq, Gemini, and OpenRouter free API keys work in production too — no change needed.

### Deployment Architecture (Free)

```
┌──────────────────────────────────────────────────────────────┐
│                  FREE DEPLOYMENT ARCHITECTURE                  │
│                                                               │
│  ┌─────────────┐     ┌──────────────┐     ┌───────────────┐ │
│  │  Vercel     │────→│  Render       │────→│  Neon (DB)    │ │
│  │  (Frontend) │     │  (Backend +   │     │  PostgreSQL   │ │
│  │  Free       │     │   Agents)     │     │  Free 3GB     │ │
│  │  vercel.app │     │  Free tier    │     │               │ │
│  └─────────────┘     └──────┬───────┘     └───────────────┘ │
│                             │                                 │
│                    ┌────────▼────────┐                        │
│                    │  Groq API       │  Free 14,400 req/day   │
│                    │  Gemini API     │  Free 1,500 req/day    │
│                    │  OpenRouter API │  Free 1,000 req/day    │
│                    │  (via LiteLLM)  │                        │
│                    └─────────────────┘                        │
│                                                               │
│  Total monthly cost: $0.00                                    │
└──────────────────────────────────────────────────────────────┘
```

---

## 11. Hackathon Dev-to-Deploy Pipeline

### Phase 1: Local Development (First 36 hours)

```
┌─────────────────────────────────────────────────┐
│  DEVELOPMENT (Your Laptop)                       │
│                                                  │
│  Docker Compose:                                 │
│  ├── PostgreSQL (localhost:5432)                 │
│  ├── Redis (localhost:6379)                      │
│  ├── ChromaDB (localhost:8000)                   │
│  ├── LiteLLM (localhost:4000)                    │
│  └── Ollama (localhost:11434)                    │
│                                                  │
│  Python processes:                               │
│  ├── LangGraph agents (python main.py)           │
│  ├── FastAPI backend (uvicorn main:app)          │
│  └── Next.js frontend (npm run dev)             │
│                                                  │
│  LLM: Groq API + Gemini API (free tiers)         │
│  Fallback: Ollama (local, if API limits hit)     │
│                                                  │
│  Cost: $0                                        │
└─────────────────────────────────────────────────┘
```

### Phase 2: Pre-Deployment Testing (Hour 36-40)

Before deploying, make sure everything works locally:

```bash
# Run integration tests
pytest tests/ -v

# Run end-to-end test script
python scripts/e2e_test.py
# This script:
# 1. Places 5 orders → verifies OrderAgent processes them
# 2. Creates 3 support tickets → verifies SupportAgent resolves them
# 3. Triggers 2 competitor price changes → verifies PricingAgent
# 4. Checks inventory reordering → verifies InventoryAgent
# 5. Verifies all data is in PostgreSQL

# If all pass → ready to deploy
```

### Phase 3: Deploy (Hour 40-44)

```bash
# 1. Deploy database to Neon (free)
#    → Get connection string → update .env

# 2. Deploy backend to Render (free)
#    → Connect GitHub repo → auto-deploy
#    → Set environment variables (API keys, DATABASE_URL)
#    → Backend live at https://your-app.onrender.com

# 3. Deploy frontend to Vercel (free)
cd frontend
npx vercel --prod
#    → Frontend live at https://your-project.vercel.app

# 4. Update frontend API URL to point to Render backend
echo "NEXT_PUBLIC_API_URL=https://your-app.onrender.com" >> .env
```

### Phase 4: Verify Deployment (Hour 44-46)

```bash
# Test the deployed API
curl https://your-app.onrender.com/health

# Test a full order flow on the deployed system
curl -X POST https://your-app.onrender.com/api/orders \
  -H "Content-Type: application/json" \
  -d '{"customer_id": "...", "product_id": "...", "quantity": 1}'

# Open the deployed frontend
open https://your-project.vercel.app
```

### Phase 5: Demo Prep (Hour 46-48)

```bash
# Record a backup demo video (in case live demo fails)
# Use OBS Studio (free) or QuickTime screen recording

# Demo script:
# 1. Show deployed URL working
# 2. Place order → watch agents process it on dashboard
# 3. Create support ticket → watch agent resolve it
# 4. Show review queue → approve a pending PO
# 5. Show agent task logs with reasoning
```

---

## 12. Cost Comparison: Local vs AWS

### Development Phase (Hackathon)

| Component | Local (Docker) | AWS (Production) | Savings |
|---|---|---|---|
| LLM inference | $0 (Groq + Gemini free) | $300-600/mo (Bedrock) | $300-600 |
| Database | $0 (Docker PostgreSQL) | $90-130/mo (Aurora) | $90-130 |
| Cache | $0 (Docker Redis) | $12-15/mo (ElastiCache) | $12-15 |
| Vector search | $0 (Docker ChromaDB) | $100-150/mo (OpenSearch) | $100-150 |
| Agent runtime | $0 (your laptop) | $80-120/mo (ECS Fargate) | $80-120 |
| Frontend hosting | $0 (localhost or Vercel free) | $5-10/mo (CloudFront) | $5-10 |
| Backend hosting | $0 (localhost or Render free) | $3-5/mo (API Gateway) | $3-5 |
| **Total** | **$0/month** | **$590-1,030/month** | **$590-1,030** |

### Deployed Phase (Free Cloud)

| Component | Free Cloud Hosting | AWS Equivalent |
|---|---|---|
| Frontend | Vercel free ($0) | CloudFront + S3 ($5-10/mo) |
| Backend | Render free ($0) | API Gateway + Lambda ($3-5/mo) |
| Database | Neon free ($0) | Aurora Serverless ($90-130/mo) |
| LLM | Groq + Gemini free ($0) | Bedrock ($300-600/mo) |
| **Total** | **$0/month** | **$398-745/month** |

### Rate Limit Reality Check

| Provider | Free Limit | Hackathon Usage (est.) | Enough? |
|---|---|---|---|
| Groq | 14,400 req/day | ~200 req/day (7 agents × ~30 tasks) | Yes (72x headroom) |
| Gemini Flash | 1,500 req/day | ~100 req/day (complex reasoning) | Yes (15x headroom) |
| Gemini Pro | 50 req/day | ~5 req/day (hardest cases) | Yes (10x headroom) |
| OpenRouter | 1,000 req/day | ~20 req/day (fallback) | Yes (50x headroom) |
| Ollama (local) | Unlimited | As needed | Always available |
| **Combined** | **~16,900 req/day** | **~325 req/day** | **Yes (52x headroom)** |

---

## Quick Reference: All Free Resources

| Resource | What It Replaces | Free Tier | URL |
|---|---|---|---|
| Groq API | Bedrock LLM | 14,400 req/day | console.groq.com |
| Gemini API | Bedrock LLM | 1,500 req/day | ai.google.dev |
| OpenRouter API | Bedrock LLM | 1,000 req/day | openrouter.ai |
| Ollama | Bedrock LLM | Unlimited (local) | ollama.com |
| LiteLLM | LLM gateway | Self-hosted (free) | github.com/BerriAI/litellm |
| Docker PostgreSQL | Aurora Serverless | Unlimited (local) | hub.docker.com |
| Docker Redis | ElastiCache | Unlimited (local) | hub.docker.com |
| ChromaDB | OpenSearch | Unlimited (local) | chromadb.com |
| Vercel | CloudFront + S3 | 100GB bandwidth | vercel.com |
| Render | API Gateway + Lambda | 750 hrs/month | render.com |
| Neon | Aurora Serverless | 3GB storage | neon.tech |
| LangGraph Studio | (debugging tool) | Free | github.com/langchain-ai/langgraph-studio |
| LocalStack | AWS services (local) | Free for students | localstack.cloud |

---

*This document covers only zero-cost development and local testing. For architecture, tech stack, database schema, cost estimation, and implementation plan, see the main planning document.*
