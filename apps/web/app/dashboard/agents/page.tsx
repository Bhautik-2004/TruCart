import { createServerClient } from "../../../lib/supabase-server"
import AgentsClient from "./agents-client"

export const dynamic = "force-dynamic"

export default async function AgentsPage() {
  const supabase = createServerClient()

  const today = new Date().toISOString().split("T")[0]
  const { data: taskLogs } = await supabase
    .from("agent_task_log")
    .select("agent_name, status, created_at, log_id, task_type, model_used, tokens_used")
    .gte("created_at", today)

  return <AgentsClient taskLogs={taskLogs || []} />
}
