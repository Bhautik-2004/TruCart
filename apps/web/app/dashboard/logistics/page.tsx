import { createServerClient } from "../../../lib/supabase-server"
import LogisticsClient from "./logistics-client"

export const dynamic = "force-dynamic"

export default async function LogisticsPage() {
  const supabase = createServerClient()

  const { data: shipments } = await supabase
    .from("shipments")
    .select("*, orders(order_number, shipping_address_id)")
    .order("created_at", { ascending: false })
    .limit(20)

  return <LogisticsClient shipments={shipments || []} />
}
