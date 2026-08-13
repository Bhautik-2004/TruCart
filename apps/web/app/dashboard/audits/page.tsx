import { createServerClient } from "../../../lib/supabase-server"
import AuditsClient from "./audits-client"

export const dynamic = "force-dynamic"

export default async function AuditsPage() {
  const supabase = createServerClient()

  const { data: logs } = await supabase
    .from("agent_task_log")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(50)

  return <AuditsClient logs={logs || []} />
}
