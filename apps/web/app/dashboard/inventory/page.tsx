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

const inventoryStats = [
  { title: "Total Products", value: "12,234", icon: Package, change: "+19% this month" },
  { title: "Low Stock Alerts", value: "23", icon: AlertTriangle, change: "5 critical" },
  { title: "Stock In (Today)", value: "1,420", icon: TrendingUp, change: "340 units pending" },
  { title: "Stock Out (Today)", value: "380", icon: TrendingDown, change: "28 products" },
]

const inventoryItems = [
  { sku: "SKU-001", name: "Wireless Bluetooth Headphones", category: "Electronics", stock: 245, minStock: 50, price: "$79.99", status: "in_stock" },
  { sku: "SKU-002", name: "Organic Cotton T-Shirt", category: "Apparel", stock: 12, minStock: 30, price: "$29.99", status: "low_stock" },
  { sku: "SKU-003", name: "Stainless Steel Water Bottle", category: "Accessories", stock: 890, minStock: 100, price: "$24.99", status: "in_stock" },
  { sku: "SKU-004", name: "Laptop Stand Adjustable", category: "Electronics", stock: 0, minStock: 20, price: "$49.99", status: "out_of_stock" },
  { sku: "SKU-005", name: "Bamboo Cutting Board Set", category: "Home", stock: 156, minStock: 40, price: "$34.99", status: "in_stock" },
]

const statusStyles: Record<string, string> = {
  in_stock: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  low_stock: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  out_of_stock: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
}

export default function InventoryPage() {
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
                  <th className="pb-2 text-left font-medium text-muted-foreground">Stock</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Min Stock</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Price</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                </tr>
              </thead>
              <tbody>
                {inventoryItems.map((item) => (
                  <tr key={item.sku} className="border-b last:border-0">
                    <td className="py-3 font-medium">{item.sku}</td>
                    <td className="py-3">{item.name}</td>
                    <td className="py-3 text-muted-foreground">{item.category}</td>
                    <td className="py-3 font-medium">{item.stock}</td>
                    <td className="py-3 text-muted-foreground">{item.minStock}</td>
                    <td className="py-3">{item.price}</td>
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
    </div>
  )
}
