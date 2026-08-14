import { NextResponse } from "next/server"
import { createServerClient } from "../../../lib/supabase-server"

export async function GET() {
  const supabase = createServerClient()

  const { data, error } = await supabase
    .from("support_tickets")
    .select("*, customers(full_name, email)")
    .order("created_at", { ascending: false })
    .limit(20)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  const tickets = data || []
  const withCounts = await Promise.all(
    tickets.map(async (ticket) => {
      const { count } = await supabase
        .from("ticket_messages")
        .select("*", { count: "exact", head: true })
        .eq("ticket_id", ticket.ticket_id)
      return { ...ticket, messages_count: count || 0 }
    })
  )

  return NextResponse.json({ tickets: withCounts })
}
