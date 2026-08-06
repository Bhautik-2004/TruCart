import os

from fastapi import HTTPException
from supabase import Client, create_client

_client: Client | None = None


def get_supabase() -> Client:
    """Return a shared Supabase client backed by the service_role key.

    The service_role key is used server-side only and bypasses row-level
    security, letting the backend read/write operational tables directly.
    """
    global _client
    if _client is None:
        url = os.getenv("SUPABASE_URL", "").strip()
        key = os.getenv("SUPABASE_SERVICE_ROLE_KEY", "").strip()
        if not url or not key or key.startswith("<"):
            raise HTTPException(
                status_code=500,
                detail="SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY are not configured.",
            )
        _client = create_client(url, key)
    return _client