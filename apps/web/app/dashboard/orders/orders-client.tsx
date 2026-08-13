"use client"

import { useState, useMemo } from "react"
import { useRouter } from "next/navigation"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import {
  ShoppingCart,
  Clock,
  CheckCircle,
  Truck,
  Search,
  Download,
  ExternalLink,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { exportToCSV } from "../../../lib/export-csv"
import { updateOrderStatus } from "../actions"

interface Order {
  order_id: string
  order_number: string
  customer_id: string
  status: string
  total_amount: number
  payment_method: string
  placed_at: string
  customers?: { full_name: string }
  items_count?: number
}

export default function OrdersClient({ orders }: { orders: Order[] }) {
  const router = useRouter()
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [searchQuery, setSearchQuery] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")

  const filtered = useMemo(() => {
    return orders.filter(o => {
      const matchSearch = !searchQuery ||
        o.order_number.toLowerCase().includes(searchQuery.toLowerCase()) ||
        o.customers?.full_name?.toLowerCase().includes(searchQuery.toLowerCase())
      const matchStatus = statusFilter === "all" || o.status === statusFilter
      return matchSearch && matchStatus
    })
  }, [orders, searchQuery, statusFilter])

  const pendingCount = orders.filter(o => o.status === "pending").length
  const shippedCount = orders.filter(o => o.status === "shipped" || o.status === "in_transit").length
  const deliveredCount = orders.filter(o => o.status === "delivered").length

  const stats = [
    { title: "Total Orders", value: filtered.length.toString(), icon: ShoppingCart, change: "From Supabase" },
    { title: "Pending", value: pendingCount.toString(), icon: Clock, change: "Awaiting processing" },
    { title: "Shipped", value: shippedCount.toString(), icon: Truck, change: "In transit" },
    { title: "Completed", value: deliveredCount.toString(), icon: CheckCircle, change: "Delivered" },
  ]

  function handleExport() {
    exportToCSV(
      filtered.map(o => ({
        order_number: o.order_number,
        customer: o.customers?.full_name || "N/A",
        items: o.items_count,
        total: o.total_amount,
        status: o.status,
        date: new Date(o.placed_at).toLocaleDateString(),
        payment: o.payment_method || "N/A",
      })),
      [
        { key: "order_number", label: "Order ID" },
        { key: "customer", label: "Customer" },
        { key: "items", label: "Items" },
        { key: "total", label: "Total" },
        { key: "status", label: "Status" },
        { key: "date", label: "Date" },
        { key: "payment", label: "Payment Method" },
      ],
      "orders-export.csv"
    )
  }

  async function handleStatusUpdate(orderId: string, status: string) {
    await updateOrderStatus(orderId, status)
    router.refresh()
  }

  const statusStyles: Record<string, string> = {
    pending: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    confirmed: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    processing: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    shipped: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    in_transit: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    delivered: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    cancelled: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  }

  const filterStatuses = ["all", "pending", "confirmed", "shipped", "in_transit", "delivered", "cancelled"]

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Orders</h2>
          <p className="text-muted-foreground">Manage and track all customer orders.</p>
        </div>
        <Button variant="outline" onClick={handleExport}>
          <Download className="mr-2 size-4" />Export
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">{s.title}</CardTitle>
              <s.icon className="size-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{s.value}</div>
              <p className="text-xs text-muted-foreground">{s.change}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Recent Orders</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" />
                <Input placeholder="Search orders..." className="pl-8 w-64" value={searchQuery} onChange={e => setSearchQuery(e.target.value)} />
              </div>
              <div className="flex gap-1 flex-wrap">
                {filterStatuses.map(s => (
                  <Button key={s} variant={statusFilter === s ? "default" : "outline"} size="sm" onClick={() => setStatusFilter(s)}>
                    {s === "all" ? "All" : s.replace(/_/g, " ")}
                  </Button>
                ))}
              </div>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="pb-2 text-left font-medium text-muted-foreground">Order ID</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Customer</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Items</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Total</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Date</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr><td colSpan={7} className="py-8 text-center text-muted-foreground">No orders found</td></tr>
                ) : filtered.map(order => (
                  <tr key={order.order_id} className="border-b last:border-0">
                    <td className="py-3 font-medium">{order.order_number}</td>
                    <td className="py-3">{order.customers?.full_name || "N/A"}</td>
                    <td className="py-3">{order.items_count}</td>
                    <td className="py-3 font-medium">₹{Number(order.total_amount).toFixed(2)}</td>
                    <td className="py-3">
                      <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[order.status] || "bg-gray-100 text-gray-800"}`}>
                        {order.status}
                      </span>
                    </td>
                    <td className="py-3 text-muted-foreground">{new Date(order.placed_at).toLocaleDateString()}</td>
                    <td className="py-3 text-right">
                      <Button variant="ghost" size="sm" onClick={() => { setSelectedOrder(order); setSheetOpen(true) }}>
                        View<ExternalLink className="ml-1 size-3" />
                      </Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedOrder ? `Order ${selectedOrder.order_number}` : ""}
        description={selectedOrder ? `Placed by ${selectedOrder.customers?.full_name || "N/A"}` : undefined}
        fields={selectedOrder ? [
          { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedOrder.status] || "bg-gray-100 text-gray-800"}`}>{selectedOrder.status}</span> },
          { label: "Customer", value: selectedOrder.customers?.full_name || "N/A" },
          { label: "Items", value: `${selectedOrder.items_count} item(s)` },
          { label: "Total", value: `₹${Number(selectedOrder.total_amount).toFixed(2)}` },
          { label: "Date", value: new Date(selectedOrder.placed_at).toLocaleString() },
          { label: "Payment", value: selectedOrder.payment_method || "N/A" },
        ] : []}
        actions={selectedOrder ? [
          { label: "Mark Shipped", onClick: () => { handleStatusUpdate(selectedOrder.order_id, "shipped"); setSheetOpen(false) } },
          { label: "Mark Delivered", variant: "outline" as const, onClick: () => { handleStatusUpdate(selectedOrder.order_id, "delivered"); setSheetOpen(false) } },
          { label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) },
        ] : []}
      />
    </div>
  )
}
