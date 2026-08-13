"use client"

import { useState, useMemo } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Logs, Search, Download, User, Bot, Settings, ShoppingCart, DollarSign } from "lucide-react"
import { exportToCSV } from "../../../lib/export-csv"

interface AuditLog { log_id: string; agent_name: string | null; task_type: string; status: string; output_data: string | unknown; model_used: string; tokens_used: number; created_at: string }

export default function AuditsClient({ logs }: { logs: AuditLog[] }) {
  const [searchQuery, setSearchQuery] = useState("")
  const [typeFilter, setTypeFilter] = useState("all")

  const filtered = useMemo(() => {
    return logs.filter(l => {
      const matchSearch = !searchQuery || l.task_type?.toLowerCase().includes(searchQuery.toLowerCase()) || l.agent_name?.toLowerCase().includes(searchQuery.toLowerCase())
      const logType = l.agent_name ? "agent" : "user"
      const matchType = typeFilter === "all" || logType === typeFilter
      return matchSearch && matchType
    })
  }, [logs, searchQuery, typeFilter])

  const userActions = filtered.filter(l => !l.agent_name).length
  const agentActions = filtered.filter(l => l.agent_name).length
  const criticalEvents = filtered.filter(l => l.status === "error" || l.status === "failed").length

  const stats = [
    { title: "Total Events", value: filtered.length.toLocaleString(), icon: Logs, change: "All time" },
    { title: "User Actions", value: userActions.toLocaleString(), icon: User, change: "Manual actions" },
    { title: "Agent Actions", value: agentActions.toLocaleString(), icon: Bot, change: "Automated" },
    { title: "Critical Events", value: criticalEvents.toString(), icon: Settings, change: `${criticalEvents} need review` },
  ]

  function handleExport() {
    exportToCSV(
      filtered.map(l => ({ event: l.task_type, type: l.agent_name ? "agent" : "user", status: l.status, agent: l.agent_name || "System", model: l.model_used || "N/A", tokens: l.tokens_used || 0, timestamp: new Date(l.created_at).toLocaleString(), id: l.log_id?.slice(0, 8) })),
      [{ key: "event", label: "Event" }, { key: "type", label: "Type" }, { key: "status", label: "Status" }, { key: "agent", label: "Agent" }, { key: "model", label: "Model" }, { key: "tokens", label: "Tokens" }, { key: "timestamp", label: "Timestamp" }, { key: "id", label: "ID" }],
      "audit-logs-export.csv"
    )
  }

  const iconMap: Record<string, typeof ShoppingCart> = { order: ShoppingCart, price: DollarSign, settings: Settings, agent: Bot, user: User, default: Logs }
  const typeStyles: Record<string, string> = { user: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200", agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200" }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Audit Logs</h2><p className="text-muted-foreground">Track all system and agent activities.</p></div>
        <Button variant="outline" onClick={handleExport}><Download className="mr-2 size-4" />Export Logs</Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent></Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Activity Log</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative"><Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" /><Input placeholder="Search logs..." className="pl-8 w-64" value={searchQuery} onChange={e => setSearchQuery(e.target.value)} /></div>
              <div className="flex gap-1">{["all", "user", "agent"].map(t => (<Button key={t} variant={typeFilter === t ? "default" : "outline"} size="sm" onClick={() => setTypeFilter(t)}>{t === "all" ? "All" : t}</Button>))}</div>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {filtered.length === 0 ? (<p className="text-sm text-muted-foreground text-center py-8">No audit logs found</p>)
            : filtered.map(log => {
              const type = log.agent_name ? "agent" : "user"
              const Icon = iconMap[log.task_type?.split("_")[0] || "default"] || Logs
              const details = log.output_data ? (typeof log.output_data === "string" ? log.output_data : JSON.stringify(log.output_data)) : log.task_type || "No details"
              return (
                <div key={log.log_id} className="flex items-start gap-4 rounded-lg border p-4">
                  <div className="flex size-8 shrink-0 items-center justify-center rounded-full bg-muted"><Icon className="size-4 text-muted-foreground" /></div>
                  <div className="flex-1 space-y-1">
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-sm">{log.task_type}</span>
                      <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${typeStyles[type]}`}>{type}</span>
                      {log.status && (<span className={`rounded-full px-2 py-0.5 text-xs font-medium ${log.status === "completed" || log.status === "success" ? "bg-green-100 text-green-800" : log.status === "error" || log.status === "failed" ? "bg-red-100 text-red-800" : "bg-gray-100 text-gray-800"}`}>{log.status}</span>)}
                    </div>
                    <p className="text-sm text-muted-foreground line-clamp-2">{details}</p>
                    <div className="flex items-center gap-4 text-xs text-muted-foreground"><span>{log.agent_name || "System"}</span><span>{new Date(log.created_at).toLocaleString()}</span><span>{log.log_id?.slice(0, 8)}</span></div>
                  </div>
                </div>
              )
            })}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
