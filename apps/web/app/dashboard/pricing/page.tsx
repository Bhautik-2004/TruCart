import { createServerClient } from "../../../lib/supabase-server"
import PricingClient from "./pricing-client"

export const dynamic = "force-dynamic"

const DEMAND_WINDOW_DAYS = 90

export default async function PricingPage() {
  const supabase = createServerClient()
  const demandCutoff = new Date(Date.now() - DEMAND_WINDOW_DAYS * 86400_000).toISOString()

  const [productsResult, inventoryResult, priceHistoryResult, ordersResult] = await Promise.all([
    supabase.from("products").select("product_id, sku, name, current_price, cost_price, status"),
    supabase.from("inventory").select("product_id, quantity_on_hand, quantity_reserved"),
    supabase.from("price_history").select("product_id, old_price, new_price, change_reason, changed_by, created_at").order("created_at", { ascending: false }).limit(20),
    supabase.from("orders").select("order_id, status, placed_at").gte("placed_at", demandCutoff),
  ])

  const sellableOrderIds = (ordersResult.data || [])
    .filter(o => o.status !== "cancelled" && o.status !== "returned")
    .map(o => o.order_id)

  let unitsSold: { product_id: string; quantity: number }[] = []
  if (sellableOrderIds.length > 0) {
    const chunks: string[][] = []
    for (let i = 0; i < sellableOrderIds.length; i += 200) chunks.push(sellableOrderIds.slice(i, i + 200))
    const results = await Promise.all(
      chunks.map(c => supabase.from("order_items").select("product_id, quantity").in("order_id", c)),
    )
    unitsSold = results.flatMap(r => r.data || [])
  }

  return (
    <PricingClient
      products={productsResult.data || []}
      inventory={inventoryResult.data || []}
      priceHistory={priceHistoryResult.data || []}
      orderItems={unitsSold}
      demandWindowDays={DEMAND_WINDOW_DAYS}
    />
  )
}
