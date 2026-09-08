"""Autopilot Ledger read API + a manual verification trigger for demos."""

import logging
from datetime import datetime, timedelta, timezone
from typing import Any

from fastapi import APIRouter, Query

from ..agents.verification import run_verification_sweep
from ..db import get_supabase

logger = logging.getLogger("trucart.ledger.api")

router = APIRouter(prefix="/api/ledger", tags=["ledger"])

# Which agents the ledger grades (judgement calls with money at stake). The
# order/logistics agents are mechanical and are not scored.
_TRACKED_AGENTS = ["pricing_agent", "inventory_agent", "marketing_agent", "support_agent"]


def _since(days: int) -> datetime:
    return datetime.now(timezone.utc) - timedelta(days=days)


def _parse(ts: str | None) -> datetime | None:
    if not ts:
        return None
    try:
        return datetime.fromisoformat(ts.replace("Z", "+00:00"))
    except ValueError:
        return None


def _trust_score(win_rate: float, verified: int, median_cal_err: float, avg_abs_baseline: float) -> int:
    volume = min(1.0, verified / 15)
    calib = 1.0 / (1.0 + (median_cal_err / avg_abs_baseline if avg_abs_baseline > 0 else 0))
    return round(100 * (0.6 * win_rate + 0.25 * volume + 0.15 * calib))


@router.get("/summary")
def ledger_summary() -> dict[str, Any]:
    supabase = get_supabase()
    rows = (
        supabase.table("agent_action")
        .select("agent_name, action_type, status, grade, measurability, "
                "realized_delta_inr, baseline_delta_inr, calibration_error, created_at, verified_at")
        .order("created_at", desc=True)
        .limit(2000)
        .execute()
        .data
        or []
    )

    per_agent: dict[str, dict[str, Any]] = {}
    headline = {"measured_30d": 0.0, "estimated_30d": 0.0, "measured_90d": 0.0, "estimated_90d": 0.0}
    d30, d90 = _since(30), _since(90)

    for agent in _TRACKED_AGENTS:
        a_rows = [r for r in rows if r["agent_name"] == agent]
        verified = [r for r in a_rows if r["status"] == "verified"]
        decisive = [r for r in verified if r["grade"] in ("win", "loss")]
        wins = sum(1 for r in decisive if r["grade"] == "win")
        win_rate = wins / len(decisive) if decisive else 0.0
        cal_errs = sorted(float(r["calibration_error"]) for r in verified if r.get("calibration_error") is not None)
        median_cal = cal_errs[len(cal_errs) // 2] if cal_errs else 0.0
        abs_baselines = [abs(float(r["baseline_delta_inr"])) for r in verified if r.get("baseline_delta_inr") is not None]
        avg_abs_baseline = (sum(abs_baselines) / len(abs_baselines)) if abs_baselines else 0.0

        def _realized(since_dt: datetime) -> float:
            return round(sum(
                float(r["realized_delta_inr"] or 0) - float(r["baseline_delta_inr"] or 0)
                for r in verified
                if (_parse(r["verified_at"]) or datetime.min.replace(tzinfo=timezone.utc)) >= since_dt
            ), 2)

        realized_30 = _realized(d30)
        realized_90 = _realized(d90)
        for r in verified:
            vt = _parse(r["verified_at"])
            if not vt:
                continue
            net = float(r["realized_delta_inr"] or 0) - float(r["baseline_delta_inr"] or 0)
            bucket = "measured" if r["measurability"] == "measured" else "estimated"
            if vt >= d30:
                headline[f"{bucket}_30d"] += net
            if vt >= d90:
                headline[f"{bucket}_90d"] += net

        per_agent[agent] = {
            "agent_name": agent,
            "verified": len(verified),
            "pending": sum(1 for r in a_rows if r["status"] == "pending"),
            "wins": wins,
            "losses": sum(1 for r in decisive if r["grade"] == "loss"),
            "neutral": sum(1 for r in verified if r["grade"] == "neutral"),
            "win_rate": round(win_rate, 3),
            "realized_delta_30d_inr": realized_30,
            "realized_delta_90d_inr": realized_90,
            "median_calibration_error_inr": round(median_cal, 2),
            "trust_score": _trust_score(win_rate, len(verified), median_cal, avg_abs_baseline),
        }

    return {
        "headline": {k: round(v, 2) for k, v in headline.items()},
        "agents": [per_agent[a] for a in _TRACKED_AGENTS],
        "total_actions": len(rows),
    }


@router.get("/actions")
def ledger_actions(
    agent: str | None = Query(None),
    grade: str | None = Query(None),
    action_type: str | None = Query(None),
    limit: int = Query(100, ge=1, le=500),
) -> dict[str, Any]:
    supabase = get_supabase()
    q = supabase.table("agent_action").select("*").order("created_at", desc=True).limit(limit)
    if agent:
        q = q.eq("agent_name", agent)
    if grade:
        q = q.eq("grade", grade)
    if action_type:
        q = q.eq("action_type", action_type)
    return {"actions": q.execute().data or []}


@router.post("/verify")
def ledger_verify() -> dict[str, Any]:
    return run_verification_sweep()
