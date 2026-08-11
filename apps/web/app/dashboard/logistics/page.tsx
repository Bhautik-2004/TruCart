"use client"

import { useState } from "react"
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
  Clock,
  MapPin,
  CheckCircle,
  AlertCircle,
  RefreshCw,
  ExternalLink,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

const logisticsStats = [
  { title: "In Transit", value: "142", icon: Truck, change: "23 arriving today" },
  { title: "Pending Pickup", value: "38", icon: Package, change: "12 urgent" },
  { title: "Avg Delivery Time", value: "2.3 days", icon: Clock, change: "-0.2 days this week" },
  { title: "Delivery Issues", value: "5", icon: AlertCircle, change: "2 need attention" },
]

const shipments = [
  {
    id: "SHP-001",
    order: "ORD-1234",
    carrier: "FedEx",
    tracking: "FX-9876543210",
    destination: "New York, NY",
    status: "in_transit",
    eta: "Tomorrow, 2:00 PM",
    lastUpdate: "Package departed facility",
    weight: "2.5 lbs",
    dimensions: '12" x 8" x 4"',
  },
  {
    id: "SHP-002",
    order: "ORD-1233",
    carrier: "UPS",
    tracking: "UP-1234567890",
    destination: "Los Angeles, CA",
    status: "out_for_delivery",
    eta: "Today, 5:00 PM",
    lastUpdate: "Out for delivery",
    weight: "1.2 lbs",
    dimensions: '10" x 6" x 3"',
  },
  {
    id: "SHP-003",
    order: "ORD-1232",
    carrier: "USPS",
    tracking: "US-5678901234",
    destination: "Chicago, IL",
    status: "delivered",
    eta: "Delivered",
    lastUpdate: "Delivered to front door",
    weight: "5.0 lbs",
    dimensions: '18" x 12" x 6"',
  },
  {
    id: "SHP-004",
    order: "ORD-1231",
    carrier: "DHL",
    tracking: "DH-3456789012",
    destination: "Houston, TX",
    status: "pending",
    eta: "Pending pickup",
    lastUpdate: "Awaiting carrier pickup",
    weight: "0.8 lbs",
    dimensions: '8" x 5" x 2"',
  },
]

const statusStyles: Record<string, string> = {
  in_transit: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  out_for_delivery: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  delivered: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
  pending: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
}

export default function LogisticsPage() {
  const [selectedShipment, setSelectedShipment] = useState<(typeof shipments)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openShipment(shipment: (typeof shipments)[number]) {
    setSelectedShipment(shipment)
    setSheetOpen(true)
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
          {shipments.map((shipment) => (
            <div
              key={shipment.id}
              className="flex items-center justify-between rounded-lg border p-4"
            >
              <div className="space-y-1">
                <div className="flex items-center gap-2">
                  <span className="font-medium">{shipment.id}</span>
                  <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[shipment.status]}`}>
                    {shipment.status.replace(/_/g, " ")}
                  </span>
                </div>
                <div className="flex items-center gap-4 text-xs text-muted-foreground">
                  <span>Order: {shipment.order}</span>
                  <span>{shipment.carrier}</span>
                  <span>{shipment.tracking}</span>
                </div>
                <div className="flex items-center gap-1 text-xs text-muted-foreground">
                  <MapPin className="size-3" />
                  {shipment.destination}
                </div>
                <p className="text-xs text-muted-foreground">
                  {shipment.lastUpdate}
                </p>
              </div>
              <div className="text-right">
                <p className="text-sm font-medium">{shipment.eta}</p>
                <Button variant="ghost" size="sm" onClick={() => openShipment(shipment)}>
                  Track
                  <ExternalLink className="ml-1 size-3" />
                </Button>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedShipment ? `Shipment ${selectedShipment.id}` : ""}
        description={selectedShipment ? `${selectedShipment.carrier} — ${selectedShipment.tracking}` : undefined}
        fields={
          selectedShipment
            ? [
                { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedShipment.status]}`}>{selectedShipment.status.replace(/_/g, " ")}</span> },
                { label: "Order", value: selectedShipment.order },
                { label: "Carrier", value: selectedShipment.carrier },
                { label: "Tracking Number", value: selectedShipment.tracking },
                { label: "Destination", value: selectedShipment.destination },
                { label: "ETA", value: selectedShipment.eta },
                { label: "Weight", value: selectedShipment.weight },
                { label: "Dimensions", value: selectedShipment.dimensions },
                { label: "Last Update", value: selectedShipment.lastUpdate },
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
