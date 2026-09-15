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
  Sparkles,
  Loader2,
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
  risk_score?: number | null
  risk_level?: string | null
  risk_reasons?: string[] | null
}

const RISK_STYLES: Record<string, string> = {
  high: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  medium: "bg-amber-100 text-amber-800 dark:bg-amber-900 dark:text-amber-200",
  low: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
}

function RiskBadge({ level, score }: { level?: string | null; score?: number | null }) {
  if (!level) return <span className="text-xs text-muted-foreground">—</span>
  return (
    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${RISK_STYLES[level] || RISK_STYLES.low}`}>
      {level}{typeof score === "number" ? ` (${score.toFixed(2)})` : ""}
    </span>
  )
}

export default function OrdersClient({ orders }: { orders: Order[] }) {
  const router = useRouter()
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [searchQuery, setSearchQuery] = useState("")
  const [statusFilter, setStatusFilter] = useState("all")
  const [simulating, setSimulating] = useState(false)
  const [toast, setToast] = useState<string | null>(null)

  async function handleSimulate() {
    setSimulating(true)
    try {
      const res = await fetch("/api/simulate/orders?count=5", { method: "POST" })
      const data = await res.json()
      if (!res.ok || data.status === "error") {
        setToast(`Simulation failed: ${data.detail || data.error || "unknown error"}`)
      } else {
        setToast(`Created ${data.created} order(s)${data.new_customers ? ` and ${data.new_customers} new customer(s)` : ""}.`)
        router.refresh()
      }
    } catch (error) {
      setToast(`Simulation failed: ${error instanceof Error ? error.message : "backend unreachable"}`)
    } finally {
      setSimulating(false)
      setTimeout(() => setToast(null), 5000)
    }
  }

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
      {toast && <div className="fixed top-4 right-4 z-50 rounded-lg bg-green-600 px-4 py-2 text-sm text-white shadow-lg">{toast}</div>}

      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Orders</h2>
          <p className="text-muted-foreground">Manage and track all customer orders.</p>
        </div>
        <div className="flex gap-2">
          <Button variant="outline" onClick={handleSimulate} disabled={simulating}>
            {simulating ? <Loader2 className="mr-2 size-4 animate-spin" /> : <Sparkles className="mr-2 size-4" />}
            {simulating ? "Simulating..." : "Simulate incoming orders"}
          </Button>
          <Button variant="outline" onClick={handleExport}>
            <Download className="mr-2 size-4" />Export
          </Button>
        </div>
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
                  <th className="pb-2 text-left font-medium text-muted-foreground">Risk</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Date</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr><td colSpan={8} className="py-8 text-center text-muted-foreground">No orders found</td></tr>
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
                    <td className="py-3"><RiskBadge level={order.risk_level} score={order.risk_score} /></td>
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
          { label: "Risk", value: <RiskBadge level={selectedOrder.risk_level} score={selectedOrder.risk_score} /> },
          ...(selectedOrder.risk_reasons?.length ? [{ label: "Risk reasons", value: selectedOrder.risk_reasons.join(" ") }] : []),
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
