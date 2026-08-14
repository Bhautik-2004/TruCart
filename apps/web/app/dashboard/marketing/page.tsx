import { createServerClient } from "../../../lib/supabase-server"
import MarketingClient from "./marketing-client"

export const dynamic = "force-dynamic"

export default async function MarketingPage() {
  const supabase = createServerClient()

  const { data: campaigns } = await supabase
    .from("campaigns")
    .select("*, campaign_metrics(recipients, opened, clicked, converted)")
    .order("created_at", { ascending: false })
    .limit(20)

  return <MarketingClient campaigns={campaigns || []} />
}
