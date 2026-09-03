-- ============================================================================
-- 012 - Vector search function for the knowledge base (RAG)
-- Depends on: 001 (pgvector), 004 (knowledge_base + HNSW index)
--
-- Called from the support agent via the Supabase RPC client:
--   supabase.rpc("match_knowledge_base", {"query_embedding": [...], "match_count": 4})
-- Embeddings are produced at runtime by a local embedding model (see
-- backend/agents/rag.py and backend/scripts/backfill_kb_embeddings.py).
-- ============================================================================

CREATE OR REPLACE FUNCTION match_knowledge_base(
    query_embedding vector(768),
    match_count int DEFAULT 4
)
RETURNS TABLE (
    kb_id uuid,
    doc_type varchar,
    title varchar,
    content text,
    similarity float
)
LANGUAGE sql STABLE
AS $$
    SELECT
        kb.kb_id,
        kb.doc_type,
        kb.title,
        kb.content,
        1 - (kb.embedding <=> query_embedding) AS similarity
    FROM knowledge_base kb
    WHERE kb.embedding IS NOT NULL
    ORDER BY kb.embedding <=> query_embedding
    LIMIT GREATEST(match_count, 1);
$$;
