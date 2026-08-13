import { createServerClient } from "../../../lib/supabase-server"
import PricingClient from "./pricing-client"

export const dynamic = "force-dynamic"

export default async function PricingPage() {
  const supabase = createServerClient()

  const [productsResult, priceHistoryResult, competitorResult] = await Promise.all([
    supabase.from("products").select("product_id, sku, name, current_price, base_price, status"),
    supabase.from("price_history").select("product_id, old_price, new_price, change_reason, changed_by, created_at").order("created_at", { ascending: false }).limit(20),
    supabase.from("competitor_prices").select("product_id, competitor_name, competitor_price, detected_at").order("detected_at", { ascending: false }),
  ])

  return <PricingClient products={productsResult.data || []} priceHistory={priceHistoryResult.data || []} competitors={competitorResult.data || []} />
}
