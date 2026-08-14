import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import {
  Package,
  AlertTriangle,
  TrendingUp,
  TrendingDown,
  Search,
  Plus,
  RefreshCw,
} from "lucide-react"
import { createServerClient } from "../../../lib/supabase-server"

export const dynamic = "force-dynamic"

export default async function InventoryPage() {
  const supabase = createServerClient()

  const [productsResult, inventoryResult, purchaseOrdersResult] = await Promise.all([
    supabase.from("products").select("product_id, sku, name, category, current_price, status"),
    supabase.from("inventory").select("inventory_id, product_id, quantity_on_hand, reorder_point, quantity_reserved, last_restock_date, updated_at, warehouses(name, region)"),
    supabase
      .from("purchase_orders")
      .select("po_id, po_number, quantity, unit_cost, total_cost, status, created_by_agent, created_at, expected_delivery, products(name, sku), suppliers(name, lead_time_days)")
      .order("created_at", { ascending: false })
      .limit(20),
  ])

  const products = productsResult.data || []
  const inventory = inventoryResult.data || []
  const purchaseOrders = purchaseOrdersResult.data || []

  const totalProducts = products.length
  const lowStockItems = inventory.filter(i => i.quantity_on_hand <= i.reorder_point)
  const lowStockCount = lowStockItems.length

  const today = new Date().toISOString().split("T")[0]
  const restockedToday = inventory.filter(i => i.last_restock_date === today)
  const stockInToday = restockedToday.reduce((sum, i) => sum + i.quantity_on_hand, 0)

  const productsWithInventory = inventory.map(inv => {
    const product = products.find(p => p.product_id === inv.product_id)
    let status = "in_stock"
    if (inv.quantity_on_hand <= 0) status = "out_of_stock"
    else if (inv.quantity_on_hand <= inv.reorder_point) status = "low_stock"

    return {
      inventoryId: inv.inventory_id,
      sku: product?.sku || "N/A",
      name: product?.name || "Unknown",
      category: product?.category || "N/A",
      warehouse: ([inv.warehouses].flat()[0] as { name?: string } | undefined)?.name || "N/A",
      stock: inv.quantity_on_hand,
      minStock: inv.reorder_point,
      reserved: inv.quantity_reserved,
      price: product?.current_price || 0,
      status,
    }
  }).sort((a, b) => a.stock - b.stock)

  const poStatusStyles: Record<string, string> = {
    draft: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    submitted: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    approved: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    shipped: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
    received: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    cancelled: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  }

  const inventoryStats = [
    { title: "Total Products", value: totalProducts.toLocaleString(), icon: Package, change: `${lowStockCount} low stock` },
    { title: "Low Stock Alerts", value: lowStockCount.toString(), icon: AlertTriangle, change: `${lowStockItems.filter(i => i.quantity_on_hand === 0).length} critical` },
    { title: "Stock In (Today)", value: stockInToday.toLocaleString(), icon: TrendingUp, change: `${restockedToday.length} products restocked` },
    { title: "Stock Out (Today)", value: inventory.filter(i => i.quantity_on_hand === 0).length.toString(), icon: TrendingDown, change: "needs attention" },
  ]

  const statusStyles: Record<string, string> = {
    in_stock: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    low_stock: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    out_of_stock: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Inventory</h2>
          <p className="text-muted-foreground">
            Track and manage your product stock levels.
          </p>
        </div>
        <div className="flex gap-2">
          <Button variant="outline">
            <RefreshCw className="mr-2 size-4" />
            Sync
          </Button>
          <Button>
            <Plus className="mr-2 size-4" />
            Add Product
          </Button>
        </div>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {inventoryStats.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">
                {stat.title}
              </CardTitle>
              <stat.icon className="size-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stat.value}</div>
              <p className="text-xs text-muted-foreground">{stat.change}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Product Stock</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" />
                <Input placeholder="Search products..." className="pl-8 w-64" />
              </div>
              <Button variant="outline" size="sm">Export</Button>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="pb-2 text-left font-medium text-muted-foreground">SKU</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Category</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Warehouse</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Stock</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Min Stock</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Price</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                </tr>
              </thead>
              <tbody>
                {productsWithInventory.map((item) => (
                  <tr key={item.inventoryId} className="border-b last:border-0">
                    <td className="py-3 font-medium">{item.sku}</td>
                    <td className="py-3">{item.name}</td>
                    <td className="py-3 text-muted-foreground">{item.category}</td>
                    <td className="py-3 text-muted-foreground">{item.warehouse}</td>
                    <td className="py-3 font-medium">{item.stock}</td>
                    <td className="py-3 text-muted-foreground">{item.minStock}</td>
                    <td className="py-3">₹{item.price.toFixed(2)}</td>
                    <td className="py-3">
                      <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[item.status]}`}>
                        {item.status.replace(/_/g, " ")}
                      </span>
                    </td>
                    <td className="py-3 text-right">
                      <Button variant="ghost" size="sm">Edit</Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Purchase Orders</CardTitle>
          <p className="text-sm text-muted-foreground">Reorders raised by the inventory agent with suppliers.</p>
        </CardHeader>
        <CardContent>
          {purchaseOrders.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">No purchase orders yet</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b">
                    <th className="pb-2 text-left font-medium text-muted-foreground">PO Number</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Supplier</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Qty</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Total Cost</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Expected Delivery</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {purchaseOrders.map((po) => {
                    const product = [po.products].flat()[0] as { name?: string; sku?: string } | undefined
                    const supplier = [po.suppliers].flat()[0] as { name?: string; lead_time_days?: number } | undefined
                    return (
                      <tr key={po.po_id} className="border-b last:border-0">
                        <td className="py-3 font-medium">{po.po_number}</td>
                        <td className="py-3">{product?.name || "N/A"}</td>
                        <td className="py-3 text-muted-foreground">{supplier?.name || "N/A"}</td>
                        <td className="py-3">{po.quantity}</td>
                        <td className="py-3 font-medium">₹{Number(po.total_cost).toFixed(2)}</td>
                        <td className="py-3 text-muted-foreground">
                          {po.expected_delivery ? new Date(po.expected_delivery).toLocaleDateString() : "N/A"}
                        </td>
                        <td className="py-3">
                          <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${poStatusStyles[po.status] || poStatusStyles.draft}`}>
                            {po.status}
                          </span>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
