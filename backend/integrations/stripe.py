"""Stripe integration via the plain REST API (no stripe SDK dependency needed
for the handful of calls this demo makes). Requires a real Stripe account —
free to create, and test-mode keys/charges cost nothing — but this is
explicitly outside the zero-spend infra budget, so it's gated behind an env
var rather than assumed available.
"""

import os

import httpx

from .base import IntegrationNotConfigured

_REQUIRED = ["STRIPE_SECRET_KEY"]
_API_BASE = "https://api.stripe.com/v1"


def missing_env() -> list[str]:
    return [v for v in _REQUIRED if not os.getenv(v, "").strip()]


def is_configured() -> bool:
    return not missing_env()


def _require_configured() -> str:
    missing = missing_env()
    if missing:
        raise IntegrationNotConfigured("Stripe", missing)
    return os.getenv("STRIPE_SECRET_KEY").strip()


def status() -> dict:
    return {"provider": "stripe", "configured": is_configured(), "missing_env": missing_env()}


def list_recent_payments(limit: int = 10) -> list[dict]:
    key = _require_configured()
    resp = httpx.get(
        f"{_API_BASE}/charges",
        params={"limit": limit},
        auth=(key, ""),
        timeout=10.0,
    )
    resp.raise_for_status()
    return resp.json().get("data", [])
