import { createServerClient } from "../../../lib/supabase-server"
import SupportClient from "./support-client"

export const dynamic = "force-dynamic"

export default async function SupportPage() {
  const supabase = createServerClient()

  const { data: tickets } = await supabase
    .from("support_tickets")
    .select("*, customers(full_name, email)")
    .order("created_at", { ascending: false })
    .limit(30)

  const ticketsWithCount = await Promise.all(
    (tickets || []).map(async (ticket) => {
      const { count } = await supabase
        .from("ticket_messages")
        .select("*", { count: "exact", head: true })
        .eq("ticket_id", ticket.ticket_id)
      return { ...ticket, messages_count: count || 0 }
    })
  )

  return <SupportClient tickets={ticketsWithCount} />
}
