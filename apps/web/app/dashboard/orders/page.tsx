import { createServerClient } from "../../../lib/supabase-server"
import OrdersClient from "./orders-client"

export const dynamic = "force-dynamic"

export default async function OrdersPage() {
  const supabase = createServerClient()

  const { data: orders } = await supabase
    .from("orders")
    .select("*, customers(full_name)")
    .order("placed_at", { ascending: false })
    .limit(50)

  const ordersWithCount = await Promise.all(
    (orders || []).map(async (order) => {
      const { count } = await supabase
        .from("order_items")
        .select("*", { count: "exact", head: true })
        .eq("order_id", order.order_id)
      return { ...order, items_count: count || 0 }
    })
  )

  return <OrdersClient orders={ordersWithCount} />
}
