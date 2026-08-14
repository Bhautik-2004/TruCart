"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Eye, MousePointerClick, TrendingUp, Plus, Megaphone, ExternalLink } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { insertCampaign } from "../actions"

interface Campaign {
  campaign_id: string; name: string; type: string; status: string; budget: number; spent: number; segment: string; content_subject: string; content_body: string; scheduled_at: string; sent_at: string
  campaign_metrics?: { recipients: number; opened: number; clicked: number; converted: number }[]
}

export default function MarketingClient({ campaigns }: { campaigns: Campaign[] }) {
  const router = useRouter()
  const [selectedCampaign, setSelectedCampaign] = useState<Campaign | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [showNew, setShowNew] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [form, setForm] = useState({ name: "", type: "email", segment: "", budget: "", content_subject: "", content_body: "" })

  const activeCampaigns = campaigns.filter(c => c.status === "active").length
  const totalRecipients = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.recipients || 0), 0)
  const totalClicked = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.clicked || 0), 0)
  const totalConverted = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.converted || 0), 0)
  const ctr = totalRecipients > 0 ? ((totalClicked / totalRecipients) * 100) : 0

  const stats = [
    { title: "Active Campaigns", value: activeCampaigns.toString(), icon: Megaphone, change: `${campaigns.length} total` },
    { title: "Total Impressions", value: totalRecipients.toLocaleString(), icon: Eye, change: "Across all campaigns" },
    { title: "Click-through Rate", value: `${ctr.toFixed(1)}%`, icon: MousePointerClick, change: "Average CTR" },
    { title: "Conversions", value: totalConverted.toLocaleString(), icon: TrendingUp, change: "Total conversions" },
  ]

  async function handleCreate() {
    if (!form.name.trim()) return
    setSubmitting(true)
    try {
      await insertCampaign({ name: form.name, type: form.type, segment: form.segment, budget: parseFloat(form.budget) || 0, content_body: form.content_body, content_subject: form.content_subject })
      router.refresh()
      setShowNew(false)
      setForm({ name: "", type: "email", segment: "", budget: "", content_subject: "", content_body: "" })
    } catch (e) { console.error(e) }
    setSubmitting(false)
  }

  const statusStyles: Record<string, string> = {
    active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    draft: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    scheduled: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    completed: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    paused: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Marketing</h2><p className="text-muted-foreground">AI-driven marketing campaign management.</p></div>
        <Button onClick={() => setShowNew(true)}><Plus className="mr-2 size-4" />New Campaign</Button>
      </div>

      {showNew && (
        <Card>
          <CardHeader><CardTitle>Create New Campaign</CardTitle></CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-2"><label className="text-sm font-medium">Campaign Name *</label><Input placeholder="Campaign name" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">Type</label><div className="flex gap-2">{["email", "sms", "social", "push"].map(t => (<Button key={t} variant={form.type === t ? "default" : "outline"} size="sm" onClick={() => setForm(f => ({ ...f, type: t }))}>{t}</Button>))}</div></div>
            </div>
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-2"><label className="text-sm font-medium">Target Segment</label><Input placeholder="e.g. premium_customers" value={form.segment} onChange={e => setForm(f => ({ ...f, segment: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">Budget (₹)</label><Input type="number" placeholder="0.00" value={form.budget} onChange={e => setForm(f => ({ ...f, budget: e.target.value }))} /></div>
            </div>
            <div className="space-y-2"><label className="text-sm font-medium">Email Subject</label><Input placeholder="Campaign subject line" value={form.content_subject} onChange={e => setForm(f => ({ ...f, content_subject: e.target.value }))} /></div>
            <div className="space-y-2"><label className="text-sm font-medium">Content Body</label><textarea className="w-full rounded-md border bg-transparent px-3 py-2 text-sm min-h-[80px]" placeholder="Campaign content..." value={form.content_body} onChange={e => setForm(f => ({ ...f, content_body: e.target.value }))} /></div>
            <div className="flex gap-2"><Button onClick={handleCreate} disabled={submitting}>{submitting ? "Creating..." : "Create Campaign"}</Button><Button variant="outline" onClick={() => setShowNew(false)}>Cancel</Button></div>
          </CardContent>
        </Card>
      )}

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent></Card>
        ))}
      </div>

      <Card>
        <CardHeader><CardTitle>Campaigns</CardTitle><CardDescription>Active and scheduled marketing campaigns</CardDescription></CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead><tr className="border-b">
                <th className="pb-2 text-left font-medium text-muted-foreground">Campaign</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Type</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Sent</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Opened</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Clicked</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Conversions</th>
                <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
              </tr></thead>
              <tbody>
                {campaigns.length === 0 ? (<tr><td colSpan={8} className="py-8 text-center text-muted-foreground">No campaigns found</td></tr>)
                : campaigns.map(c => {
                  const m = c.campaign_metrics?.[0]
                  return (
                    <tr key={c.campaign_id} className="border-b last:border-0">
                      <td className="py-3 font-medium">{c.name}</td>
                      <td className="py-3 text-muted-foreground">{c.type}</td>
                      <td className="py-3"><span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[c.status] || statusStyles.draft}`}>{c.status}</span></td>
                      <td className="py-3">{(m?.recipients || 0).toLocaleString()}</td>
                      <td className="py-3">{(m?.opened || 0).toLocaleString()}</td>
                      <td className="py-3">{(m?.clicked || 0).toLocaleString()}</td>
                      <td className="py-3 font-medium">{m?.converted || 0}</td>
                      <td className="py-3 text-right"><Button variant="ghost" size="sm" onClick={() => { setSelectedCampaign(c); setSheetOpen(true) }}>View<ExternalLink className="ml-1 size-3" /></Button></td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen} onOpenChange={setSheetOpen}
        title={selectedCampaign?.name ?? ""}
        description={selectedCampaign ? `${selectedCampaign.type} Campaign` : undefined}
        fields={selectedCampaign ? [
          { label: "Status", value: selectedCampaign.status },
          { label: "Type", value: selectedCampaign.type },
          { label: "Segment", value: selectedCampaign.segment || "N/A" },
          { label: "Sent", value: (selectedCampaign.campaign_metrics?.[0]?.recipients || 0).toLocaleString() },
          { label: "Opened", value: (selectedCampaign.campaign_metrics?.[0]?.opened || 0).toLocaleString() },
          { label: "Clicked", value: (selectedCampaign.campaign_metrics?.[0]?.clicked || 0).toLocaleString() },
          { label: "Conversions", value: `${selectedCampaign.campaign_metrics?.[0]?.converted || 0}` },
          { label: "Budget", value: `₹${Number(selectedCampaign.budget).toFixed(2)}` },
          { label: "Spent", value: `₹${Number(selectedCampaign.spent).toFixed(2)}` },
          { label: "Subject", value: selectedCampaign.content_subject || "N/A" },
          { label: "Content", value: selectedCampaign.content_body || "No content" },
        ] : []}
        actions={[{ label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) }]}
      />
    </div>
  )
}
