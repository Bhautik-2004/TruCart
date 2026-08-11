"use client"

import { useState } from "react"
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

const supportStats = [
  { title: "Open Tickets", value: "34", icon: MessageSquare, change: "8 urgent" },
  { title: "Avg Response Time", value: "2.4h", icon: Clock, change: "-15min from avg" },
  { title: "Resolved Today", value: "67", icon: CheckCircle, change: "92% satisfaction" },
  { title: "Escalated", value: "5", icon: AlertCircle, change: "3 pending review" },
]

const tickets = [
  {
    id: "TKT-501",
    subject: "Order not received",
    customer: "Mike Chen",
    email: "mike@example.com",
    priority: "high",
    status: "open",
    assignee: "Support Agent",
    lastUpdate: "10 min ago",
    messages: 4,
    description: "Customer reports package was never delivered despite tracking showing delivered.",
  },
  {
    id: "TKT-502",
    subject: "Wrong item delivered",
    customer: "Sarah Lee",
    email: "sarah@example.com",
    priority: "high",
    status: "open",
    assignee: "Support Agent",
    lastUpdate: "25 min ago",
    messages: 6,
    description: "Customer received a different product than what was ordered.",
  },
  {
    id: "TKT-503",
    subject: "Refund request for damaged item",
    customer: "Tom Wilson",
    email: "tom@example.com",
    priority: "medium",
    status: "pending",
    assignee: "AI Agent",
    lastUpdate: "1 hr ago",
    messages: 2,
    description: "Item arrived damaged. Customer requesting full refund.",
  },
  {
    id: "TKT-504",
    subject: "How to apply discount code?",
    customer: "Emma Davis",
    email: "emma@example.com",
    priority: "low",
    status: "open",
    assignee: "AI Agent",
    lastUpdate: "2 hr ago",
    messages: 1,
    description: "Customer needs help applying a promotional code at checkout.",
  },
  {
    id: "TKT-505",
    subject: "Account access issue",
    customer: "James Brown",
    email: "james@example.com",
    priority: "medium",
    status: "pending",
    assignee: "Support Agent",
    lastUpdate: "3 hr ago",
    messages: 3,
    description: "Customer unable to log in. Password reset not working.",
  },
]

const priorityStyles: Record<string, string> = {
  high: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  medium: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  low: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
}

export default function SupportPage() {
  const [selectedTicket, setSelectedTicket] = useState<(typeof tickets)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openTicket(ticket: (typeof tickets)[number]) {
    setSelectedTicket(ticket)
    setSheetOpen(true)
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
          {tickets.map((ticket) => (
            <div
              key={ticket.id}
              className="flex items-center justify-between rounded-lg border p-4 hover:bg-muted/50 transition-colors"
            >
              <div className="space-y-1">
                <div className="flex items-center gap-2">
                  <span className="font-medium">{ticket.subject}</span>
                  <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${priorityStyles[ticket.priority]}`}>
                    {ticket.priority}
                  </span>
                </div>
                <div className="flex items-center gap-4 text-xs text-muted-foreground">
                  <span>{ticket.id}</span>
                  <span>{ticket.customer}</span>
                  <span>Assigned to: {ticket.assignee}</span>
                  <span>{ticket.messages} messages</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="text-xs text-muted-foreground">
                  {ticket.lastUpdate}
                </span>
                <Button variant="ghost" size="sm" onClick={() => openTicket(ticket)}>
                  Open
                  <ArrowRight className="ml-1 size-3" />
                </Button>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedTicket?.subject ?? ""}
        description={selectedTicket ? `${selectedTicket.id} — ${selectedTicket.customer}` : undefined}
        fields={
          selectedTicket
            ? [
                { label: "Ticket ID", value: selectedTicket.id },
                { label: "Status", value: selectedTicket.status },
                { label: "Priority", value: selectedTicket.priority },
                { label: "Customer", value: selectedTicket.customer },
                { label: "Email", value: selectedTicket.email },
                { label: "Assigned To", value: selectedTicket.assignee },
                { label: "Messages", value: `${selectedTicket.messages} messages` },
                { label: "Last Update", value: selectedTicket.lastUpdate },
                { label: "Description", value: selectedTicket.description },
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
