"""Third-party integrations API. Every provider is fully implemented against
its real REST API, but each requires the operator's own (potentially paid)
account credentials — so every action is gated on env vars and returns a
clear "add X to .env.local" message instead of failing silently or being
stubbed out when a key is missing.
"""

import logging

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

from ..integrations import razorpay, shopify, stripe, whatsapp
from ..integrations.base import IntegrationNotConfigured

logger = logging.getLogger("trucart.integrations")

router = APIRouter(prefix="/api/integrations", tags=["integrations"])


class WhatsAppUpdateRequest(BaseModel):
    to_phone: str
    order_number: str
    status: str


def _not_configured_response(exc: IntegrationNotConfigured):
    raise HTTPException(
        status_code=412,
        detail={
            "error": "not_configured",
            "provider": exc.provider,
            "missing_env": exc.missing_env,
            "message": f"Add {', '.join(exc.missing_env)} to .env.local to enable {exc.provider}.",
        },
    )


@router.get("/status")
def integrations_status():
    return {
        "stripe": stripe.status(),
        "razorpay": razorpay.status(),
        "whatsapp": whatsapp.status(),
        "shopify": shopify.status(),
    }


@router.get("/payments/stripe")
def stripe_payments(limit: int = 10):
    try:
        return {"payments": stripe.list_recent_payments(limit=limit)}
    except IntegrationNotConfigured as exc:
        _not_configured_response(exc)
    except Exception as exc:
        logger.exception("stripe lookup failed")
        raise HTTPException(status_code=502, detail=str(exc))


@router.get("/payments/razorpay")
def razorpay_payments(count: int = 10):
    try:
        return {"payments": razorpay.list_recent_payments(count=count)}
    except IntegrationNotConfigured as exc:
        _not_configured_response(exc)
    except Exception as exc:
        logger.exception("razorpay lookup failed")
        raise HTTPException(status_code=502, detail=str(exc))


@router.get("/shopify/products")
def shopify_products(limit: int = 10):
    try:
        return {"products": shopify.list_products(limit=limit)}
    except IntegrationNotConfigured as exc:
        _not_configured_response(exc)
    except Exception as exc:
        logger.exception("shopify products lookup failed")
        raise HTTPException(status_code=502, detail=str(exc))


@router.get("/shopify/orders")
def shopify_orders(limit: int = 10):
    try:
        return {"orders": shopify.list_orders(limit=limit)}
    except IntegrationNotConfigured as exc:
        _not_configured_response(exc)
    except Exception as exc:
        logger.exception("shopify orders lookup failed")
        raise HTTPException(status_code=502, detail=str(exc))


@router.post("/whatsapp/order-update")
def whatsapp_order_update(body: WhatsAppUpdateRequest):
    try:
        return whatsapp.send_order_update(body.to_phone, body.order_number, body.status)
    except IntegrationNotConfigured as exc:
        _not_configured_response(exc)
    except Exception as exc:
        logger.exception("whatsapp send failed")
        raise HTTPException(status_code=502, detail=str(exc))
