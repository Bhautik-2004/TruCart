-- ============================================================================
-- 001 - Extensions & shared trigger function
-- Run this file FIRST in the Supabase SQL Editor.
-- Idempotent: safe to run more than once.
-- ============================================================================

-- pgvector: available out of the box on Supabase.
CREATE EXTENSION IF NOT EXISTS vector;

-- Ensure UUID generation is available (built into PG 13+; explicit for safety).
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ----------------------------------------------------------------------------
-- Generic trigger function used by every table that has an updated_at column.
-- Must exist before any table that attaches it via CREATE TRIGGER.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at := now();
    RETURN NEW;
END;
$$;