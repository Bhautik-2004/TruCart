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

const auditStats = [
  { title: "Total Events", value: "15,234", icon: Logs, change: "Today" },
  { title: "User Actions", value: "3,456", icon: User, change: "42 active users" },
  { title: "Agent Actions", value: "11,778", icon: Bot, change: "Automated" },
  { title: "Critical Events", value: "12", icon: Settings, change: "3 pending review" },
]

const auditLogs = [
  {
    id: "LOG-001",
    timestamp: "2024-01-15 14:32:15",
    action: "Order Created",
    user: "Alice Johnson",
    type: "user",
    details: "Order #ORD-1234 placed - $156.99",
    icon: ShoppingCart,
  },
  {
    id: "LOG-002",
    timestamp: "2024-01-15 14:30:45",
    action: "Price Updated",
    user: "Pricing Agent",
    type: "agent",
    details: "SKU-001 price changed from $69.99 to $79.99",
    icon: DollarSign,
  },
  {
    id: "LOG-003",
    timestamp: "2024-01-15 14:28:30",
    action: "Settings Changed",
    user: "Admin",
    type: "user",
    details: "Shipping rates updated for Zone 3",
    icon: Settings,
  },
  {
    id: "LOG-004",
    timestamp: "2024-01-15 14:25:00",
    action: "Agent Task Completed",
    user: "Support Agent",
    type: "agent",
    details: "Ticket #TKT-501 resolved automatically",
    icon: Bot,
  },
  {
    id: "LOG-005",
    timestamp: "2024-01-15 14:20:15",
    action: "Inventory Adjusted",
    user: "Inventory Agent",
    type: "agent",
    details: "SKU-002 stock updated: 50 → 38 units",
    icon: Logs,
  },
  {
    id: "LOG-006",
    timestamp: "2024-01-15 14:15:30",
    action: "Campaign Started",
    user: "Marketing Agent",
    type: "agent",
    details: "Summer Sale 2024 campaign launched",
    icon: Bot,
  },
  {
    id: "LOG-007",
    timestamp: "2024-01-15 14:10:00",
    action: "Login",
    user: "Bob Williams",
    type: "user",
    details: "Successful login from 192.168.1.1",
    icon: User,
  },
]

const typeStyles: Record<string, string> = {
  user: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
}

export default function AuditLogsPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Audit Logs</h2>
          <p className="text-muted-foreground">
            Track all system and user activities.
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
            {auditLogs.map((log) => (
              <div
                key={log.id}
                className="flex items-start gap-4 rounded-lg border p-4"
              >
                <div className="flex size-8 shrink-0 items-center justify-center rounded-full bg-muted">
                  <log.icon className="size-4 text-muted-foreground" />
                </div>
                <div className="flex-1 space-y-1">
                  <div className="flex items-center gap-2">
                    <span className="font-medium text-sm">{log.action}</span>
                    <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${typeStyles[log.type]}`}>
                      {log.type}
                    </span>
                  </div>
                  <p className="text-sm text-muted-foreground">{log.details}</p>
                  <div className="flex items-center gap-4 text-xs text-muted-foreground">
                    <span>{log.user}</span>
                    <span>{log.timestamp}</span>
                    <span>{log.id}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
