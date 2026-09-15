import { NextResponse } from "next/server"
import { createServerClient } from "../../../lib/supabase-server"

/**
 * Resolves a scanned/typed code against orders (order_number), shipments
 * (tracking_number), or products (sku) — whichever matches first. Backs the
 * barcode/QR scanner and order-tracking tool; no AI involved, pure lookup.
 */
export async function GET(request: Request) {
  const code = new URL(request.url).searchParams.get("code")?.trim()
  if (!code) {
    return NextResponse.json({ error: "Missing code" }, { status: 400 })
  }

  const supabase = createServerClient()

  const { data: order } = await supabase
    .from("orders")
    .select("order_id, order_number, status, payment_status, total_amount, placed_at, shipped_at, delivered_at, customers(full_name, email)")
    .ilike("order_number", code)
    .maybeSingle()

  if (order) {
    const [{ data: items }, { data: shipment }] = await Promise.all([
      supabase.from("order_items").select("quantity, unit_price, total_price, products(name, sku)").eq("order_id", order.order_id),
      supabase.from("shipments").select("carrier, tracking_number, status, shipped_at, delivered_at, estimated_delivery").eq("order_id", order.order_id).maybeSingle(),
    ])
    return NextResponse.json({ type: "order", order, items: items || [], shipment: shipment || null })
  }

  const { data: shipment } = await supabase
    .from("shipments")
    .select("shipment_id, carrier, tracking_number, status, shipped_at, delivered_at, estimated_delivery, orders(order_id, order_number, status, total_amount)")
    .ilike("tracking_number", code)
    .maybeSingle()

  if (shipment) {
    return NextResponse.json({ type: "shipment", shipment })
  }

  const { data: product } = await supabase
    .from("products")
    .select("product_id, sku, name, category, current_price, status")
    .ilike("sku", code)
    .maybeSingle()

  if (product) {
    const { data: inventory } = await supabase
      .from("inventory")
      .select("quantity_on_hand, quantity_reserved, quantity_available, reorder_point, warehouses(name)")
      .eq("product_id", product.product_id)
    return NextResponse.json({ type: "product", product, inventory: inventory || [] })
  }

  return NextResponse.json({ type: "not_found" }, { status: 404 })
}
