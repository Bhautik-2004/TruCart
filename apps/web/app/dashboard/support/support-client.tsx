"use client"

import { useState, useMemo } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { MessageSquare, Clock, CheckCircle, AlertCircle, Search, Plus, ArrowRight } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { updateTicketStatus, insertTicket, insertTicketMessage } from "../actions"

interface Ticket {
  ticket_id: string
  subject: string
  description: string
  priority: string
  status: string
  assigned_to_agent: string
  created_at: string
  updated_at: string
  customer_id: string
  customers?: { full_name: string; email: string }
  messages_count?: number
}

export default function SupportClient({ tickets }: { tickets: Ticket[] }) {
  const router = useRouter()
  const [selectedTicket, setSelectedTicket] = useState<Ticket | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [searchQuery, setSearchQuery] = useState("")
  const [priorityFilter, setPriorityFilter] = useState("all")
  const [showNew, setShowNew] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [form, setForm] = useState({ subject: "", description: "", priority: "medium", customer_id: "" })
  const [replyContent, setReplyContent] = useState("")

  const filtered = useMemo(() => {
    return tickets.filter(t => {
      const matchSearch = !searchQuery || t.subject.toLowerCase().includes(searchQuery.toLowerCase()) || t.customers?.full_name?.toLowerCase().includes(searchQuery.toLowerCase())
      const matchPriority = priorityFilter === "all" || t.priority === priorityFilter
      return matchSearch && matchPriority
    })
  }, [tickets, searchQuery, priorityFilter])

  const openCount = tickets.filter(t => t.status === "open").length
  const resolvedCount = tickets.filter(t => t.status === "resolved").length
  const escalatedCount = tickets.filter(t => t.status === "escalated").length

  const stats = [
    { title: "Open Tickets", value: openCount.toString(), icon: MessageSquare, change: `${tickets.length} total` },
    { title: "Avg Response Time", value: "2.4h", icon: Clock, change: "From resolved tickets" },
    { title: "Resolved", value: resolvedCount.toString(), icon: CheckCircle, change: "Successfully resolved" },
    { title: "Escalated", value: escalatedCount.toString(), icon: AlertCircle, change: "Need review" },
  ]

  async function handleCreate() {
    if (!form.subject.trim() || !form.customer_id.trim()) return
    setSubmitting(true)
    try {
      await insertTicket(form)
      router.refresh()
      setShowNew(false)
      setForm({ subject: "", description: "", priority: "medium", customer_id: "" })
    } catch (e) { console.error(e) }
    setSubmitting(false)
  }

  async function handleResolve() {
    if (!selectedTicket) return
    await updateTicketStatus(selectedTicket.ticket_id, "resolved")
    router.refresh()
    setSheetOpen(false)
  }

  async function handleReply() {
    if (!selectedTicket || !replyContent.trim()) return
    await insertTicketMessage({ ticket_id: selectedTicket.ticket_id, sender_type: "human_agent", content: replyContent })
    setReplyContent("")
    router.refresh()
  }

  const priorityStyles: Record<string, string> = {
    high: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
    medium: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    low: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    normal: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Support</h2><p className="text-muted-foreground">Manage customer support tickets.</p></div>
        <Button onClick={() => setShowNew(true)}><Plus className="mr-2 size-4" />New Ticket</Button>
      </div>

      {showNew && (
        <Card>
          <CardHeader><CardTitle>Create New Ticket</CardTitle></CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-2"><label className="text-sm font-medium">Subject *</label><Input placeholder="Ticket subject" value={form.subject} onChange={e => setForm(f => ({ ...f, subject: e.target.value }))} /></div>
              <div className="space-y-2"><label className="text-sm font-medium">Customer ID *</label><Input placeholder="Customer UUID" value={form.customer_id} onChange={e => setForm(f => ({ ...f, customer_id: e.target.value }))} /></div>
            </div>
            <div className="space-y-2"><label className="text-sm font-medium">Description</label><textarea className="w-full rounded-md border bg-transparent px-3 py-2 text-sm min-h-[80px]" placeholder="Describe the issue..." value={form.description} onChange={e => setForm(f => ({ ...f, description: e.target.value }))} /></div>
            <div className="space-y-2"><label className="text-sm font-medium">Priority</label><div className="flex gap-2">{["low", "medium", "high"].map(p => (<Button key={p} variant={form.priority === p ? "default" : "outline"} size="sm" onClick={() => setForm(f => ({ ...f, priority: p }))}>{p}</Button>))}</div></div>
            <div className="flex gap-2"><Button onClick={handleCreate} disabled={submitting}>{submitting ? "Creating..." : "Create Ticket"}</Button><Button variant="outline" onClick={() => setShowNew(false)}>Cancel</Button></div>
          </CardContent>
        </Card>
      )}

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent></Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Recent Tickets</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative"><Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" /><Input placeholder="Search tickets..." className="pl-8 w-64" value={searchQuery} onChange={e => setSearchQuery(e.target.value)} /></div>
              <div className="flex gap-1">{["all", "high", "medium", "low"].map(p => (<Button key={p} variant={priorityFilter === p ? "default" : "outline"} size="sm" onClick={() => setPriorityFilter(p)}>{p === "all" ? "All" : p}</Button>))}</div>
            </div>
          </div>
        </CardHeader>
        <CardContent className="space-y-3">
          {filtered.length === 0 ? (<p className="text-sm text-muted-foreground text-center py-8">No tickets found</p>)
          : filtered.map(ticket => (
            <div key={ticket.ticket_id} className="flex items-center justify-between rounded-lg border p-4 hover:bg-muted/50 transition-colors">
              <div className="space-y-1">
                <div className="flex items-center gap-2">
                  <span className="font-medium">{ticket.subject}</span>
                  <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${priorityStyles[ticket.priority] || priorityStyles.normal}`}>{ticket.priority}</span>
                </div>
                <div className="flex items-center gap-4 text-xs text-muted-foreground">
                  <span>TKT-{ticket.ticket_id.slice(0, 8)}</span>
                  <span>{ticket.customers?.full_name || "N/A"}</span>
                  <span>{ticket.messages_count} messages</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="text-xs text-muted-foreground">{new Date(ticket.created_at).toLocaleDateString()}</span>
                <Button variant="ghost" size="sm" onClick={() => { setSelectedTicket(ticket); setSheetOpen(true) }}>Open<ArrowRight className="ml-1 size-3" /></Button>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen} onOpenChange={setSheetOpen}
        title={selectedTicket?.subject ?? ""}
        description={selectedTicket ? `TKT-${selectedTicket.ticket_id.slice(0, 8)} — ${selectedTicket.customers?.full_name || "N/A"}` : undefined}
        fields={selectedTicket ? [
          { label: "Status", value: selectedTicket.status },
          { label: "Priority", value: selectedTicket.priority },
          { label: "Customer", value: selectedTicket.customers?.full_name || "N/A" },
          { label: "Email", value: selectedTicket.customers?.email || "N/A" },
          { label: "Assigned To", value: selectedTicket.assigned_to_agent },
          { label: "Messages", value: `${selectedTicket.messages_count} messages` },
          { label: "Description", value: selectedTicket.description || "No description" },
        ] : []}
        actions={selectedTicket ? [
          { label: "Reply", onClick: handleReply },
          { label: "Resolve", variant: "outline" as const, onClick: handleResolve },
        ] : []}
      />
    </div>
  )
}
