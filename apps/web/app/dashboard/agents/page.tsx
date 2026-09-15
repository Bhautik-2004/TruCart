import { createServerClient } from "../../../lib/supabase-server"
import AgentsClient from "./agents-client"

export const dynamic = "force-dynamic"

export default async function AgentsPage() {
  const supabase = createServerClient()

  const today = new Date().toISOString().split("T")[0]
  const [{ data: taskLogs }, { data: agentConfig }] = await Promise.all([
    supabase
      .from("agent_task_log")
      .select("agent_name, status, created_at, log_id, task_type, model_used, tokens_used, output_data")
      .gte("created_at", today),
    supabase
      .from("agent_config")
      .select("agent_name, config_key, config_value")
      .order("agent_name")
      .order("config_key"),
  ])

  const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"
  const getJson = async (path: string) => {
    try {
      const res = await fetch(`${API}${path}`, { cache: "no-store", signal: AbortSignal.timeout(2500) })
      return res.ok ? await res.json() : null
    } catch {
      return null
    }
  }

  const [scheduler, ledger, llm] = await Promise.all([
    getJson("/api/agents/scheduler") as Promise<{
      enabled: boolean; running: boolean; interval_minutes: number
      last_cycle_at: string | null; last_cycle_status: string | null
    } | null>,
    getJson("/api/ledger/summary") as Promise<{
      agents: { agent_name: string; trust_score: number; win_rate: number; verified: number }[]
    } | null>,
    getJson("/api/agents/llm-status") as Promise<{
      configured: boolean; reachable: boolean; model: string
    } | null>,
  ])

  const trustByAgent: Record<string, { trust_score: number; win_rate: number; verified: number }> = {}
  for (const a of ledger?.agents ?? []) trustByAgent[a.agent_name] = a

  return (
    <AgentsClient
      taskLogs={taskLogs || []}
      agentConfig={agentConfig || []}
      scheduler={scheduler}
      trustByAgent={trustByAgent}
      llm={llm}
    />
  )
}
