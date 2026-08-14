"use client"

import { useEffect, useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  Truck,
  Package,
  CheckCircle,
  AlertCircle,
  RefreshCw,
  ExternalLink,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

interface Shipment {
  shipment_id: string
  order_id: string
  carrier: string
  tracking_number: string
  status: string
  shipped_at: string
  delivered_at: string
  estimated_delivery: string
  shipping_cost: number
  orders?: {
    order_number: string
    shipping_address_id: string
  }
}

export default function LogisticsPage() {
  const [shipments, setShipments] = useState<Shipment[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedShipment, setSelectedShipment] = useState<Shipment | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  useEffect(() => {
    async function fetchShipments() {
      const res = await fetch("/api/logistics")
      const { shipments } = await res.json()
      setShipments(shipments || [])
      setLoading(false)
    }
    fetchShipments()
  }, [])

  const inTransit = shipments.filter(s => s.status === "in_transit").length
  const pendingPickup = shipments.filter(s => s.status === "label_created" || s.status === "pending").length
  const delivered = shipments.filter(s => s.status === "delivered").length
  const issues = shipments.filter(s => s.status === "exception" || s.status === "failed").length

  const logisticsStats = [
    { title: "In Transit", value: inTransit.toString(), icon: Truck, change: "Currently shipping" },
    { title: "Pending Pickup", value: pendingPickup.toString(), icon: Package, change: "Awaiting carrier" },
    { title: "Delivered", value: delivered.toString(), icon: CheckCircle, change: "Successfully delivered" },
    { title: "Issues", value: issues.toString(), icon: AlertCircle, change: "Need attention" },
  ]

  function openShipment(shipment: Shipment) {
    setSelectedShipment(shipment)
    setSheetOpen(true)
  }

  const statusStyles: Record<string, string> = {
    label_created: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    pending: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    in_transit: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    out_for_delivery: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    delivered: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    exception: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
    failed: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Logistics</h2>
          <p className="text-muted-foreground">
            Shipment tracking and delivery management.
          </p>
        </div>
        <Button variant="outline">
          <RefreshCw className="mr-2 size-4" />
          Refresh Status
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {logisticsStats.map((stat) => (
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
          <CardTitle>Active Shipments</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {loading ? (
            Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="h-24 bg-muted animate-pulse rounded-lg" />
            ))
          ) : shipments.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">No shipments found</p>
          ) : (
            shipments.map((shipment) => (
              <div
                key={shipment.shipment_id}
                className="flex items-center justify-between rounded-lg border p-4"
              >
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <span className="font-medium">SHP-{shipment.shipment_id.slice(0, 8)}</span>
                    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[shipment.status] || "bg-gray-100 text-gray-800"}`}>
                      {shipment.status.replace(/_/g, " ")}
                    </span>
                  </div>
                  <div className="flex items-center gap-4 text-xs text-muted-foreground">
                    <span>Order: {shipment.orders?.order_number || "N/A"}</span>
                    <span>{shipment.carrier || "N/A"}</span>
                    <span>{shipment.tracking_number || "N/A"}</span>
                  </div>
                  <p className="text-xs text-muted-foreground">
                    {shipment.estimated_delivery
                      ? `ETA: ${new Date(shipment.estimated_delivery).toLocaleDateString()}`
                      : "No ETA"}
                  </p>
                </div>
                <div className="text-right">
                  <p className="text-sm font-medium">
                    {shipment.shipping_cost ? `₹${Number(shipment.shipping_cost).toFixed(2)}` : "N/A"}
                  </p>
                  <Button variant="ghost" size="sm" onClick={() => openShipment(shipment)}>
                    Track
                    <ExternalLink className="ml-1 size-3" />
                  </Button>
                </div>
              </div>
            ))
          )}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedShipment ? `Shipment SHP-${selectedShipment.shipment_id.slice(0, 8)}` : ""}
        description={selectedShipment ? `${selectedShipment.carrier || "N/A"} — ${selectedShipment.tracking_number || "N/A"}` : undefined}
        fields={
          selectedShipment
            ? [
                { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedShipment.status] || "bg-gray-100 text-gray-800"}`}>{selectedShipment.status.replace(/_/g, " ")}</span> },
                { label: "Order", value: selectedShipment.orders?.order_number || "N/A" },
                { label: "Carrier", value: selectedShipment.carrier || "N/A" },
                { label: "Tracking Number", value: selectedShipment.tracking_number || "N/A" },
                { label: "ETA", value: selectedShipment.estimated_delivery ? new Date(selectedShipment.estimated_delivery).toLocaleDateString() : "N/A" },
                { label: "Shipping Cost", value: selectedShipment.shipping_cost ? `₹${Number(selectedShipment.shipping_cost).toFixed(2)}` : "N/A" },
                { label: "Shipped At", value: selectedShipment.shipped_at ? new Date(selectedShipment.shipped_at).toLocaleString() : "N/A" },
                { label: "Delivered At", value: selectedShipment.delivered_at ? new Date(selectedShipment.delivered_at).toLocaleString() : "N/A" },
              ]
            : []
        }
        actions={
          selectedShipment
            ? [
                { label: "Track on Carrier Site", onClick: () => setSheetOpen(false) },
                { label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) },
              ]
            : []
        }
      />
    </div>
  )
}
