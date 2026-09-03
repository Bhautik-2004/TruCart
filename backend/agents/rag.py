import os
from typing import Any

from ..db import get_supabase
from .base import get_ollama_client


def get_embedding_model() -> str:
    # Any local 768-dim embedding model works; nomic-embed-text is the default.
    return os.getenv("EMBEDDING_MODEL", "nomic-embed-text")


def embed_text(text: str) -> list[float] | None:
    """Embed a string with the local embedding model. Returns None on any
    failure so retrieval degrades to "no context" instead of breaking a run.
    """
    text = (text or "").strip()
    if not text:
        return None
    try:
        client = get_ollama_client()
        resp = client.embeddings.create(model=get_embedding_model(), input=text[:8000])
        return list(resp.data[0].embedding)
    except Exception:
        return None


def retrieve(query_text: str, k: int = 4) -> list[dict[str, Any]]:
    """Return the top-k knowledge_base rows for a query, or [] if embedding or
    the RPC is unavailable. Each row: kb_id, doc_type, title, content, similarity.
    """
    embedding = embed_text(query_text)
    if embedding is None:
        return []
    try:
        result = get_supabase().rpc(
            "match_knowledge_base",
            {"query_embedding": embedding, "match_count": k},
        ).execute()
        return result.data or []
    except Exception:
        return []


def format_context(chunks: list[dict[str, Any]]) -> str:
    """Render retrieved chunks into a compact block for a system prompt."""
    parts = []
    for c in chunks:
        title = c.get("title") or ""
        doc_type = c.get("doc_type") or "doc"
        body = (c.get("content") or "").strip()
        parts.append(f"[{doc_type}] {title}\n{body}")
    return "\n\n".join(parts)
