"""Razorpay integration via the plain REST API. Razorpay's own free test mode
covers the sandbox flows this demo needs, but real keys are a paid-account
credential the operator must supply — gated behind env vars, not assumed.
"""

import os

import httpx

from .base import IntegrationNotConfigured

_REQUIRED = ["RAZORPAY_KEY_ID", "RAZORPAY_KEY_SECRET"]
_API_BASE = "https://api.razorpay.com/v1"


def missing_env() -> list[str]:
    return [v for v in _REQUIRED if not os.getenv(v, "").strip()]


def is_configured() -> bool:
    return not missing_env()


def _require_configured() -> tuple[str, str]:
    missing = missing_env()
    if missing:
        raise IntegrationNotConfigured("Razorpay", missing)
    return os.getenv("RAZORPAY_KEY_ID").strip(), os.getenv("RAZORPAY_KEY_SECRET").strip()


def status() -> dict:
    return {"provider": "razorpay", "configured": is_configured(), "missing_env": missing_env()}


def list_recent_payments(count: int = 10) -> list[dict]:
    key_id, key_secret = _require_configured()
    resp = httpx.get(
        f"{_API_BASE}/payments",
        params={"count": count},
        auth=(key_id, key_secret),
        timeout=10.0,
    )
    resp.raise_for_status()
    return resp.json().get("items", [])
