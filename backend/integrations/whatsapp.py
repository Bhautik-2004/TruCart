"""WhatsApp order-update messages via Twilio's WhatsApp API. Twilio's sandbox
is free to use for testing, but still requires the operator's own Twilio
account credentials — gated behind env vars rather than assumed available.
"""

import os

import httpx

from .base import IntegrationNotConfigured

_REQUIRED = ["TWILIO_ACCOUNT_SID", "TWILIO_AUTH_TOKEN", "TWILIO_WHATSAPP_FROM"]


def missing_env() -> list[str]:
    return [v for v in _REQUIRED if not os.getenv(v, "").strip()]


def is_configured() -> bool:
    return not missing_env()


def status() -> dict:
    return {"provider": "whatsapp", "configured": is_configured(), "missing_env": missing_env()}


def send_order_update(to_phone: str, order_number: str, status_text: str) -> dict:
    missing = missing_env()
    if missing:
        raise IntegrationNotConfigured("WhatsApp (Twilio)", missing)

    account_sid = os.getenv("TWILIO_ACCOUNT_SID").strip()
    auth_token = os.getenv("TWILIO_AUTH_TOKEN").strip()
    from_number = os.getenv("TWILIO_WHATSAPP_FROM").strip()

    resp = httpx.post(
        f"https://api.twilio.com/2010-04-01/Accounts/{account_sid}/Messages.json",
        data={
            "From": f"whatsapp:{from_number}",
            "To": f"whatsapp:{to_phone}",
            "Body": f"Order {order_number} update: {status_text}",
        },
        auth=(account_sid, auth_token),
        timeout=10.0,
    )
    resp.raise_for_status()
    return resp.json()
