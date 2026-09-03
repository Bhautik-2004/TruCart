"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { AlertTriangle, Clock, CheckCircle, XCircle, ArrowRight } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { updateReviewStatus } from "../actions"

interface ReviewItem {
  review_id: string; item_type: string; reference_id: string; agent_name: string; summary: string; status: string; created_at: string; reviewed_at: string | null
  payload: Record<string, unknown> | null; review_note: string | null; reviewed_by: string | null
}

function formatPayload(payload: Record<string, unknown> | null): { label: string; value: string }[] {
  if (!payload || typeof payload !== "object") return []
  return Object.entries(payload)
    .filter(([k]) => k !== "source" && k !== "item_type")
    .map(([k, v]) => ({
      label: k.replace(/_/g, " "),
      value: v === null || v === undefined ? "—" : typeof v === "object" ? JSON.stringify(v) : String(v),
    }))
}

export default function ReviewClient({ items, reviewerId }: { items: ReviewItem[]; reviewerId: string | null }) {
  const router = useRouter()
  const [selectedItem, setSelectedItem] = useState<ReviewItem | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [actingId, setActingId] = useState<string | null>(null)
  const [notes, setNotes] = useState<Record<string, string>>({})

  const pendingItems = items.filter(i => i.status === "pending")
  const approvedToday = items.filter(i => i.status === "approved" && i.reviewed_at && new Date(i.reviewed_at).toDateString() === new Date().toDateString()).length
  const rejectedToday = items.filter(i => i.status === "rejected" && i.reviewed_at && new Date(i.reviewed_at).toDateString() === new Date().toDateString()).length
  const actionedToday = approvedToday + rejectedToday

  const stats = [
    { title: "Pending Review", value: pendingItems.length.toString(), icon: Clock, color: "text-yellow-500" },
    { title: "Approved Today", value: approvedToday.toString(), icon: CheckCircle, color: "text-green-500" },
    { title: "Rejected Today", value: rejectedToday.toString(), icon: XCircle, color: "text-red-500" },
    { title: "Actioned Today", value: actionedToday.toString(), icon: AlertTriangle, color: "text-orange-500" },
  ]

  async function act(reviewId: string, status: "approved" | "rejected") {
    setActingId(reviewId)
    await updateReviewStatus(reviewId, status, { reviewerId, note: notes[reviewId]?.trim() || null })
    router.refresh()
    setActingId(null)
  }

  async function handleApprove(reviewId: string) {
    await act(reviewId, "approved")
  }

  async function handleReject(reviewId: string) {
    if (!window.confirm("Reject this item?")) return
    await act(reviewId, "rejected")
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
            <CardContent className="space-y-3">
              <p className="text-sm text-muted-foreground"><span className="font-medium text-foreground">Reason:</span> {item.summary}</p>
              {formatPayload(item.payload).length > 0 && (
                <div className="grid gap-x-6 gap-y-1 rounded-lg border bg-muted/40 p-3 text-xs sm:grid-cols-2">
                  {formatPayload(item.payload).map(f => (
                    <div key={f.label} className="flex justify-between gap-2">
                      <span className="capitalize text-muted-foreground">{f.label}</span>
                      <span className="text-right font-medium">{f.value}</span>
                    </div>
                  ))}
                </div>
              )}
              <p className="text-xs text-muted-foreground">Submitted by: {item.agent_name}</p>
              <Input
                placeholder="Reviewer note (optional)"
                className="h-8 text-xs"
                value={notes[item.review_id] ?? ""}
                onChange={e => setNotes(n => ({ ...n, [item.review_id]: e.target.value }))}
              />
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
          ...formatPayload(selectedItem.payload),
        ] : []}
        actions={selectedItem ? [
          { label: "Approve", onClick: () => { handleApprove(selectedItem.review_id); setSheetOpen(false) }, icon: <CheckCircle className="mr-1 size-3" /> },
          { label: "Reject", variant: "destructive" as const, onClick: () => { handleReject(selectedItem.review_id); setSheetOpen(false) }, icon: <XCircle className="mr-1 size-3" /> },
        ] : []}
      />
    </div>
  )
}
