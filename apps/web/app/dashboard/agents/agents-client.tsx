"use client"

import { useState, useMemo } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Bot, Settings, Activity, Zap, Clock, CheckCircle, AlertCircle } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

interface TaskLog { log_id: string; task_type: string; status: string; model_used: string; tokens_used: number; created_at: string; agent_name: string }

const displayNames: Record<string, string> = { inventory_agent: "Inventory Agent", order_agent: "Orders Agent", support_agent: "Support Agent", pricing_agent: "Pricing Agent", marketing_agent: "Marketing Agent", logistics_agent: "Logistics Agent" }
const descriptionMap: Record<string, string> = { inventory_agent: "Monitors stock levels and manages reorders.", order_agent: "Processes orders and handles status updates.", support_agent: "Responds to customer inquiries with AI support.", pricing_agent: "Adjusts prices dynamically for optimal revenue.", marketing_agent: "Manages campaigns and tracks performance.", logistics_agent: "Optimizes shipping routes and tracks deliveries." }

export default function AgentsClient({ taskLogs }: { taskLogs: TaskLog[] }) {
  const [selectedAgent, setSelectedAgent] = useState<{ name: string; logs: TaskLog[]; stats: { total: number; completed: number; errors: number; accuracy: number; lastActive: string; status: string } } | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)
  const [sheetTab, setSheetTab] = useState<"logs" | "metrics">("logs")

  const agents = useMemo(() => {
    const agentNames = ["inventory_agent", "order_agent", "support_agent", "pricing_agent", "marketing_agent", "logistics_agent"]
    const map = new Map<string, { name: string; logs: TaskLog[]; stats: { total: number; completed: number; errors: number; accuracy: number; lastActive: string; status: string } }>()
    for (const name of agentNames) {
      map.set(name, { name, logs: [] as TaskLog[], stats: { total: 0, completed: 0, errors: 0, accuracy: 0, lastActive: "", status: "idle" } })
    }
    for (const log of taskLogs) {
      const agent = map.get(log.agent_name)
      if (agent) {
        agent.logs.push(log)
        agent.stats.total++
        if (log.status === "completed" || log.status === "success") agent.stats.completed++
        if (log.status === "error" || log.status === "failed") agent.stats.errors++
        if (!agent.stats.lastActive || log.created_at > agent.stats.lastActive) agent.stats.lastActive = log.created_at
      }
    }
    return Array.from(map.values()).filter(a => a.stats.total > 0).map(a => ({
      ...a, stats: { ...a.stats, accuracy: a.stats.total > 0 ? (a.stats.completed / a.stats.total) * 100 : 0, status: a.stats.total > 0 ? "active" : "idle" }
    })).sort((a, b) => b.stats.total - a.stats.total)
  }, [taskLogs])

  const activeAgents = agents.filter(a => a.stats.status === "active").length
  const totalTasks = agents.reduce((sum, a) => sum + a.stats.total, 0)
  const totalCompleted = agents.reduce((sum, a) => sum + a.stats.completed, 0)
  const avgAccuracy = totalTasks > 0 ? (totalCompleted / totalTasks) * 100 : 0
  const errorRate = totalTasks > 0 ? ((agents.reduce((sum, a) => sum + a.stats.errors, 0) / totalTasks) * 100) : 0

  const stats = [
    { title: "Active Agents", value: activeAgents.toString(), icon: Bot, change: `${agents.length} configured` },
    { title: "Tasks Completed", value: totalTasks.toLocaleString(), icon: CheckCircle, change: "Today" },
    { title: "Avg Accuracy", value: `${avgAccuracy.toFixed(1)}%`, icon: Clock, change: "Across all agents" },
    { title: "Error Rate", value: `${errorRate.toFixed(1)}%`, icon: AlertCircle, change: errorRate < 5 ? "Below threshold" : "Above threshold" },
  ]

  const statusStyles: Record<string, string> = { active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200", idle: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200" }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Agents</h2><p className="text-muted-foreground">Monitor and manage your AI-powered agents.</p></div>
        <Button variant="outline" onClick={() => alert("Agent configuration coming soon")}><Settings className="mr-2 size-4" />Configure</Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent></Card>
        ))}
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {agents.length === 0 ? (<div className="col-span-3"><Card><CardContent className="py-8"><p className="text-sm text-muted-foreground text-center">No agent activity today.</p></CardContent></Card></div>)
        : agents.map(agent => (
          <Card key={agent.name}>
            <CardHeader>
              <div className="flex items-center gap-2">
                <div className="flex size-8 items-center justify-center rounded-lg bg-primary/10"><Bot className="size-4 text-primary" /></div>
                <div><CardTitle className="text-base">{displayNames[agent.name] || agent.name}</CardTitle><span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[agent.stats.status]}`}>{agent.stats.status}</span></div>
              </div>
            </CardHeader>
            <CardContent className="space-y-3">
              <p className="text-sm text-muted-foreground">{descriptionMap[agent.name] || "AI agent"}</p>
              <div className="grid grid-cols-3 gap-2 text-center">
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.stats.total}</p><p className="text-xs text-muted-foreground">Tasks</p></div>
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.stats.accuracy.toFixed(1)}%</p><p className="text-xs text-muted-foreground">Accuracy</p></div>
                <div className="rounded-lg bg-muted p-2"><p className="text-lg font-bold">{agent.stats.lastActive ? new Date(agent.stats.lastActive).toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }) : "N/A"}</p><p className="text-xs text-muted-foreground">Last Active</p></div>
              </div>
              <div className="flex gap-2">
                <Button size="sm" variant="outline" className="flex-1" onClick={() => { setSelectedAgent(agent); setSheetTab("logs"); setSheetOpen(true) }}><Activity className="mr-1 size-3" />Logs</Button>
                <Button size="sm" variant="outline" className="flex-1" onClick={() => { setSelectedAgent(agent); setSheetTab("metrics"); setSheetOpen(true) }}><Zap className="mr-1 size-3" />Metrics</Button>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      <DetailSheet
        open={sheetOpen} onOpenChange={setSheetOpen}
        title={selectedAgent ? (displayNames[selectedAgent.name] || selectedAgent.name) : ""}
        description={selectedAgent ? (sheetTab === "logs" ? "Recent task logs" : "Performance metrics") : undefined}
        fields={selectedAgent ? (
          sheetTab === "logs" ? [
            { label: "Status", value: selectedAgent.stats.status },
            { label: "Total Tasks", value: `${selectedAgent.stats.total}` },
            { label: "Completed", value: `${selectedAgent.stats.completed}` },
            { label: "Errors", value: `${selectedAgent.stats.errors}` },
            { label: "Accuracy", value: `${selectedAgent.stats.accuracy.toFixed(1)}%` },
            ...selectedAgent.logs.slice(0, 5).map(log => ({ label: log.task_type || "Task", value: `${log.status} — ${log.model_used || "N/A"} (${log.tokens_used || 0} tokens) — ${new Date(log.created_at).toLocaleTimeString()}` })),
          ] : [
            { label: "Tasks Today", value: `${selectedAgent.stats.total}` },
            { label: "Completion Rate", value: `${selectedAgent.stats.accuracy.toFixed(1)}%` },
            { label: "Error Rate", value: `${selectedAgent.stats.total > 0 ? ((selectedAgent.stats.errors / selectedAgent.stats.total) * 100).toFixed(1) : 0}%` },
            { label: "Total Tokens", value: `${selectedAgent.logs.reduce((s, l) => s + (l.tokens_used || 0), 0).toLocaleString()}` },
            { label: "Models Used", value: [...new Set(selectedAgent.logs.map(l => l.model_used).filter(Boolean))].join(", ") || "N/A" },
          ]
        ) : []}
        actions={[{ label: "Logs", onClick: () => setSheetTab("logs") }, { label: "Metrics", variant: "outline" as const, onClick: () => setSheetTab("metrics") }]}
      />
    </div>
  )
}
