import { NextResponse } from "next/server"
import { createServerClient } from "../../../lib/supabase-server"

export async function GET() {
  const supabase = createServerClient()

  const { data, error } = await supabase
    .from("orders")
    .select("*, customers(full_name)")
    .order("placed_at", { ascending: false })
    .limit(20)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  const orders = data || []
  const withDetails = await Promise.all(
    orders.map(async (order) => {
      const [{ count }, { data: address }] = await Promise.all([
        supabase
          .from("order_items")
          .select("*", { count: "exact", head: true })
          .eq("order_id", order.order_id),
        order.shipping_address_id
          ? supabase
              .from("addresses")
              .select("line1, line2, city, state, postal_code, country")
              .eq("address_id", order.shipping_address_id)
              .maybeSingle()
          : Promise.resolve({ data: null }),
      ])
      return { ...order, items_count: count || 0, address: address || undefined }
    })
  )

  return NextResponse.json({ orders: withDetails })
}
