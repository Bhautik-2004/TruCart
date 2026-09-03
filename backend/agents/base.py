import json
import os
from typing import Any
from uuid import UUID, uuid4

from ..db import get_supabase

_ollama_client: Any = None
_ollama_client_traced = False
_langfuse_disabled = False

# Token usage accumulated per (correlation_id, agent_name) between the LLM calls
# an agent makes during one run and the single log_task() row it writes at the
# end. Keyed by both ids because the orchestrator runs every agent under one
# shared correlation_id. Drained by log_task().
_run_token_usage: dict[tuple[str, str], int] = {}


def _record_token_usage(correlation_id: UUID | None, agent_name: str, response: Any) -> None:
    """Add this completion's total_tokens to the running tally for the agent."""
    if correlation_id is None:
        return
    usage = getattr(response, "usage", None)
    total = getattr(usage, "total_tokens", None) if usage is not None else None
    if not total:
        return
    key = (str(correlation_id), agent_name)
    _run_token_usage[key] = _run_token_usage.get(key, 0) + int(total)


def collect_run_token_usage(correlation_id: UUID | None, agent_name: str) -> int | None:
    """Pop the accumulated token count for one agent run. Returns None when the
    agent made no (successful) LLM calls, so the column stays NULL rather than 0."""
    if correlation_id is None:
        return None
    return _run_token_usage.pop((str(correlation_id), agent_name), None)


def _langfuse_configured() -> bool:
    return bool(os.getenv("LANGFUSE_PUBLIC_KEY", "").strip() and os.getenv("LANGFUSE_SECRET_KEY", "").strip())


def get_langfuse_client() -> Any:
    """Return the shared Langfuse client (via get_client()), or None if it
    isn't configured. Missing keys or an SDK/init failure permanently
    disables tracing for the rest of the process rather than raising — LLM
    tracing must never be able to break an agent run.
    """
    global _langfuse_disabled
    if _langfuse_disabled:
        return None
    if not _langfuse_configured():
        _langfuse_disabled = True
        return None
    try:
        from langfuse import get_client

        return get_client()
    except Exception:
        _langfuse_disabled = True
        return None


def get_ollama_client() -> Any:
    """Return a shared client pointed at Ollama's OpenAI-compatible endpoint.

    When Langfuse is configured, this is Langfuse's OpenAI drop-in wrapper
    (`langfuse.openai`), so every chat completion is automatically captured
    as a generation — model, token usage, latency, and API errors — with no
    manual span bookkeeping. Falls back to the plain OpenAI client when
    Langfuse isn't configured. Per Langfuse's own guidance, the wrapped
    client must be constructed only after env vars are loaded (main.py calls
    load_dotenv() before this module is ever used).
    """
    global _ollama_client, _ollama_client_traced
    if _ollama_client is None:
        base_url = os.getenv("OLLAMA_BASE_URL", "http://localhost:11434").rstrip("/")
        if _langfuse_configured():
            from langfuse.openai import openai as _openai_module

            _ollama_client_traced = True
        else:
            import openai as _openai_module

            _ollama_client_traced = False
        _ollama_client = _openai_module.OpenAI(base_url=f"{base_url}/v1", api_key="ollama")
    return _ollama_client


def get_ollama_model() -> str:
    return os.getenv("OLLAMA_MODEL", "qwen2.5:7b")


def call_llm_json(
    system_prompt: str,
    user_prompt: str,
    *,
    agent_name: str,
    correlation_id: UUID | None = None,
    call_name: str | None = None,
    trace_metadata: dict[str, Any] | None = None,
) -> dict[str, Any] | None:
    """Ask the local model for a JSON object. Returns None on any failure
    (Ollama down, malformed output, etc.) so callers can fall back to a
    deterministic decision instead of crashing the agent run.

    call_name should be a static, verb-first, descriptive action name (e.g.
    "generate-restock-justifications") — never include a dynamic id (ticket
    id, SKU, ...) in it, or every call becomes its own ungroupable name in
    the Langfuse UI. Put per-call identifiers in trace_metadata instead.

    If correlation_id is given and Langfuse is configured, the call is
    wrapped in a Langfuse observation whose trace is keyed by
    create_trace_id(seed=correlation_id) — the same id already written to
    the Supabase agent_task_log row for this run, so both systems can be
    cross-referenced by one id. Tracing is best-effort: any Langfuse failure
    is swallowed and never affects this function's return value.
    """
    name = call_name or "llm-call"
    client = get_ollama_client()
    langfuse = get_langfuse_client() if correlation_id is not None else None

    def _run() -> dict[str, Any] | None:
        extra: dict[str, Any] = {}
        if _ollama_client_traced:
            extra["name"] = name
            extra["metadata"] = {"agent": agent_name, **(trace_metadata or {})}
        response = client.chat.completions.create(
            model=get_ollama_model(),
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ],
            response_format={"type": "json_object"},
            temperature=0.2,
            **extra,
        )
        content = response.choices[0].message.content
        if not content:
            raise ValueError("Model returned empty output.")
        parsed = json.loads(content)
        _record_token_usage(correlation_id, agent_name, response)
        return parsed

    if langfuse is None:
        try:
            return _run()
        except Exception:
            return None

    span_input = {"agent": agent_name, "call": name, **(trace_metadata or {})}
    try:
        from langfuse import propagate_attributes

        trace_context = {"trace_id": langfuse.create_trace_id(seed=str(correlation_id))}
        with langfuse.start_as_current_observation(
            as_type="span",
            name=name,
            trace_context=trace_context,
            input=span_input,
            metadata={"agent": agent_name},
        ) as span:
            with propagate_attributes(tags=[agent_name]):
                try:
                    result = _run()
                    span.update(output={"parsed": result} if result is not None else None)
                    return result
                except Exception as exc:
                    try:
                        langfuse.update_current_span(level="ERROR", status_message=str(exc))
                    except Exception:
                        pass
                    return None
    except Exception:
        # Langfuse span setup itself failed — still make the underlying call.
        try:
            return _run()
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
    tokens_used: int | None = None,
) -> str:
    """Insert one row into agent_task_log for this run. Returns the log_id.

    tokens_used defaults to the total drained from the LLM calls this agent made
    under correlation_id (see collect_run_token_usage); pass an explicit value to
    override. cost_usd is left at the column default (0) — the agents run against
    a local Ollama model, so there is no per-token cost to record.
    """
    if tokens_used is None:
        tokens_used = collect_run_token_usage(correlation_id, agent_name)
    row = {
        "agent_name": agent_name,
        "task_type": task_type,
        "status": status,
        "input_data": input_data,
        "output_data": output_data,
        "model_used": model_used,
        "correlation_id": str(correlation_id) if correlation_id else None,
        "human_approved": human_approved,
        "tokens_used": tokens_used,
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
    review_id = result.data[0]["review_id"]
    notify(
        "Review needed",
        f"{agent_name.replace('_', ' ')}: {summary}",
        type="warning",
        reference_id=review_id,
        reference_type="review_queue",
    )
    return review_id


def notify(
    title: str,
    message: str,
    *,
    type: str = "info",
    reference_id: str | None = None,
    reference_type: str | None = None,
) -> None:
    """Write one row to the notifications table (the dashboard bell / feed).

    Best-effort: a notification must never break an agent run, so any failure is
    swallowed. `type` matches the values the UI styles: info, success, warning,
    order, agent, system.
    """
    try:
        get_supabase().table("notifications").insert({
            "title": title,
            "message": message,
            "type": type,
            "reference_id": reference_id,
            "reference_type": reference_type,
        }).execute()
    except Exception:
        pass


def new_correlation_id() -> UUID:
    return uuid4()
