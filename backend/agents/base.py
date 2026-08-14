import json
import os
from typing import Any
from uuid import UUID, uuid4

from openai import OpenAI

from ..db import get_supabase

_ollama_client: OpenAI | None = None


def get_ollama_client() -> OpenAI:
    """Return a shared client pointed at Ollama's OpenAI-compatible endpoint."""
    global _ollama_client
    if _ollama_client is None:
        base_url = os.getenv("OLLAMA_BASE_URL", "http://localhost:11434").rstrip("/")
        _ollama_client = OpenAI(base_url=f"{base_url}/v1", api_key="ollama")
    return _ollama_client


def get_ollama_model() -> str:
    return os.getenv("OLLAMA_MODEL", "qwen2.5:7b")


def call_llm_json(system_prompt: str, user_prompt: str) -> dict[str, Any] | None:
    """Ask the local model for a JSON object. Returns None on any failure
    (Ollama down, malformed output, etc.) so callers can fall back to a
    deterministic decision instead of crashing the agent run.
    """
    try:
        client = get_ollama_client()
        response = client.chat.completions.create(
            model=get_ollama_model(),
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ],
            response_format={"type": "json_object"},
            temperature=0.2,
        )
        content = response.choices[0].message.content
        return json.loads(content) if content else None
    except Exception:
        return None


def load_agent_config(agent_name: str) -> dict[str, Any]:
    """Flatten this agent's agent_config rows into a {key: value} dict."""
    result = (
        get_supabase()
        .table("agent_config")
        .select("config_key, config_value")
        .eq("agent_name", agent_name)
        .execute()
    )
    return {row["config_key"]: row["config_value"] for row in (result.data or [])}


def get_store_config(key: str, default: Any = None) -> Any:
    """Look up a single store_config value (used for approval thresholds)."""
    result = (
        get_supabase()
        .table("store_config")
        .select("config_value")
        .eq("config_key", key)
        .maybe_single()
        .execute()
    )
    if not result.data:
        return default
    return result.data["config_value"]


def log_task(
    agent_name: str,
    task_type: str,
    status: str,
    input_data: dict[str, Any] | None = None,
    output_data: dict[str, Any] | None = None,
    model_used: str | None = None,
    correlation_id: UUID | None = None,
    human_approved: bool = False,
) -> str:
    """Insert one row into agent_task_log for this run. Returns the log_id."""
    row = {
        "agent_name": agent_name,
        "task_type": task_type,
        "status": status,
        "input_data": input_data,
        "output_data": output_data,
        "model_used": model_used,
        "correlation_id": str(correlation_id) if correlation_id else None,
        "human_approved": human_approved,
    }
    result = get_supabase().table("agent_task_log").insert(row).execute()
    return result.data[0]["log_id"]


def enqueue_review(
    item_type: str,
    reference_id: str,
    agent_name: str,
    summary: str,
    payload: dict[str, Any] | None = None,
) -> str:
    """Insert one pending row into review_queue. Returns the review_id."""
    row = {
        "item_type": item_type,
        "reference_id": reference_id,
        "agent_name": agent_name,
        "summary": summary,
        "payload": payload,
        "status": "pending",
    }
    result = get_supabase().table("review_queue").insert(row).execute()
    return result.data[0]["review_id"]


def new_correlation_id() -> UUID:
    return uuid4()
