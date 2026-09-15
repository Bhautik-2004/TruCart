"""AI Enhancements API: ticket sentiment, AI-generated reports, and the
store-ops chatbot — the customer-facing "AI tools" surface layered on top of
the existing autonomous agents.
"""

import logging

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

from ..agents.chat import execute_tool, run_chat
from ..agents.crm import compute_customer_segments, next_best_action
from ..agents.explain import explain_ledger_action, explain_review_item
from ..agents.reports import generate_report, list_reports
from ..agents.reviews import analyze_review, bulk_analyze_reviews, summarize_product_reviews
from ..agents.support import analyze_ticket_sentiment, bulk_sentiment_analysis

logger = logging.getLogger("trucart.ai_tools")

router = APIRouter(prefix="/api/ai-tools", tags=["ai-tools"])


class ChatRequest(BaseModel):
    message: str
    history: list[dict[str, str]] = []


class ChatExecuteRequest(BaseModel):
    tool: str
    args: dict = {}


class NextBestActionRequest(BaseModel):
    segment: str


class ReportRequest(BaseModel):
    period: str = "week"
    focus: str | None = None


@router.post("/sentiment/bulk")
def sentiment_bulk(limit: int = 20):
    try:
        return bulk_sentiment_analysis(limit=limit)
    except Exception as exc:
        logger.exception("bulk sentiment analysis failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/sentiment/{ticket_id}")
def sentiment_single(ticket_id: str):
    try:
        return analyze_ticket_sentiment(ticket_id)
    except Exception as exc:
        logger.exception("sentiment analysis failed for ticket %s", ticket_id)
        raise HTTPException(status_code=500, detail=str(exc))


@router.get("/crm/segments")
def crm_segments():
    try:
        return compute_customer_segments()
    except Exception as exc:
        logger.exception("crm segmentation failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/crm/next-best-action")
def crm_next_best_action(body: NextBestActionRequest):
    try:
        return next_best_action(body.segment)
    except Exception as exc:
        logger.exception("crm next-best-action failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/reviews/sentiment/bulk")
def review_sentiment_bulk(limit: int = 30):
    try:
        return bulk_analyze_reviews(limit=limit)
    except Exception as exc:
        logger.exception("bulk review sentiment analysis failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/reviews/sentiment/{review_id}")
def review_sentiment_single(review_id: str):
    try:
        return analyze_review(review_id)
    except Exception as exc:
        logger.exception("review sentiment analysis failed for %s", review_id)
        raise HTTPException(status_code=500, detail=str(exc))


@router.get("/reviews/summary/{product_id}")
def review_summary(product_id: str):
    try:
        return summarize_product_reviews(product_id)
    except Exception as exc:
        logger.exception("review summary failed for product %s", product_id)
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/report")
def report_generate(body: ReportRequest):
    try:
        return generate_report(period=body.period, focus=body.focus)
    except Exception as exc:
        logger.exception("report generation failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.get("/report")
def report_history(limit: int = 20):
    try:
        return {"reports": list_reports(limit=limit)}
    except Exception as exc:
        logger.exception("report history fetch failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/explain/review/{review_id}")
def explain_review(review_id: str):
    try:
        return explain_review_item(review_id)
    except Exception as exc:
        logger.exception("explain review item failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/explain/ledger/{action_id}")
def explain_ledger(action_id: str):
    try:
        return explain_ledger_action(action_id)
    except Exception as exc:
        logger.exception("explain ledger action failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/chat")
def chat(body: ChatRequest):
    try:
        return run_chat(body.message, body.history)
    except Exception as exc:
        logger.exception("chat failed")
        raise HTTPException(status_code=500, detail=str(exc))


@router.post("/chat/execute")
def chat_execute(body: ChatExecuteRequest):
    """Runs a tool the copilot proposed, after the operator confirmed it in
    the UI. Never called automatically by run_chat for a write tool."""
    try:
        return execute_tool(body.tool, body.args)
    except Exception as exc:
        logger.exception("chat tool execution failed")
        raise HTTPException(status_code=500, detail=str(exc))
