"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Clock, CheckCircle, XCircle, ArrowRight, Gauge } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { updateReviewStatus } from "../actions"

interface ReviewItem {
  review_id: string; item_type: string; reference_id: string; agent_name: string; summary: string; status: string; created_at: string; reviewed_at: string | null
  payload: Record<string, unknown> | null; review_note: string | null; reviewed_by: string | null
}

function formatPayload(payload: Record<string, unknown> | null): { label: string; value: string }[] {
  if (!payload || typeof payload !== "object") return []
  return Object.entries(payload)
    .filter(([k]) => !["source", "item_type", "evidence_action_ids"].includes(k))
    .map(([k, v]) => ({
      label: k.replace(/_/g, " "),
      value: v === null || v === undefined ? "—" : typeof v === "object" ? JSON.stringify(v) : String(v),
    }))
}

export default function ReviewClient({ items }: { items: ReviewItem[] }) {
  const router = useRouter()
  const [selectedItem, setSelectedItem] = useState<ReviewItem | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [actingId, setActingId] = useState<string | null>(null)
  const [notes, setNotes] = useState<Record<string, string>>({})
  const [standingRule, setStandingRule] = useState<Record<string, boolean>>({})
  const [toast, setToast] = useState<string | null>(null)

  const pendingItems = items.filter(i => i.status === "pending")
  const isToday = (d: string | null) => !!d && new Date(d).toDateString() === new Date().toDateString()
  const approvedToday = items.filter(i => i.status === "approved" && isToday(i.reviewed_at)).length
  const rejectedToday = items.filter(i => i.status === "rejected" && isToday(i.reviewed_at)).length
  const autonomyPending = pendingItems.filter(i => i.item_type === "autonomy_adjustment").length

  const stats = [
    { title: "Pending Review", value: pendingItems.length.toString(), icon: Clock, color: "text-yellow-500" },
    { title: "Approved Today", value: approvedToday.toString(), icon: CheckCircle, color: "text-green-500" },
    { title: "Rejected Today", value: rejectedToday.toString(), icon: XCircle, color: "text-red-500" },
    { title: "Autonomy Proposals", value: autonomyPending.toString(), icon: Gauge, color: "text-blue-500" },
  ]

  async function act(reviewId: string, status: "approved" | "rejected") {
    setActingId(reviewId)
    try {
      await updateReviewStatus(reviewId, status, {
        note: notes[reviewId]?.trim() || null,
        makeStandingRule: !!standingRule[reviewId],
      })
      router.refresh()
    } catch (e) {
      setToast(e instanceof Error ? e.message : "Action failed")
      setTimeout(() => setToast(null), 5000)
    } finally {
      setActingId(null)
    }
  }

  function handleApprove(reviewId: string) {
    return act(reviewId, "approved")
  }

  function handleReject(reviewId: string) {
    if (!window.confirm("Reject this item?")) return
    return act(reviewId, "rejected")
  }

  function AutonomyDiff({ payload }: { payload: Record<string, unknown> | null }) {
    if (!payload) return null
    const { key, from, to, win_rate, sample, direction } = payload as Record<string, unknown>
    return (
      <div className="rounded-lg border bg-blue-50 p-3 text-xs dark:bg-blue-950/40">
        <div className="flex items-center gap-2 font-medium">
          <Gauge className="size-3.5" /> Autonomy {String(direction)}
        </div>
        <div className="mt-1 flex items-center gap-2">
          <code className="rounded bg-background px-1.5 py-0.5">{String(key)}</code>
          <span className="font-mono">{String(from)}</span>
          <ArrowRight className="size-3" />
          <span className="font-mono font-semibold">{String(to)}</span>
        </div>
        <p className="mt-1 text-muted-foreground">
          Verified win-rate {Math.round(Number(win_rate) * 100)}% over the last {String(sample)} decisions.
        </p>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {toast && <div className="fixed top-4 right-4 z-50 rounded-lg bg-red-600 px-4 py-2 text-sm text-white shadow-lg">{toast}</div>}

      <div><h2 className="text-2xl font-bold tracking-tight">Review Queue</h2><p className="text-muted-foreground">Items flagged for manual review and approval.</p></div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className={`size-4 ${s.color}`} /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div></CardContent></Card>
        ))}
      </div>

      <div className="space-y-4">
        <h3 className="text-lg font-semibold">Pending Items</h3>
        {pendingItems.length === 0 ? (<Card><CardContent className="py-8"><p className="text-sm text-muted-foreground text-center">No pending items</p></CardContent></Card>)
        : pendingItems.map(item => {
          const isAutonomy = item.item_type === "autonomy_adjustment"
          return (
          <Card key={item.review_id} className={isAutonomy ? "border-blue-400/60" : undefined}>
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
              {isAutonomy ? <AutonomyDiff payload={item.payload} /> : (
                <>
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
                </>
              )}
              <p className="text-xs text-muted-foreground">Submitted by: {item.agent_name}</p>
              <Input
                placeholder="Reviewer note (optional)"
                className="h-8 text-xs"
                value={notes[item.review_id] ?? ""}
                onChange={e => setNotes(n => ({ ...n, [item.review_id]: e.target.value }))}
              />
              {!isAutonomy && (
                <label className="flex items-center gap-2 text-xs text-muted-foreground">
                  <input
                    type="checkbox"
                    checked={!!standingRule[item.review_id]}
                    onChange={e => setStandingRule(s => ({ ...s, [item.review_id]: e.target.checked }))}
                  />
                  On reject, save this note as a standing rule for {item.agent_name.replace(/_/g, " ")}
                </label>
              )}
            </CardContent>
            <CardFooter className="flex gap-2">
              <Button size="sm" onClick={() => handleApprove(item.review_id)} disabled={actingId === item.review_id}><CheckCircle className="mr-1 size-3" />{actingId === item.review_id ? "..." : (isAutonomy ? "Apply" : "Approve")}</Button>
              <Button size="sm" variant="destructive" onClick={() => handleReject(item.review_id)} disabled={actingId === item.review_id}><XCircle className="mr-1 size-3" />{actingId === item.review_id ? "..." : "Reject"}</Button>
              <Button size="sm" variant="outline" className="ml-auto" onClick={() => { setSelectedItem(item); setSheetOpen(true) }}>Details<ArrowRight className="ml-1 size-3" /></Button>
            </CardFooter>
          </Card>
          )
        })}
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
