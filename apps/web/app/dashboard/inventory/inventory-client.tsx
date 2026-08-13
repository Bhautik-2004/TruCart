"use client"

import { useState, useMemo } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Package, AlertTriangle, TrendingUp, TrendingDown, Search, Plus, RefreshCw } from "lucide-react"
import { insertProduct } from "../actions"
import { exportToCSV } from "../../../lib/export-csv"

interface Item {
  inventoryId: string
  productId: string
  sku: string
  name: string
  category: string
  stock: number
  minStock: number
  reserved: number
  price: number
  status: string
}

export default function InventoryClient({ items }: { items: Item[] }) {
  const router = useRouter()
  const [searchQuery, setSearchQuery] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")
  const [showAdd, setShowAdd] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [form, setForm] = useState({ name: "", sku: "", category: "", base_price: "", current_price: "", description: "" })

  const filtered = useMemo(() => {
    return items.filter(i => {
      const matchSearch = !searchQuery || i.name.toLowerCase().includes(searchQuery.toLowerCase()) || i.sku.toLowerCase().includes(searchQuery.toLowerCase())
      const matchStatus = statusFilter === "all" || i.status === statusFilter
      return matchSearch && matchStatus
    })
  }, [items, searchQuery, statusFilter])

  const lowStockCount = items.filter(i => i.status === "low_stock").length
  const outOfStockCount = items.filter(i => i.status === "out_of_stock").length

  const stats = [
    { title: "Total Products", value: items.length.toLocaleString(), icon: Package, change: `${lowStockCount} low stock` },
    { title: "Low Stock Alerts", value: lowStockCount.toString(), icon: AlertTriangle, change: `${outOfStockCount} critical` },
    { title: "In Stock", value: items.filter(i => i.status === "in_stock").length.toString(), icon: TrendingUp, change: "Available" },
    { title: "Out of Stock", value: outOfStockCount.toString(), icon: TrendingDown, change: "Needs attention" },
  ]

  function handleExport() {
    exportToCSV(
      filtered.map(i => ({ sku: i.sku, name: i.name, category: i.category, stock: i.stock, min_stock: i.minStock, price: i.price, status: i.status })),
      [
        { key: "sku", label: "SKU" }, { key: "name", label: "Product" }, { key: "category", label: "Category" },
        { key: "stock", label: "Stock" }, { key: "min_stock", label: "Min Stock" }, { key: "price", label: "Price" }, { key: "status", label: "Status" },
      ],
      "inventory-export.csv"
    )
  }

  async function handleAdd() {
    if (!form.name.trim() || !form.sku.trim()) return
    setSubmitting(true)
    try {
      await insertProduct({
        name: form.name, sku: form.sku, category: form.category,
        base_price: parseFloat(form.base_price) || 0,
        current_price: parseFloat(form.current_price) || 0,
        description: form.description,
      })
      router.refresh()
      setShowAdd(false)
      setForm({ name: "", sku: "", category: "", base_price: "", current_price: "", description: "" })
    } catch (e) { console.error(e) }
    setSubmitting(false)
  }

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
          <p className="text-muted-foreground">Track and manage your product stock levels.</p>
        </div>
        <div className="flex gap-2">
          <Button variant="outline" onClick={() => router.refresh()}><RefreshCw className="mr-2 size-4" />Sync</Button>
          <Button onClick={() => setShowAdd(true)}><Plus className="mr-2 size-4" />Add Product</Button>
        </div>
      </div>

      {showAdd && (
        <Card>
          <CardHeader><CardTitle>Add New Product</CardTitle></CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-2"><label className="text-sm font-medium">Name *</label><Input placeholder="Product name" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">SKU *</label><Input placeholder="SKU code" value={form.sku} onChange={e => setForm(f => ({ ...f, sku: e.target.value }))} /></div>
            </div>
            <div className="grid gap-4 md:grid-cols-3">
              <div className="space-y-2"><label className="text-sm font-medium">Category</label><Input placeholder="Category" value={form.category} onChange={e => setForm(f => ({ ...f, category: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">Base Price (₹)</label><Input type="number" placeholder="0.00" value={form.base_price} onChange={e => setForm(f => ({ ...f, base_price: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">Current Price (₹)</label><Input type="number" placeholder="0.00" value={form.current_price} onChange={e => setForm(f => ({ ...f, current_price: e.target.value }))} /></div>
            </div>
            <div className="space-y-2"><label className="text-sm font-medium">Description</label><textarea className="w-full rounded-md border bg-transparent px-3 py-2 text-sm min-h-[60px]" placeholder="Description..." value={form.description} onChange={e => setForm(f => ({ ...f, description: e.target.value }))} /></div>
            <div className="flex gap-2">
              <Button onClick={handleAdd} disabled={submitting}>{submitting ? "Adding..." : "Add Product"}</Button>
              <Button variant="outline" onClick={() => setShowAdd(false)}>Cancel</Button>
            </div>
          </CardContent>
        </Card>
      )}

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader>
            <CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent>
          </Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Product Stock</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative"><Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" /><Input placeholder="Search products..." className="pl-8 w-64" value={searchQuery} onChange={e => setSearchQuery(e.target.value)} /></div>
              <div className="flex gap-1">{["all", "in_stock", "low_stock", "out_of_stock"].map(s => (<Button key={s} variant={statusFilter === s ? "default" : "outline"} size="sm" onClick={() => setStatusFilter(s)}>{s === "all" ? "All" : s.replace(/_/g, " ")}</Button>))}</div>
              <Button variant="outline" size="sm" onClick={handleExport}>Export</Button>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead><tr className="border-b">
                <th className="pb-2 text-left font-medium text-muted-foreground">SKU</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Category</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Stock</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Min Stock</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Price</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
              </tr></thead>
              <tbody>
                {filtered.length === 0 ? (<tr><td colSpan={7} className="py-8 text-center text-muted-foreground">No products found</td></tr>)
                : filtered.map(item => (
                  <tr key={item.inventoryId} className="border-b last:border-0">
                    <td className="py-3 font-medium">{item.sku}</td>
                    <td className="py-3">{item.name}</td>
                    <td className="py-3 text-muted-foreground">{item.category}</td>
                    <td className="py-3 font-medium">{item.stock}</td>
                    <td className="py-3 text-muted-foreground">{item.minStock}</td>
                    <td className="py-3">₹{item.price.toFixed(2)}</td>
                    <td className="py-3"><span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[item.status]}`}>{item.status.replace(/_/g, " ")}</span></td>
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
