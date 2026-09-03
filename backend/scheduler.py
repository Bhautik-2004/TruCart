import logging
import os

logger = logging.getLogger("trucart.scheduler")

_scheduler = None


def _env_flag(name: str, default: bool = False) -> bool:
    raw = os.getenv(name)
    if raw is None:
        return default
    return raw.strip().lower() in {"1", "true", "yes", "on"}


def start_scheduler():
    """Start the background orchestrator loop if SCHEDULER_ENABLED is set.

    Uses APScheduler's BackgroundScheduler (its own thread) because
    run_orchestrator() is synchronous and does blocking Supabase / LLM I/O -
    running it on the request event loop would stall the API.
    """
    global _scheduler
    if _scheduler is not None:
        return _scheduler
    if not _env_flag("SCHEDULER_ENABLED", False):
        logger.info("scheduler disabled (set SCHEDULER_ENABLED=true to enable)")
        return None

    try:
        interval_minutes = float(os.getenv("ORCHESTRATOR_INTERVAL_MINUTES", "10"))
    except ValueError:
        interval_minutes = 10.0

    from apscheduler.schedulers.background import BackgroundScheduler

    from .agents.orchestrator import run_orchestrator

    def _tick():
        try:
            result = run_orchestrator()
            logger.info(
                "orchestrator cycle %s: status=%s totals=%s",
                result.get("cycle_id"), result.get("status"), result.get("summary"),
            )
        except Exception:  # noqa: BLE001 - a bad tick must not kill the scheduler
            logger.exception("orchestrator cycle failed")

    _scheduler = BackgroundScheduler(timezone="UTC")
    _scheduler.add_job(
        _tick,
        "interval",
        minutes=interval_minutes,
        id="orchestrator_cycle",
        max_instances=1,
        coalesce=True,
    )
    _scheduler.start()
    logger.info("scheduler started: orchestrator every %s min", interval_minutes)
    return _scheduler


def stop_scheduler():
    global _scheduler
    if _scheduler is not None:
        try:
            _scheduler.shutdown(wait=False)
        except Exception:  # noqa: BLE001
            pass
        _scheduler = None
