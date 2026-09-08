from typing import Any

from .base import log_task, new_correlation_id
from .inventory import run_inventory_agent
from .logistics import run_logistics_agent
from .marketing import run_marketing_agent
from .orders import run_order_agent
from .pricing import run_pricing_agent
from .support import run_support_agent

AGENT_NAME = "orchestrator"

# One full operations cycle, in dependency order:
#   inventory (raise POs)  ->  orders (confirm + reserve)  ->  logistics (ship)
#   pricing (adjust)       ->  marketing (clear overstock)
#   support (triage tickets)
_PIPELINE = [
    ("inventory_agent", run_inventory_agent),
    ("order_agent", run_order_agent),
    ("logistics_agent", run_logistics_agent),
    ("pricing_agent", run_pricing_agent),
    ("marketing_agent", run_marketing_agent),
    ("support_agent", run_support_agent),
]

_SUMMARY_KEYS = ("scanned", "auto_executed", "escalated")


def run_orchestrator(correlation_id=None) -> dict[str, Any]:
    """Run every agent once, sharing a single correlation_id so the whole cycle
    is one group in agent_task_log and one trace in Langfuse. A failure in one
    agent is recorded and the cycle continues with the rest.
    """
    cycle_id = correlation_id or new_correlation_id()
    results: list[dict[str, Any]] = []
    totals = {key: 0 for key in _SUMMARY_KEYS}

    # Conflict guard: SKUs that inventory or pricing already acted on this cycle
    # are withheld from marketing, so it can't launch a paid clearance on a
    # product that was just repriced or reordered in the same run.
    touched_skus: set[str] = set()

    for name, runner in _PIPELINE:
        try:
            if name == "marketing_agent":
                outcome = runner(cycle_id, skip_product_ids=touched_skus)
            else:
                outcome = runner(cycle_id)
            if isinstance(outcome, dict):
                touched_skus.update(outcome.get("touched_product_ids") or [])
            summary = outcome.get("summary", {}) if isinstance(outcome, dict) else {}
            for key in _SUMMARY_KEYS:
                totals[key] += int(summary.get(key, 0) or 0)
            results.append({
                "agent_name": name,
                "status": outcome.get("status", "completed") if isinstance(outcome, dict) else "completed",
                "log_id": outcome.get("log_id") if isinstance(outcome, dict) else None,
                "summary": summary,
            })
        except Exception as exc:  # noqa: BLE001 - one agent must not abort the cycle
            results.append({"agent_name": name, "status": "error", "summary": {}, "error": str(exc)})

    error_count = sum(1 for r in results if r["status"] == "error")
    if error_count == 0:
        status = "completed"
    elif error_count < len(_PIPELINE):
        status = "partial"
    else:
        status = "error"

    log_id = log_task(
        AGENT_NAME, "cycle", status,
        input_data={"pipeline": [name for name, _ in _PIPELINE]},
        output_data={"agents": results, "totals": totals},
        model_used=None,
        correlation_id=cycle_id,
    )

    return {
        "status": status,
        "agent_name": AGENT_NAME,
        "log_id": log_id,
        "correlation_id": str(cycle_id),
        "cycle_id": str(cycle_id),
        "agents": results,
        "summary": totals,
    }
