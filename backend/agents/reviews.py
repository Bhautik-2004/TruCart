"""Product review sentiment analysis + per-product AI summaries. Same
pattern as agents.support.analyze_ticket_sentiment / bulk_sentiment_analysis,
applied to product_reviews instead of support_tickets (see migration 019).
"""

from datetime import datetime, timezone
from typing import Any

from ..db import get_supabase
from .base import call_llm_json, new_correlation_id

AGENT_NAME = "reviews_agent"
_VALID_SENTIMENTS = {"positive", "neutral", "negative"}


def analyze_review(review_id: str) -> dict[str, Any]:
    """Score one review's sentiment with the LLM and persist it. Falls back
    to a neutral/unscored result rather than raising, so a bulk sweep can
    keep going past one bad review."""
    supabase = get_supabase()
    rows = (
        supabase.table("product_reviews")
        .select("review_id, rating, body")
        .eq("review_id", review_id)
        .limit(1)
        .execute()
        .data
        or []
    )
    if not rows:
        return {"review_id": review_id, "sentiment_label": None, "sentiment_score": None, "error": "review not found"}

    review = rows[0]
    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=(
            "You are a customer sentiment analysis assistant for an e-commerce product review. "
            "Read the star rating and the review text and judge the customer's sentiment. Return JSON: "
            '{"sentiment": "positive" | "neutral" | "negative", '
            '"sentiment_score": -1.0 to 1.0, '
            '"summary": "one short phrase, e.g. \'praises battery life\' or \'complains about build quality\'"}.'
        ),
        user_prompt=str({"rating": review["rating"], "body": review["body"]}),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="analyze-review-sentiment",
        trace_metadata={"review_id": review_id},
    )

    if llm_result is None:
        sentiment, score, summary = "neutral", 0.0, "Unable to analyze sentiment (LLM unavailable)."
    else:
        sentiment = str(llm_result.get("sentiment") or "neutral").lower()
        if sentiment not in _VALID_SENTIMENTS:
            sentiment = "neutral"
        try:
            score = max(-1.0, min(1.0, float(llm_result.get("sentiment_score") or 0)))
        except (TypeError, ValueError):
            score = 0.0
        summary = llm_result.get("summary") or ""

    analyzed_at = datetime.now(timezone.utc).isoformat()
    supabase.table("product_reviews").update({
        "sentiment_label": sentiment,
        "sentiment_score": score,
        "sentiment_summary": summary,
        "sentiment_analyzed_at": analyzed_at,
    }).eq("review_id", review_id).execute()

    return {
        "review_id": review_id,
        "sentiment_label": sentiment,
        "sentiment_score": score,
        "sentiment_summary": summary,
        "sentiment_analyzed_at": analyzed_at,
    }


def bulk_analyze_reviews(limit: int = 30) -> dict[str, Any]:
    """Analyze sentiment for the most recent reviews that have not been
    scored yet. Returns per-review results plus a breakdown count."""
    supabase = get_supabase()
    reviews = (
        supabase.table("product_reviews")
        .select("review_id")
        .is_("sentiment_analyzed_at", "null")
        .order("created_at", desc=True)
        .limit(limit)
        .execute()
        .data
        or []
    )

    results = [analyze_review(r["review_id"]) for r in reviews]
    breakdown = {"positive": 0, "neutral": 0, "negative": 0}
    for r in results:
        label = r.get("sentiment_label")
        if label in breakdown:
            breakdown[label] += 1

    return {"analyzed": len(results), "breakdown": breakdown, "results": results}


def summarize_product_reviews(product_id: str) -> dict[str, Any]:
    """Have the LLM roll up every review for one product into a short
    "customers love X / complain about Y" summary."""
    supabase = get_supabase()
    reviews = (
        supabase.table("product_reviews")
        .select("rating, body, sentiment_label")
        .eq("product_id", product_id)
        .order("created_at", desc=True)
        .limit(50)
        .execute()
        .data
        or []
    )
    if not reviews:
        return {"product_id": product_id, "summary": "No reviews yet.", "review_count": 0, "average_rating": None}

    average_rating = round(sum(r["rating"] for r in reviews) / len(reviews), 2)
    correlation_id = new_correlation_id()
    llm_result = call_llm_json(
        system_prompt=(
            "You are summarizing customer reviews for one product for a store operator. "
            "Given a list of {rating, body} reviews, write 2-4 sentences: what customers love, "
            "what they complain about, and an overall read on satisfaction. "
            'Return JSON: {"summary": "..."}.'
        ),
        user_prompt=str({"reviews": reviews, "average_rating": average_rating}),
        agent_name=AGENT_NAME,
        correlation_id=correlation_id,
        call_name="summarize-product-reviews",
        trace_metadata={"product_id": product_id},
    )
    summary = (llm_result or {}).get("summary") or "Summary unavailable (LLM unreachable)."

    return {
        "product_id": product_id,
        "summary": summary,
        "review_count": len(reviews),
        "average_rating": average_rating,
    }
