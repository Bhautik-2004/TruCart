"use client"

import { useEffect, useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import {
  MessageSquare,
  Clock,
  CheckCircle,
  AlertCircle,
  Search,
  Plus,
  ArrowRight,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { supabase } from "../../../lib/supabase"

interface Ticket {
  ticket_id: string
  subject: string
  description: string
  priority: string
  status: string
  assigned_to_agent: string
  created_at: string
  updated_at: string
  customers?: { full_name: string; email: string }
  messages_count?: number
}

export default function SupportPage() {
  const [tickets, setTickets] = useState<Ticket[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedTicket, setSelectedTicket] = useState<Ticket | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  useEffect(() => {
    async function fetchTickets() {
      const { data } = await supabase
        .from("support_tickets")
        .select("*, customers(full_name, email)")
        .order("created_at", { ascending: false })
        .limit(20)

      if (data) {
        const ticketsWithCount = await Promise.all(
          data.map(async (ticket) => {
            const { count } = await supabase
              .from("ticket_messages")
              .select("*", { count: "exact", head: true })
              .eq("ticket_id", ticket.ticket_id)
            return { ...ticket, messages_count: count || 0 }
          })
        )
        setTickets(ticketsWithCount)
      }
      setLoading(false)
    }
    fetchTickets()
  }, [])

  const openCount = tickets.filter(t => t.status === "open").length
  const resolvedCount = tickets.filter(t => t.status === "resolved").length
  const escalatedCount = tickets.filter(t => t.status === "escalated").length

  const supportStats = [
    { title: "Open Tickets", value: openCount.toString(), icon: MessageSquare, change: `${tickets.length} total` },
    { title: "Avg Response Time", value: "2.4h", icon: Clock, change: "From resolved tickets" },
    { title: "Resolved Today", value: resolvedCount.toString(), icon: CheckCircle, change: "Successfully resolved" },
    { title: "Escalated", value: escalatedCount.toString(), icon: AlertCircle, change: "Need review" },
  ]

  function openTicket(ticket: Ticket) {
    setSelectedTicket(ticket)
    setSheetOpen(true)
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
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Support</h2>
          <p className="text-muted-foreground">
            Manage customer support tickets and inquiries.
          </p>
        </div>
        <Button>
          <Plus className="mr-2 size-4" />
          New Ticket
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {supportStats.map((stat) => (
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
          <div className="flex items-center justify-between">
            <CardTitle>Recent Tickets</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" />
                <Input placeholder="Search tickets..." className="pl-8 w-64" />
              </div>
              <Button variant="outline" size="sm">Filter</Button>
            </div>
          </div>
        </CardHeader>
        <CardContent className="space-y-3">
          {loading ? (
            Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="h-20 bg-muted animate-pulse rounded-lg" />
            ))
          ) : tickets.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">No tickets found</p>
          ) : (
            tickets.map((ticket) => (
              <div
                key={ticket.ticket_id}
                className="flex items-center justify-between rounded-lg border p-4 hover:bg-muted/50 transition-colors"
              >
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <span className="font-medium">{ticket.subject}</span>
                    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${priorityStyles[ticket.priority] || priorityStyles.normal}`}>
                      {ticket.priority}
                    </span>
                  </div>
                  <div className="flex items-center gap-4 text-xs text-muted-foreground">
                    <span>TKT-{ticket.ticket_id.slice(0, 8)}</span>
                    <span>{ticket.customers?.full_name || "N/A"}</span>
                    <span>Assigned to: {ticket.assigned_to_agent}</span>
                    <span>{ticket.messages_count} messages</span>
                  </div>
                </div>
                <div className="flex items-center gap-3">
                  <span className="text-xs text-muted-foreground">
                    {new Date(ticket.created_at).toLocaleDateString()}
                  </span>
                  <Button variant="ghost" size="sm" onClick={() => openTicket(ticket)}>
                    Open
                    <ArrowRight className="ml-1 size-3" />
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
        title={selectedTicket?.subject ?? ""}
        description={selectedTicket ? `TKT-${selectedTicket.ticket_id.slice(0, 8)} — ${selectedTicket.customers?.full_name || "N/A"}` : undefined}
        fields={
          selectedTicket
            ? [
                { label: "Ticket ID", value: `TKT-${selectedTicket.ticket_id.slice(0, 8)}` },
                { label: "Status", value: selectedTicket.status },
                { label: "Priority", value: selectedTicket.priority },
                { label: "Customer", value: selectedTicket.customers?.full_name || "N/A" },
                { label: "Email", value: selectedTicket.customers?.email || "N/A" },
                { label: "Assigned To", value: selectedTicket.assigned_to_agent },
                { label: "Messages", value: `${selectedTicket.messages_count} messages` },
                { label: "Last Update", value: new Date(selectedTicket.updated_at).toLocaleString() },
                { label: "Description", value: selectedTicket.description || "No description" },
              ]
            : []
        }
        actions={
          selectedTicket
            ? [
                { label: "Reply", onClick: () => setSheetOpen(false) },
                { label: "Resolve", variant: "outline" as const, onClick: () => setSheetOpen(false) },
              ]
            : []
        }
      />
    </div>
  )
}
