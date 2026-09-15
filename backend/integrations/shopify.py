"""Shopify Admin API integration (product/order sync). Requires the
operator's own Shopify store + a free development store or custom-app access
token — gated behind env vars rather than assumed available.
"""

import os

import httpx

from .base import IntegrationNotConfigured

_REQUIRED = ["SHOPIFY_STORE_DOMAIN", "SHOPIFY_ACCESS_TOKEN"]
_API_VERSION = "2024-10"


def missing_env() -> list[str]:
    return [v for v in _REQUIRED if not os.getenv(v, "").strip()]


def is_configured() -> bool:
    return not missing_env()


def _require_configured() -> tuple[str, str]:
    missing = missing_env()
    if missing:
        raise IntegrationNotConfigured("Shopify", missing)
    return os.getenv("SHOPIFY_STORE_DOMAIN").strip(), os.getenv("SHOPIFY_ACCESS_TOKEN").strip()


def status() -> dict:
    return {"provider": "shopify", "configured": is_configured(), "missing_env": missing_env()}


def list_products(limit: int = 10) -> list[dict]:
    domain, token = _require_configured()
    resp = httpx.get(
        f"https://{domain}/admin/api/{_API_VERSION}/products.json",
        params={"limit": limit},
        headers={"X-Shopify-Access-Token": token},
        timeout=10.0,
    )
    resp.raise_for_status()
    return resp.json().get("products", [])


def list_orders(limit: int = 10) -> list[dict]:
    domain, token = _require_configured()
    resp = httpx.get(
        f"https://{domain}/admin/api/{_API_VERSION}/orders.json",
        params={"limit": limit, "status": "any"},
        headers={"X-Shopify-Access-Token": token},
        timeout=10.0,
    )
    resp.raise_for_status()
    return resp.json().get("orders", [])
