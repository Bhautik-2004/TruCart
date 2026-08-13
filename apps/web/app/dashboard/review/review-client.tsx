"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { AlertTriangle, Clock, CheckCircle, XCircle, ArrowRight } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { updateReviewStatus } from "../actions"

interface ReviewItem {
  review_id: string; item_type: string; reference_id: string; agent_name: string; summary: string; status: string; created_at: string; reviewed_at: string | null
}

export default function ReviewClient({ items }: { items: ReviewItem[] }) {
  const router = useRouter()
  const [selectedItem, setSelectedItem] = useState<ReviewItem | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [actingId, setActingId] = useState<string | null>(null)

  const pendingItems = items.filter(i => i.status === "pending")
  const approvedToday = items.filter(i => i.status === "approved" && i.reviewed_at && new Date(i.reviewed_at).toDateString() === new Date().toDateString()).length
  const rejectedToday = items.filter(i => i.status === "rejected" && i.reviewed_at && new Date(i.reviewed_at).toDateString() === new Date().toDateString()).length
  const flaggedItems = items.filter(i => i.status === "flagged").length

  const stats = [
    { title: "Pending Review", value: pendingItems.length.toString(), icon: Clock, color: "text-yellow-500" },
    { title: "Approved Today", value: approvedToday.toString(), icon: CheckCircle, color: "text-green-500" },
    { title: "Rejected Today", value: rejectedToday.toString(), icon: XCircle, color: "text-red-500" },
    { title: "Flagged Items", value: flaggedItems.toString(), icon: AlertTriangle, color: "text-orange-500" },
  ]

  async function handleApprove(reviewId: string) {
    setActingId(reviewId)
    await updateReviewStatus(reviewId, "approved")
    router.refresh()
    setActingId(null)
  }

  async function handleReject(reviewId: string) {
    if (!window.confirm("Reject this item?")) return
    setActingId(reviewId)
    await updateReviewStatus(reviewId, "rejected")
    router.refresh()
    setActingId(null)
  }

  return (
    <div className="space-y-6">
      <div><h2 className="text-2xl font-bold tracking-tight">Review Queue</h2><p className="text-muted-foreground">Items flagged for manual review and approval.</p></div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className={`size-4 ${s.color}`} /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div></CardContent></Card>
        ))}
      </div>

      <div className="space-y-4">
        <h3 className="text-lg font-semibold">Pending Items</h3>
        {pendingItems.length === 0 ? (<Card><CardContent className="py-8"><p className="text-sm text-muted-foreground text-center">No pending items</p></CardContent></Card>)
        : pendingItems.map(item => (
          <Card key={item.review_id}>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="space-y-1">
                  <div className="flex items-center gap-2"><CardTitle className="text-base">{item.summary}</CardTitle><span className="rounded-full bg-yellow-100 px-2 py-0.5 text-xs font-medium text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200">{item.status}</span></div>
                  <CardDescription>{item.item_type} &middot; REV-{item.review_id.slice(0, 8)}</CardDescription>
                </div>
                <span className="text-xs text-muted-foreground">{new Date(item.created_at).toLocaleString()}</span>
              </div>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground"><span className="font-medium text-foreground">Reason:</span> {item.summary}</p>
              <p className="mt-1 text-xs text-muted-foreground">Submitted by: {item.agent_name}</p>
            </CardContent>
            <CardFooter className="flex gap-2">
              <Button size="sm" onClick={() => handleApprove(item.review_id)} disabled={actingId === item.review_id}><CheckCircle className="mr-1 size-3" />{actingId === item.review_id ? "..." : "Approve"}</Button>
              <Button size="sm" variant="destructive" onClick={() => handleReject(item.review_id)} disabled={actingId === item.review_id}><XCircle className="mr-1 size-3" />{actingId === item.review_id ? "..." : "Reject"}</Button>
              <Button size="sm" variant="outline" className="ml-auto" onClick={() => { setSelectedItem(item); setSheetOpen(true) }}>Details<ArrowRight className="ml-1 size-3" /></Button>
            </CardFooter>
          </Card>
        ))}
      </div>

      <DetailSheet
        open={sheetOpen} onOpenChange={setSheetOpen}
        title={selectedItem?.summary ?? ""}
        description={selectedItem ? `${selectedItem.item_type} — REV-${selectedItem.review_id.slice(0, 8)}` : undefined}
        fields={selectedItem ? [
          { label: "Status", value: selectedItem.status },
          { label: "Type", value: selectedItem.item_type },
          { label: "Review ID", value: `REV-${selectedItem.review_id.slice(0, 8)}` },
          { label: "Reason", value: selectedItem.summary },
          { label: "Submitted By", value: selectedItem.agent_name },
          { label: "Time", value: new Date(selectedItem.created_at).toLocaleString() },
        ] : []}
        actions={selectedItem ? [
          { label: "Approve", onClick: () => { handleApprove(selectedItem.review_id); setSheetOpen(false) }, icon: <CheckCircle className="mr-1 size-3" /> },
          { label: "Reject", variant: "destructive" as const, onClick: () => { handleReject(selectedItem.review_id); setSheetOpen(false) }, icon: <XCircle className="mr-1 size-3" /> },
        ] : []}
      />
    </div>
  )
}
