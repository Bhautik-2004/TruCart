"use client"

import { useEffect, useState } from "react"
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

interface ReviewItem {
  review_id: string
  item_type: string
  reference_id: string
  agent_name: string
  summary: string
  status: string
  created_at: string
  reviewed_at: string | null
}

export default function ReviewQueuePage() {
  const [reviewItems, setReviewItems] = useState<ReviewItem[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedItem, setSelectedItem] = useState<ReviewItem | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [actingOn, setActingOn] = useState<Set<string>>(new Set())

  async function fetchReviewItems() {
    const res = await fetch("/api/review")
    const { reviewItems } = await res.json()
    setReviewItems(reviewItems || [])
    setLoading(false)
  }

  useEffect(() => {
    fetchReviewItems()
  }, [])

  async function handleReview(item: ReviewItem, action: "approve" | "reject") {
    setActingOn(prev => new Set(prev).add(item.review_id))
    try {
      const user = JSON.parse(localStorage.getItem("user") ?? "null")
      await fetch(`/api/review/${item.review_id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ action, reviewer_id: user?.id ?? null, note: null }),
      })
      await fetchReviewItems()
      setSheetOpen(false)
    } finally {
      setActingOn(prev => {
        const next = new Set(prev)
        next.delete(item.review_id)
        return next
      })
    }
  }

  const pendingItems = reviewItems.filter(i => i.status === "pending")
  const approvedToday = reviewItems.filter(i => {
    if (i.status !== "approved" || !i.reviewed_at) return false
    return new Date(i.reviewed_at).toDateString() === new Date().toDateString()
  }).length
  const rejectedToday = reviewItems.filter(i => {
    if (i.status !== "rejected" || !i.reviewed_at) return false
    return new Date(i.reviewed_at).toDateString() === new Date().toDateString()
  }).length
  const flaggedItems = reviewItems.filter(i => i.status === "flagged").length

  const reviewStats = [
    { title: "Pending Review", value: pendingItems.length.toString(), icon: Clock, color: "text-yellow-500" },
    { title: "Approved Today", value: approvedToday.toString(), icon: CheckCircle, color: "text-green-500" },
    { title: "Rejected Today", value: rejectedToday.toString(), icon: XCircle, color: "text-red-500" },
    { title: "Flagged Items", value: flaggedItems.toString(), icon: AlertTriangle, color: "text-orange-500" },
  ]

  function openDetails(item: ReviewItem) {
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
        {loading ? (
          Array.from({ length: 4 }).map((_, i) => (
            <Card key={i}><CardContent className="py-6"><div className="h-24 bg-muted animate-pulse rounded" /></CardContent></Card>
          ))
        ) : pendingItems.length === 0 ? (
          <Card><CardContent className="py-8"><p className="text-sm text-muted-foreground text-center">No pending items in the review queue</p></CardContent></Card>
        ) : (
          pendingItems.map((item) => (
            <Card key={item.review_id}>
              <CardHeader>
                <div className="flex items-center justify-between">
                  <div className="space-y-1">
                    <div className="flex items-center gap-2">
                      <CardTitle className="text-base">{item.summary}</CardTitle>
                      <span className="rounded-full bg-yellow-100 px-2 py-0.5 text-xs font-medium text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">
                        {item.status}
                      </span>
                    </div>
                    <CardDescription>
                      {item.item_type} &middot; REV-{item.review_id.slice(0, 8)}
                    </CardDescription>
                  </div>
                  <span className="text-xs text-muted-foreground">
                    {new Date(item.created_at).toLocaleString()}
                  </span>
                </div>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground">
                  <span className="font-medium text-foreground">Reason:</span>{" "}
                  {item.summary}
                </p>
                <p className="mt-1 text-xs text-muted-foreground">
                  Submitted by: {item.agent_name}
                </p>
              </CardContent>
              <CardFooter className="flex gap-2">
                <Button size="sm" disabled={actingOn.has(item.review_id)} onClick={() => handleReview(item, "approve")}>
                  <CheckCircle className="mr-1 size-3" />
                  Approve
                </Button>
                <Button size="sm" variant="destructive" disabled={actingOn.has(item.review_id)} onClick={() => handleReview(item, "reject")}>
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
          ))
        )}
      </div>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedItem?.summary ?? ""}
        description={selectedItem ? `${selectedItem.item_type} — REV-${selectedItem.review_id.slice(0, 8)}` : undefined}
        fields={
          selectedItem
            ? [
                { label: "Status", value: selectedItem.status },
                { label: "Type", value: selectedItem.item_type },
                { label: "Review ID", value: `REV-${selectedItem.review_id.slice(0, 8)}` },
                { label: "Reason", value: selectedItem.summary },
                { label: "Submitted By", value: selectedItem.agent_name },
                { label: "Time", value: new Date(selectedItem.created_at).toLocaleString() },
              ]
            : []
        }
        actions={
          selectedItem
            ? [
                { label: "Approve", onClick: () => handleReview(selectedItem, "approve"), icon: <CheckCircle className="mr-1 size-3" /> },
                { label: "Reject", variant: "destructive" as const, onClick: () => handleReview(selectedItem, "reject"), icon: <XCircle className="mr-1 size-3" /> },
              ]
            : []
        }
      />
    </div>
  )
}
