"use client"

import { useState } from "react"
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

const orderStats = [
  { title: "Total Orders", value: "2,350", icon: ShoppingCart, change: "+180 from yesterday" },
  { title: "Pending", value: "45", icon: Clock, change: "12 urgent" },
  { title: "Shipped", value: "1,890", icon: Truck, change: "142 in transit" },
  { title: "Completed", value: "389", icon: CheckCircle, change: "98.2% success rate" },
]

const recentOrders = [
  { id: "ORD-1234", customer: "Alice Johnson", items: 3, total: "$156.99", status: "pending", date: "Today, 2:30 PM", address: "123 Main St, New York, NY 10001", payment: "Credit Card", notes: "Gift wrap requested" },
  { id: "ORD-1233", customer: "Bob Williams", items: 1, total: "$49.99", status: "shipped", date: "Today, 1:15 PM", address: "456 Oak Ave, Los Angeles, CA 90001", payment: "PayPal", notes: "" },
  { id: "ORD-1232", customer: "Carol Davis", items: 5, total: "$234.50", status: "delivered", date: "Today, 11:00 AM", address: "789 Pine Rd, Chicago, IL 60601", payment: "Credit Card", notes: "Left at door" },
  { id: "ORD-1231", customer: "David Brown", items: 2, total: "$89.99", status: "pending", date: "Yesterday, 8:45 PM", address: "321 Elm St, Houston, TX 77001", payment: "Credit Card", notes: "Express shipping" },
  { id: "ORD-1230", customer: "Eva Martinez", items: 1, total: "$199.00", status: "cancelled", date: "Yesterday, 5:20 PM", address: "654 Maple Dr, Phoenix, AZ 85001", payment: "Debit Card", notes: "Customer cancelled" },
]

const statusStyles: Record<string, string> = {
  pending: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  shipped: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  delivered: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  cancelled: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
}

export default function OrdersPage() {
  const [selectedOrder, setSelectedOrder] = useState<(typeof recentOrders)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openOrder(order: (typeof recentOrders)[number]) {
    setSelectedOrder(order)
    setSheetOpen(true)
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
                {recentOrders.map((order) => (
                  <tr key={order.id} className="border-b last:border-0">
                    <td className="py-3 font-medium">{order.id}</td>
                    <td className="py-3">{order.customer}</td>
                    <td className="py-3">{order.items}</td>
                    <td className="py-3 font-medium">{order.total}</td>
                    <td className="py-3">
                      <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[order.status]}`}>
                        {order.status}
                      </span>
                    </td>
                    <td className="py-3 text-muted-foreground">{order.date}</td>
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
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedOrder ? `Order ${selectedOrder.id}` : ""}
        description={selectedOrder ? `Placed by ${selectedOrder.customer}` : undefined}
        fields={
          selectedOrder
            ? [
                { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedOrder.status]}`}>{selectedOrder.status}</span> },
                { label: "Customer", value: selectedOrder.customer },
                { label: "Items", value: `${selectedOrder.items} item(s)` },
                { label: "Total", value: selectedOrder.total },
                { label: "Date", value: selectedOrder.date },
                { label: "Shipping Address", value: selectedOrder.address },
                { label: "Payment Method", value: selectedOrder.payment },
                { label: "Notes", value: selectedOrder.notes || "None" },
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
