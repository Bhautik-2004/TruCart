import { NextResponse } from "next/server"
import { createServerClient } from "../../../../lib/supabase-server"

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url)
  const agentName = searchParams.get("agent_name")
  if (!agentName) {
    return NextResponse.json({ error: "agent_name is required" }, { status: 400 })
  }

  const supabase = createServerClient()
  const { data, error } = await supabase
    .from("agent_config")
    .select("config_key, config_value, updated_at")
    .eq("agent_name", agentName)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  return NextResponse.json({ config: data || [] })
}
