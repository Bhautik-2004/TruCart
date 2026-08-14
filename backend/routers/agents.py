from fastapi import APIRouter, HTTPException

from ..agents.base import log_task, new_correlation_id
from ..agents.inventory import run_inventory_agent
from ..agents.pricing import run_pricing_agent
from ..agents.support import run_support_agent

router = APIRouter(prefix="/api/agents", tags=["agents"])

_RUNNERS = {
    "inventory_agent": run_inventory_agent,
    "pricing_agent": run_pricing_agent,
    "support_agent": run_support_agent,
}


@router.post("/{agent_name}/run")
def run_agent(agent_name: str):
    runner = _RUNNERS.get(agent_name)
    if runner is None:
        raise HTTPException(status_code=404, detail=f"Unknown or unsupported agent: {agent_name}")

    try:
        return runner()
    except Exception as exc:
        correlation_id = new_correlation_id()
        try:
            log_task(
                agent_name, "agent_run", "error",
                input_data=None, output_data={"error": str(exc)},
                model_used=None, correlation_id=correlation_id,
            )
        except Exception:
            pass  # logging failure shouldn't hide the original error
        return {
            "status": "error",
            "agent_name": agent_name,
            "log_id": None,
            "correlation_id": str(correlation_id),
            "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0},
            "error": str(exc),
        }
