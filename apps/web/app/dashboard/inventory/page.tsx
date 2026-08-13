import { createServerClient } from "../../../lib/supabase-server"
import InventoryClient from "./inventory-client"

export const dynamic = "force-dynamic"

export default async function InventoryPage() {
  const supabase = createServerClient()

  const [productsResult, inventoryResult] = await Promise.all([
    supabase.from("products").select("product_id, sku, name, category, current_price, description, status"),
    supabase.from("inventory").select("inventory_id, product_id, quantity_on_hand, reorder_point, quantity_reserved, last_restock_date, updated_at"),
  ])

  const products = productsResult.data || []
  const inventory = inventoryResult.data || []

  const items = inventory.map(inv => {
    const product = products.find(p => p.product_id === inv.product_id)
    let status = "in_stock"
    if (inv.quantity_on_hand <= 0) status = "out_of_stock"
    else if (inv.quantity_on_hand <= inv.reorder_point) status = "low_stock"
    return {
      inventoryId: inv.inventory_id,
      productId: inv.product_id,
      sku: product?.sku || "N/A",
      name: product?.name || "Unknown",
      category: product?.category || "N/A",
      stock: inv.quantity_on_hand,
      minStock: inv.reorder_point,
      reserved: inv.quantity_reserved,
      price: product?.current_price || 0,
      status,
    }
  }).sort((a, b) => a.stock - b.stock)

  return <InventoryClient items={items} />
}
