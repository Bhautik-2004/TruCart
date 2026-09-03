"""One-off: embed every knowledge_base row that has no embedding yet.

Run once after loading the seed data and pulling an embedding model:

    ollama pull nomic-embed-text
    python -m backend.scripts.backfill_kb_embeddings

Safe to re-run: it only touches rows where embedding IS NULL.
"""
import sys
from pathlib import Path

from dotenv import load_dotenv

load_dotenv(Path(__file__).resolve().parents[2] / ".env.local")

from backend.agents.rag import embed_text, get_embedding_model  # noqa: E402
from backend.db import get_supabase  # noqa: E402

BATCH = 200


def main() -> int:
    supabase = get_supabase()
    model = get_embedding_model()
    print(f"embedding model: {model}")

    done = 0
    failed = 0
    while True:
        rows = (
            supabase.table("knowledge_base")
            .select("kb_id, title, content")
            .is_("embedding", "null")
            .limit(BATCH)
            .execute()
            .data
            or []
        )
        if not rows:
            break
        for row in rows:
            text = f"{row.get('title') or ''}\n{row.get('content') or ''}"
            vec = embed_text(text)
            if vec is None:
                failed += 1
                continue
            supabase.table("knowledge_base").update({"embedding": vec}).eq("kb_id", row["kb_id"]).execute()
            done += 1
        print(f"  embedded {done} rows so far ({failed} failed)...")

    print(f"done: {done} embedded, {failed} failed")
    return 1 if (done == 0 and failed > 0) else 0


if __name__ == "__main__":
    sys.exit(main())
