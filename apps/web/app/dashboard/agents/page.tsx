"use client"

import { useEffect, useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Bot, Settings, Activity, Clock, CheckCircle, AlertCircle, Zap } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

interface AgentData {
  agent_name: string
  total_tasks: number
  completed_tasks: number
  error_tasks: number
  last_active: string
  accuracy: number
  status: string
}

interface AgentConfigRow {
  config_key: string
  config_value: unknown
  updated_at: string
}

const displayNames: Record<string, string> = {
  inventory_agent: "Inventory Agent", order_agent: "Orders Agent", support_agent: "Support Agent",
  pricing_agent: "Pricing Agent", marketing_agent: "Marketing Agent", logistics_agent: "Logistics Agent",
}
const descriptionMap: Record<string, string> = {
  inventory_agent: "Monitors stock levels, predicts demand, and manages reorders automatically.",
  order_agent: "Processes orders, manages cancellations, and handles order status updates.",
  support_agent: "Responds to customer inquiries, routes tickets, and provides AI-powered support.",
  pricing_agent: "Analyzes market trends and adjusts prices dynamically for optimal revenue.",
  marketing_agent: "Manages campaigns, personalizes content, and tracks marketing performance.",
  logistics_agent: "Optimizes shipping routes, tracks deliveries, and manages carrier relationships.",
}
const statusStyles: Record<string, string> = {
  active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  idle: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
}
const runnableAgents = ["inventory_agent", "pricing_agent", "support_agent"]

export default function AgentsPage() {
  const [agents, setAgents] = useState<AgentData[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedAgent, setSelectedAgent] = useState<AgentData | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [configAgent, setConfigAgent] = useState<AgentData | null>(null)
  const [configRows, setConfigRows] = useState<AgentConfigRow[]>([])
  const [configSheetOpen, setConfigSheetOpen] = useState(false)
  const [runningAgents, setRunningAgents] = useState<Set<string>>(new Set())

  async function openConfig(agent: AgentData) {
    setConfigAgent(agent)
    setConfigSheetOpen(true)
    const res = await fetch(`/api/agents/config?agent_name=${encodeURIComponent(agent.agent_name)}`)
    const { config } = await res.json()
    setConfigRows(config || [])
  }

  async function fetchAgents() {
    const res = await fetch("/api/agents")
    const { taskLogs } = await res.json()

    const agentNames = ["inventory_agent","order_agent","support_agent","pricing_agent","marketing_agent","logistics_agent"]
    const agentMap = new Map<string, AgentData>()
    for (const name of agentNames) {
      agentMap.set(name, { agent_name: name, total_tasks: 0, completed_tasks: 0, error_tasks: 0, last_active: "", accuracy: 0, status: "idle" })
    }
    for (const log of taskLogs || []) {
      const agent = agentMap.get(log.agent_name)
      if (agent) {
        agent.total_tasks++
        if (log.status === "completed") agent.completed_tasks++
        if (log.status === "error" || log.status === "failed") agent.error_tasks++
        if (!agent.last_active || log.created_at > agent.last_active) agent.last_active = log.created_at
      }
    }
    const result = Array.from(agentMap.values())
      .filter(a => a.total_tasks > 0 || runnableAgents.includes(a.agent_name))
      .map(a => ({
        ...a, accuracy: a.total_tasks > 0 ? (a.completed_tasks / a.total_tasks) * 100 : 0, status: a.total_tasks > 0 ? "active" : "idle",
      })).sort((a, b) => b.total_tasks - a.total_tasks)
    setAgents(result)
    setLoading(false)
  }

  useEffect(() => {
    fetchAgents()
  }, [])

  async function runAgent(agentName: string) {
    setRunningAgents(prev => new Set(prev).add(agentName))
    try {
      await fetch(`/api/agents/${agentName}/run`, { method: "POST" })
      await fetchAgents()
    } finally {
      setRunningAgents(prev => {
        const next = new Set(prev)
        next.delete(agentName)
        return next
      })
    }
  }

  const activeAgents = agents.filter(a => a.status === "active").length
  const totalTasks = agents.reduce((sum, a) => sum + a.total_tasks, 0)
  const totalCompleted = agents.reduce((sum, a) => sum + a.completed_tasks, 0)
  const avgAccuracy = totalTasks > 0 ? (totalCompleted / totalTasks) * 100 : 0
  const errorRate = totalTasks > 0 ? ((agents.reduce((sum, a) => sum + a.error_tasks, 0) / totalTasks) * 100) : 0

  const agentStats = [
    { title: "Active Agents", value: activeAgents.toString(), icon: Bot, change: `${agents.length} configured` },
    { title: "Tasks Completed", value: totalTasks.toLocaleString(), icon: CheckCircle, change: "Today" },
    { title: "Avg Accuracy", value: `${avgAccuracy.toFixed(1)}%`, icon: Clock, change: "Across all agents" },
    { title: "Error Rate", value: `${errorRate.toFixed(1)}%`, icon: AlertCircle, change: errorRate < 1 ? "Below threshold" : "Above threshold" },
  ]

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Agents</h2>
          <p className="text-muted-foreground">Monitor and manage your AI-powered agents.</p>
        </div>
        <Button variant="outline" disabled={agents.length === 0} onClick={() => agents[0] && openConfig(agents[0])}><Settings className="mr-2 size-4" />Configure</Button>
      </div>
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {agentStats.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">{stat.title}</CardTitle>
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
        {loading ? Array.from({ length: 6 }).map((_, i) => (
          <Card key={i}><CardHeader><div className="h-6 bg-muted animate-pulse rounded w-32" /></CardHeader>
            <CardContent className="space-y-3"><div className="h-4 bg-muted animate-pulse rounded" />
              <div className="grid grid-cols-3 gap-2">{Array.from({ length: 3 }).map((_, j) => (<div key={j} className="h-16 bg-muted animate-pulse rounded-lg" />))}</div>
            </CardContent></Card>
        )) : agents.length === 0 ? (
          <div className="col-span-3"><Card><CardContent className="py-8"><p className="text-sm text-muted-foreground text-center">No agent activity today.</p></CardContent></Card></div>
        ) : agents.map((agent) => (
          <Card key={agent.agent_name}>
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <div className="flex size-8 items-center justify-center rounded-lg bg-primary/10"><Bot className="size-4 text-primary" /></div>
                  <div>
                    <CardTitle className="text-base">{displayNames[agent.agent_name] || agent.agent_name}</CardTitle>
                    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[agent.status]}`}>{agent.status}</span>
                  </div>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-3">
              <p className="text-sm text-muted-foreground">{descriptionMap[agent.agent_name] || "AI agent"}</p>
              <div className="grid grid-cols-3 gap-2 text-center">
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.total_tasks}</p><p className="text-xs text-muted-foreground">Tasks Today</p></div>
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.accuracy.toFixed(1)}%</p><p className="text-xs text-muted-foreground">Accuracy</p></div>
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.last_active ? new Date(agent.last_active).toLocaleTimeString([], {hour:"2-digit",minute:"2-digit"}) : "N/A"}</p><p className="text-xs text-muted-foreground">Last Active</p></div>
              </div>
              <div className="flex gap-2">
                <Button size="sm" variant="outline" className="flex-1" onClick={() => { setSelectedAgent(agent); setSheetOpen(true) }}><Activity className="mr-1 size-3" />Logs</Button>
                <Button size="sm" variant="outline" className="flex-1" onClick={() => openConfig(agent)}><Settings className="mr-1 size-3" />Configure</Button>
              </div>
              {runnableAgents.includes(agent.agent_name) && (
                <Button
                  size="sm"
                  className="w-full"
                  disabled={runningAgents.has(agent.agent_name)}
                  onClick={() => runAgent(agent.agent_name)}
                >
                  <Zap className="mr-1 size-3" />
                  {runningAgents.has(agent.agent_name) ? "Running…" : "Run Now"}
                </Button>
              )}
            </CardContent>
          </Card>
        ))}
      </div>
      <DetailSheet open={sheetOpen} onOpenChange={setSheetOpen}
        title={selectedAgent ? (displayNames[selectedAgent.agent_name] || selectedAgent.agent_name) : ""}
        description={selectedAgent ? (descriptionMap[selectedAgent.agent_name] || "AI agent") : undefined}
        fields={selectedAgent ? [
          { label: "Status", value: selectedAgent.status },
          { label: "Tasks Today", value: `${selectedAgent.total_tasks}` },
          { label: "Completed", value: `${selectedAgent.completed_tasks}` },
          { label: "Errors", value: `${selectedAgent.error_tasks}` },
          { label: "Accuracy", value: `${selectedAgent.accuracy.toFixed(1)}%` },
          { label: "Last Active", value: selectedAgent.last_active ? new Date(selectedAgent.last_active).toLocaleString() : "N/A" },
        ] : []}
        actions={selectedAgent ? [
          { label: "View Logs", onClick: () => setSheetOpen(false) },
          { label: "Configure", variant: "outline" as const, onClick: () => { setSheetOpen(false); if (selectedAgent) openConfig(selectedAgent) } },
        ] : []}
      />
      <DetailSheet open={configSheetOpen} onOpenChange={setConfigSheetOpen}
        title={configAgent ? `${displayNames[configAgent.agent_name] || configAgent.agent_name} Config` : ""}
        description="Runtime configuration stored in agent_config"
        fields={configRows.length > 0 ? configRows.map(row => ({
          label: row.config_key,
          value: typeof row.config_value === "object" ? JSON.stringify(row.config_value) : String(row.config_value),
        })) : [{ label: "No configuration", value: "This agent has no config entries yet." }]}
        actions={[
          { label: "Close", variant: "outline" as const, onClick: () => setConfigSheetOpen(false) },
        ]}
      />
    </div>
  )
}
