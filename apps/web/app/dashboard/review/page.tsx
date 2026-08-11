"use client"

import { useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
  CardFooter,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  AlertTriangle,
  Clock,
  CheckCircle,
  XCircle,
  ArrowRight,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

const reviewStats = [
  { title: "Pending Review", value: "12", icon: Clock, color: "text-yellow-500" },
  { title: "Approved Today", value: "48", icon: CheckCircle, color: "text-green-500" },
  { title: "Rejected Today", value: "5", icon: XCircle, color: "text-red-500" },
  { title: "Flagged Items", value: "3", icon: AlertTriangle, color: "text-orange-500" },
]

const reviewItems = [
  {
    id: "REV-001",
    type: "Product Listing",
    title: "Wireless Bluetooth Headphones",
    submittedBy: "John Doe",
    timestamp: "5 min ago",
    status: "pending",
    reason: "Price anomaly detected by pricing agent",
  },
  {
    id: "REV-002",
    type: "Refund Request",
    title: "Order #ORD-1234 - Partial Refund",
    submittedBy: "Jane Smith",
    timestamp: "12 min ago",
    status: "pending",
    reason: "Customer reported damaged item",
  },
  {
    id: "REV-003",
    type: "Inventory Adjustment",
    title: "SKU-5678 - Stock Correction",
    submittedBy: "System",
    timestamp: "25 min ago",
    status: "pending",
    reason: "Automated reconciliation discrepancy",
  },
  {
    id: "REV-004",
    type: "Marketing Content",
    title: "Summer Sale Banner Update",
    submittedBy: "Marketing Agent",
    timestamp: "1 hr ago",
    status: "pending",
    reason: "New creative needs manual approval",
  },
]

export default function ReviewQueuePage() {
  const [selectedItem, setSelectedItem] = useState<(typeof reviewItems)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openDetails(item: (typeof reviewItems)[number]) {
    setSelectedItem(item)
    setSheetOpen(true)
  }

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Review Queue</h2>
        <p className="text-muted-foreground">
          Items flagged for manual review and approval.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {reviewStats.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">
                {stat.title}
              </CardTitle>
              <stat.icon className={`size-4 ${stat.color}`} />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stat.value}</div>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="space-y-4">
        <h3 className="text-lg font-semibold">Pending Items</h3>
        {reviewItems.map((item) => (
          <Card key={item.id}>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <CardTitle className="text-base">{item.title}</CardTitle>
                    <span className="rounded-full bg-yellow-100 px-2 py-0.5 text-xs font-medium text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">
                      {item.status}
                    </span>
                  </div>
                  <CardDescription>
                    {item.type} &middot; {item.id}
                  </CardDescription>
                </div>
                <span className="text-xs text-muted-foreground">
                  {item.timestamp}
                </span>
              </div>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground">
                <span className="font-medium text-foreground">Reason:</span>{" "}
                {item.reason}
              </p>
              <p className="mt-1 text-xs text-muted-foreground">
                Submitted by: {item.submittedBy}
              </p>
            </CardContent>
            <CardFooter className="flex gap-2">
              <Button size="sm">
                <CheckCircle className="mr-1 size-3" />
                Approve
              </Button>
              <Button size="sm" variant="destructive">
                <XCircle className="mr-1 size-3" />
                Reject
              </Button>
              <Button
                size="sm"
                variant="outline"
                className="ml-auto"
                onClick={() => openDetails(item)}
              >
                Details
                <ArrowRight className="ml-1 size-3" />
              </Button>
            </CardFooter>
          </Card>
        ))}
      </div>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedItem?.title ?? ""}
        description={selectedItem ? `${selectedItem.type} — ${selectedItem.id}` : undefined}
        fields={
          selectedItem
            ? [
                { label: "Status", value: selectedItem.status },
                { label: "Type", value: selectedItem.type },
                { label: "Review ID", value: selectedItem.id },
                { label: "Reason", value: selectedItem.reason },
                { label: "Submitted By", value: selectedItem.submittedBy },
                { label: "Time", value: selectedItem.timestamp },
              ]
            : []
        }
        actions={
          selectedItem
            ? [
                { label: "Approve", onClick: () => setSheetOpen(false), icon: <CheckCircle className="mr-1 size-3" /> },
                { label: "Reject", variant: "destructive" as const, onClick: () => setSheetOpen(false), icon: <XCircle className="mr-1 size-3" /> },
              ]
            : []
        }
      />
    </div>
  )
}
