import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import {
  Logs,
  Search,
  Download,
  Filter,
  User,
  Bot,
  Settings,
  ShoppingCart,
  DollarSign,
} from "lucide-react"
import { createServerClient } from "../../../lib/supabase-server"

export const dynamic = "force-dynamic"

export default async function AuditLogsPage() {
  const supabase = createServerClient()

  const { data: logs } = await supabase
    .from("agent_task_log")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(50)

  const allLogs = logs || []

  const totalEvents = allLogs.length
  const userActions = allLogs.filter(l => !l.agent_name).length
  const agentActions = allLogs.filter(l => l.agent_name).length
  const criticalEvents = allLogs.filter(l => l.status === "error" || l.status === "failed").length

  const auditStats = [
    { title: "Total Events", value: totalEvents.toLocaleString(), icon: Logs, change: "All time" },
    { title: "User Actions", value: userActions.toLocaleString(), icon: User, change: "Manual actions" },
    { title: "Agent Actions", value: agentActions.toLocaleString(), icon: Bot, change: "Automated" },
    { title: "Critical Events", value: criticalEvents.toString(), icon: Settings, change: `${criticalEvents} need review` },
  ]

  const iconMap: Record<string, typeof ShoppingCart> = {
    order: ShoppingCart,
    price: DollarSign,
    settings: Settings,
    agent: Bot,
    user: User,
    default: Logs,
  }

  const typeStyles: Record<string, string> = {
    user: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Audit Logs</h2>
          <p className="text-muted-foreground">
            Track all system and agent activities.
          </p>
        </div>
        <Button variant="outline">
          <Download className="mr-2 size-4" />
          Export Logs
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {auditStats.map((stat) => (
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
            <CardTitle>Activity Log</CardTitle>
            <div className="flex items-center gap-2">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 size-4 text-muted-foreground" />
                <Input placeholder="Search logs..." className="pl-8 w-64" />
              </div>
              <Button variant="outline" size="sm">
                <Filter className="mr-2 size-3" />
                Filter
              </Button>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {allLogs.length === 0 ? (
              <p className="text-sm text-muted-foreground text-center py-8">No audit logs found</p>
            ) : (
              allLogs.map((log) => {
                const type = log.agent_name ? "agent" : "user"
                const Icon = iconMap[log.task_type?.split("_")[0] || "default"] || Logs
                const details = log.output_data
                  ? (typeof log.output_data === "string" ? log.output_data : JSON.stringify(log.output_data))
                  : log.task_type || "No details"

                return (
                  <div
                    key={log.log_id}
                    className="flex items-start gap-4 rounded-lg border p-4"
                  >
                    <div className="flex size-8 shrink-0 items-center justify-center rounded-full bg-muted">
                      <Icon className="size-4 text-muted-foreground" />
                    </div>
                    <div className="flex-1 space-y-1">
                      <div className="flex items-center gap-2">
                        <span className="font-medium text-sm">{log.task_type}</span>
                        <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${typeStyles[type]}`}>
                          {type}
                        </span>
                        {log.status && (
                          <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${
                            log.status === "completed" ? "bg-green-100 text-green-800" :
                            log.status === "error" || log.status === "failed" ? "bg-red-100 text-red-800" :
                            "bg-gray-100 text-gray-800"
                          }`}>
                            {log.status}
                          </span>
                        )}
                      </div>
                      <p className="text-sm text-muted-foreground line-clamp-2">{details}</p>
                      <div className="flex items-center gap-4 text-xs text-muted-foreground">
                        <span>{log.agent_name || "System"}</span>
                        <span>{new Date(log.created_at).toLocaleString()}</span>
                        <span>{log.log_id?.slice(0, 8)}</span>
                      </div>
                    </div>
                  </div>
                )
              })
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
