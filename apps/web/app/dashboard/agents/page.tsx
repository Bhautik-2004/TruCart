"use client"

import { useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  Bot,
  Settings,
  Activity,
  Zap,
  Clock,
  CheckCircle,
  AlertCircle,
  ExternalLink,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

const agentStats = [
  { title: "Active Agents", value: "6", icon: Bot, change: "All operational" },
  { title: "Tasks Completed", value: "1,247", icon: CheckCircle, change: "Today" },
  { title: "Avg Response Time", value: "1.2s", icon: Clock, change: "-0.3s improvement" },
  { title: "Error Rate", value: "0.3%", icon: AlertCircle, change: "Below threshold" },
]

const agents = [
  {
    name: "Inventory Agent",
    description: "Monitors stock levels, predicts demand, and manages reorders automatically.",
    status: "active",
    tasksToday: 234,
    lastActive: "2 min ago",
    accuracy: "99.2%",
    uptime: "99.9%",
    lastError: "None",
    avgResponseTime: "0.8s",
  },
  {
    name: "Orders Agent",
    description: "Processes orders, manages cancellations, and handles order status updates.",
    status: "active",
    tasksToday: 456,
    lastActive: "1 min ago",
    accuracy: "98.8%",
    uptime: "99.8%",
    lastError: "None",
    avgResponseTime: "1.0s",
  },
  {
    name: "Support Agent",
    description: "Responds to customer inquiries, routes tickets, and provides AI-powered support.",
    status: "active",
    tasksToday: 189,
    lastActive: "30 sec ago",
    accuracy: "97.5%",
    uptime: "99.5%",
    lastError: "Timeout on TKT-498",
    avgResponseTime: "1.5s",
  },
  {
    name: "Pricing Agent",
    description: "Analyzes market trends and adjusts prices dynamically for optimal revenue.",
    status: "active",
    tasksToday: 89,
    lastActive: "5 min ago",
    accuracy: "99.1%",
    uptime: "99.9%",
    lastError: "None",
    avgResponseTime: "2.1s",
  },
  {
    name: "Marketing Agent",
    description: "Manages campaigns, personalizes content, and tracks marketing performance.",
    status: "active",
    tasksToday: 167,
    lastActive: "10 min ago",
    accuracy: "98.3%",
    uptime: "99.7%",
    lastError: "None",
    avgResponseTime: "1.3s",
  },
  {
    name: "Logistics Agent",
    description: "Optimizes shipping routes, tracks deliveries, and manages carrier relationships.",
    status: "active",
    tasksToday: 112,
    lastActive: "3 min ago",
    accuracy: "99.5%",
    uptime: "99.9%",
    lastError: "None",
    avgResponseTime: "0.9s",
  },
]

const statusStyles: Record<string, string> = {
  active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  paused: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  error: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
}

export default function AgentsPage() {
  const [selectedAgent, setSelectedAgent] = useState<(typeof agents)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openAgent(agent: (typeof agents)[number]) {
    setSelectedAgent(agent)
    setSheetOpen(true)
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Agents</h2>
          <p className="text-muted-foreground">
            Monitor and manage your AI-powered agents.
          </p>
        </div>
        <Button variant="outline">
          <Settings className="mr-2 size-4" />
          Configure
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {agentStats.map((stat) => (
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

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {agents.map((agent) => (
          <Card key={agent.name}>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <div className="flex size-8 items-center justify-center rounded-lg bg-primary/10">
                    <Bot className="size-4 text-primary" />
                  </div>
                  <div>
                    <CardTitle className="text-base">{agent.name}</CardTitle>
                    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[agent.status]}`}>
                      {agent.status}
                    </span>
                  </div>
                </div>
                <Button variant="ghost" size="sm">
                  <Settings className="size-4" />
                </Button>
              </div>
            </CardHeader>
            <CardContent className="space-y-3">
              <p className="text-sm text-muted-foreground">
                {agent.description}
              </p>
              <div className="grid grid-cols-3 gap-2 text-center">
                <div className="rounded-lg bg-muted p-2">
                  <p className="text-lg font-bold">{agent.tasksToday}</p>
                  <p className="text-xs text-muted-foreground">Tasks Today</p>
                </div>
                <div className="rounded-lg bg-muted p-2">
                  <p className="text-lg font-bold">{agent.accuracy}</p>
                  <p className="text-xs text-muted-foreground">Accuracy</p>
                </div>
                <div className="rounded-lg bg-muted p-2">
                  <p className="text-lg font-bold">{agent.lastActive}</p>
                  <p className="text-xs text-muted-foreground">Last Active</p>
                </div>
              </div>
              <div className="flex gap-2">
                <Button size="sm" variant="outline" className="flex-1" onClick={() => openAgent(agent)}>
                  <Activity className="mr-1 size-3" />
                  Logs
                </Button>
                <Button size="sm" variant="outline" className="flex-1" onClick={() => openAgent(agent)}>
                  <Zap className="mr-1 size-3" />
                  Metrics
                </Button>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedAgent?.name ?? ""}
        description={selectedAgent?.description}
        fields={
          selectedAgent
            ? [
                { label: "Status", value: <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[selectedAgent.status]}`}>{selectedAgent.status}</span> },
                { label: "Tasks Today", value: `${selectedAgent.tasksToday}` },
                { label: "Accuracy", value: selectedAgent.accuracy },
                { label: "Uptime", value: selectedAgent.uptime },
                { label: "Avg Response Time", value: selectedAgent.avgResponseTime },
                { label: "Last Active", value: selectedAgent.lastActive },
                { label: "Last Error", value: selectedAgent.lastError },
              ]
            : []
        }
        actions={
          selectedAgent
            ? [
                { label: "View Logs", onClick: () => setSheetOpen(false) },
                { label: "Configure", variant: "outline" as const, onClick: () => setSheetOpen(false) },
              ]
            : []
        }
      />
    </div>
  )
}
