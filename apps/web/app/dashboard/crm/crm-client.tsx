"use client"

import { useState, useMemo } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Users, Crown, Heart, AlertTriangle, UserPlus, UserX, HelpCircle, Sparkles, Loader2 } from "lucide-react"
import { insertCampaign } from "../actions"

interface Customer {
  customer_id: string
  full_name: string
  email: string
  crm_segment: string
  recency_days: number | null
  total_orders: number
  lifetime_value: number
  churn_risk: boolean
}

const SEGMENT_META: Record<string, { label: string; icon: any; color: string }> = {
  champion: { label: "Champions", icon: Crown, color: "text-amber-500" },
  loyal: { label: "Loyal", icon: Heart, color: "text-pink-500" },
  at_risk: { label: "At Risk", icon: AlertTriangle, color: "text-red-500" },
  new: { label: "New", icon: UserPlus, color: "text-green-500" },
  lost: { label: "Lost", icon: UserX, color: "text-gray-500" },
  needs_attention: { label: "Needs Attention", icon: HelpCircle, color: "text-blue-500" },
  prospect: { label: "Prospects", icon: Users, color: "text-muted-foreground" },
}

export default function CrmClient({
  customers,
  segmentCounts,
  backendDown,
}: {
  customers: Customer[]
  segmentCounts: Record<string, number>
  backendDown: boolean
}) {
  const router = useRouter()
  const [selectedSegment, setSelectedSegment] = useState<string | null>(null)
  const [action, setAction] = useState<string | null>(null)
  const [loadingAction, setLoadingAction] = useState(false)
  const [creatingCampaign, setCreatingCampaign] = useState(false)

  const filtered = useMemo(
    () => (selectedSegment ? customers.filter((c) => c.crm_segment === selectedSegment) : customers),
    [customers, selectedSegment]
  )

  const churnRiskCount = customers.filter((c) => c.churn_risk).length

  async function fetchAction(segment: string) {
    setSelectedSegment(segment)
    setAction(null)
    setLoadingAction(true)
    try {
      const res = await fetch("/api/ai-tools/crm/next-best-action", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ segment }),
      })
      const data = await res.json()
      setAction(data.action || "No recommendation available.")
    } catch {
      setAction("Failed to reach the AI model.")
    }
    setLoadingAction(false)
  }

  async function createCampaignForSegment(segment: string) {
    setCreatingCampaign(true)
    try {
      await insertCampaign({
        name: `${SEGMENT_META[segment]?.label || segment} campaign`,
        type: "email",
        segment,
        budget: 0,
        content_subject: `A message for our ${SEGMENT_META[segment]?.label || segment} customers`,
        content_body: action || "",
      })
      router.push("/dashboard/marketing")
    } catch (e) {
      console.error(e)
    }
    setCreatingCampaign(false)
  }

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Customer CRM</h2>
        <p className="text-muted-foreground">RFM segmentation with AI-recommended next-best-actions per segment.</p>
      </div>

      {backendDown && (
        <Card className="border-destructive/50">
          <CardContent className="py-4 text-sm text-destructive">Backend is unreachable — cannot compute segments.</CardContent>
        </Card>
      )}

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Customers</CardTitle><Users className="size-4 text-muted-foreground" />
          </CardHeader>
          <CardContent><div className="text-2xl font-bold">{customers.length}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Churn Risk</CardTitle><AlertTriangle className="size-4 text-red-500" />
          </CardHeader>
          <CardContent><div className="text-2xl font-bold">{churnRiskCount}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Champions</CardTitle><Crown className="size-4 text-amber-500" />
          </CardHeader>
          <CardContent><div className="text-2xl font-bold">{segmentCounts.champion || 0}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">New Customers</CardTitle><UserPlus className="size-4 text-green-500" />
          </CardHeader>
          <CardContent><div className="text-2xl font-bold">{segmentCounts.new || 0}</div></CardContent>
        </Card>
      </div>

      <div className="flex flex-wrap gap-2">
        <Button variant={selectedSegment === null ? "default" : "outline"} size="sm" onClick={() => setSelectedSegment(null)}>All</Button>
        {Object.entries(segmentCounts).map(([segment, count]) => {
          const meta = SEGMENT_META[segment] || { label: segment, icon: Users, color: "" }
          return (
            <Button key={segment} variant={selectedSegment === segment ? "default" : "outline"} size="sm" onClick={() => fetchAction(segment)}>
              <meta.icon className={`mr-1.5 size-3.5 ${meta.color}`} />{meta.label} ({count})
            </Button>
          )
        })}
      </div>

      {selectedSegment && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2"><Sparkles className="size-4" />Next Best Action — {SEGMENT_META[selectedSegment]?.label || selectedSegment}</CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            {loadingAction ? (
              <div className="flex items-center gap-2 text-sm text-muted-foreground"><Loader2 className="size-4 animate-spin" />Thinking…</div>
            ) : (
              <>
                <p className="text-sm leading-relaxed">{action}</p>
                <Button size="sm" onClick={() => createCampaignForSegment(selectedSegment)} disabled={creatingCampaign || !action}>
                  {creatingCampaign ? <Loader2 className="mr-2 size-4 animate-spin" /> : null}
                  Create campaign for this segment
                </Button>
              </>
            )}
          </CardContent>
        </Card>
      )}

      <Card>
        <CardHeader><CardTitle>Customers</CardTitle><CardDescription>{filtered.length} customer(s){selectedSegment ? ` in ${SEGMENT_META[selectedSegment]?.label || selectedSegment}` : ""}</CardDescription></CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="pb-2 text-left font-medium text-muted-foreground">Customer</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Segment</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Orders</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Lifetime Value</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Last Order</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr><td colSpan={5} className="py-8 text-center text-muted-foreground">No customers found</td></tr>
                ) : (
                  filtered.map((c) => {
                    const meta = SEGMENT_META[c.crm_segment] || { label: c.crm_segment, icon: Users, color: "" }
                    return (
                      <tr key={c.customer_id} className="border-b last:border-0">
                        <td className="py-3 font-medium">{c.full_name}<div className="text-xs text-muted-foreground">{c.email}</div></td>
                        <td className="py-3"><span className="inline-flex items-center gap-1"><meta.icon className={`size-3.5 ${meta.color}`} />{meta.label}</span></td>
                        <td className="py-3">{c.total_orders}</td>
                        <td className="py-3">₹{c.lifetime_value.toFixed(2)}</td>
                        <td className="py-3 text-muted-foreground">{c.recency_days !== null ? `${c.recency_days}d ago` : "Never"}</td>
                      </tr>
                    )
                  })
                )}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
