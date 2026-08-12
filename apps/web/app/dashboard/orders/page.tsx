"use client"

import { useEffect, useState } from "react"
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
import { supabase } from "../../../lib/supabase"

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

export default function OrdersPage() {
  const [orders, setOrders] = useState<Order[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  useEffect(() => {
    async function fetchOrders() {
      const { data } = await supabase
        .from("orders")
        .select("*, customers(full_name)")
        .order("placed_at", { ascending: false })
        .limit(20)

      if (data) {
        const ordersWithCount = await Promise.all(
          data.map(async (order) => {
            const { count } = await supabase
              .from("order_items")
              .select("*", { count: "exact", head: true })
              .eq("order_id", order.order_id)
            return { ...order, items_count: count || 0 }
          })
        )
        setOrders(ordersWithCount)
      }
      setLoading(false)
    }
    fetchOrders()
  }, [])

  const totalOrders = orders.length
  const pendingCount = orders.filter(o => o.status === "pending").length
  const shippedCount = orders.filter(o => o.status === "shipped" || o.status === "in_transit").length
  const deliveredCount = orders.filter(o => o.status === "delivered").length

  const orderStats = [
    { title: "Total Orders", value: totalOrders.toString(), icon: ShoppingCart, change: "Fetched from Supabase" },
    { title: "Pending", value: pendingCount.toString(), icon: Clock, change: "Awaiting processing" },
    { title: "Shipped", value: shippedCount.toString(), icon: Truck, change: "In transit" },
    { title: "Completed", value: deliveredCount.toString(), icon: CheckCircle, change: "Successfully delivered" },
  ]

  function openOrder(order: Order) {
    setSelectedOrder(order)
    setSheetOpen(true)
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

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Orders</h2>
          <p className="text-muted-foreground">
            Manage and track all customer orders.
          </p>
        </div>
        <Button variant="outline">
          <Download className="mr-2 size-4" />
          Export
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {orderStats.map((stat) => (
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
            <CardTitle>Recent Orders</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" />
                <Input placeholder="Search orders..." className="pl-8 w-64" />
              </div>
              <Button variant="outline" size="sm">Filter</Button>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="space-y-3">
              {Array.from({ length: 5 }).map((_, i) => (
                <div key={i} className="h-12 bg-muted animate-pulse rounded" />
              ))}
            </div>
          ) : (
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
                  {orders.map((order) => (
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
                      <td className="py-3 text-muted-foreground">
                        {new Date(order.placed_at).toLocaleDateString()}
                      </td>
                      <td className="py-3 text-right">
                        <Button variant="ghost" size="sm" onClick={() => openOrder(order)}>
                          View
                          <ExternalLink className="ml-1 size-3" />
                        </Button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedOrder ? `Order ${selectedOrder.order_number}` : ""}
        description={selectedOrder ? `Placed by ${selectedOrder.customers?.full_name || "N/A"}` : undefined}
        fields={
          selectedOrder
            ? [
                { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedOrder.status] || "bg-gray-100 text-gray-800"}`}>{selectedOrder.status}</span> },
                { label: "Customer", value: selectedOrder.customers?.full_name || "N/A" },
                { label: "Items", value: `${selectedOrder.items_count} item(s)` },
                { label: "Total", value: `₹${Number(selectedOrder.total_amount).toFixed(2)}` },
                { label: "Date", value: new Date(selectedOrder.placed_at).toLocaleString() },
                { label: "Payment Method", value: selectedOrder.payment_method || "N/A" },
              ]
            : []
        }
        actions={
          selectedOrder
            ? [
                { label: "Track Shipment", onClick: () => setSheetOpen(false) },
                { label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) },
              ]
            : []
        }
      />
    </div>
  )
}
