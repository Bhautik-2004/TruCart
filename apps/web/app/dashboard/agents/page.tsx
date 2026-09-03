import { createServerClient } from "../../../lib/supabase-server"
import AgentsClient from "./agents-client"

export const dynamic = "force-dynamic"

export default async function AgentsPage() {
  const supabase = createServerClient()

  const today = new Date().toISOString().split("T")[0]
  const [{ data: taskLogs }, { data: agentConfig }] = await Promise.all([
    supabase
      .from("agent_task_log")
      .select("agent_name, status, created_at, log_id, task_type, model_used, tokens_used")
      .gte("created_at", today),
    supabase
      .from("agent_config")
      .select("agent_name, config_key, config_value")
      .order("agent_name")
      .order("config_key"),
  ])

  let scheduler: {
    enabled: boolean
    running: boolean
    interval_minutes: number
    last_cycle_at: string | null
    last_cycle_status: string | null
  } | null = null
  try {
    const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"}/api/agents/scheduler`, {
      cache: "no-store",
    })
    if (res.ok) scheduler = await res.json()
  } catch {
    // backend down — the indicator just shows "unknown"
  }

  return (
    <AgentsClient
      taskLogs={taskLogs || []}
      agentConfig={agentConfig || []}
      scheduler={scheduler}
    />
  )
}
