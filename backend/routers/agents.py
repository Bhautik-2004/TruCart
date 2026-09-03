import logging

from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse

from ..agents.base import log_task, new_correlation_id
from ..agents.inventory import run_inventory_agent
from ..agents.logistics import run_logistics_agent
from ..agents.marketing import run_marketing_agent
from ..agents.orchestrator import run_orchestrator
from ..agents.orders import run_order_agent
from ..agents.pricing import run_pricing_agent
from ..agents.support import run_support_agent

logger = logging.getLogger("trucart.agents")

router = APIRouter(prefix="/api/agents", tags=["agents"])

_RUNNERS = {
    "inventory_agent": run_inventory_agent,
    "pricing_agent": run_pricing_agent,
    "support_agent": run_support_agent,
    "order_agent": run_order_agent,
    "marketing_agent": run_marketing_agent,
    "logistics_agent": run_logistics_agent,
    "orchestrator": run_orchestrator,
}


@router.post("/{agent_name}/run")
def run_agent(agent_name: str):
    runner = _RUNNERS.get(agent_name)
    if runner is None:
        raise HTTPException(status_code=404, detail=f"Unknown or unsupported agent: {agent_name}")

    try:
        return runner()
    except Exception as exc:
        logger.exception("agent %s failed", agent_name)
        correlation_id = new_correlation_id()
        try:
            log_task(
                agent_name, "agent_run", "error",
                input_data=None, output_data={"error": str(exc)},
                model_used=None, correlation_id=correlation_id,
            )
        except Exception:
            logger.warning("could not write error task log for %s", agent_name)
        # Real failure -> real status code, so the UI can distinguish it from a
        # successful run that merely escalated everything.
        return JSONResponse(
            status_code=500,
            content={
                "status": "error",
                "agent_name": agent_name,
                "log_id": None,
                "correlation_id": str(correlation_id),
                "summary": {"scanned": 0, "auto_executed": 0, "escalated": 0},
                "error": str(exc),
            },
        )
