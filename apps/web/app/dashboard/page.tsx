import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@workspace/ui/components/card"
import {
  ShoppingCart,
  Users,
  Package,
  DollarSign,
  TrendingUp,
  TrendingDown,
  Percent,
  Clock,
  Star,
  Bot,
  CreditCard,
  RefreshCw,
  ArrowUpRight,
  ArrowDownRight,
} from "lucide-react"
import {
  RevenueChart,
  OrdersStatusChart,
  CategoryChart,
  TopProductsChart,
  SalesByRegion,
  RecentActivityFeed,
} from "./components/charts"

const primaryKpis = [
  {
    title: "Total Revenue",
    value: "$45,231.89",
    change: "+20.1%",
    trend: "up" as const,
    icon: DollarSign,
    sparkline: [18500, 22100, 19800, 28400, 31200, 35600, 38900, 42100, 39500, 45200, 51800, 58400],
  },
  {
    title: "Total Orders",
    value: "2,350",
    change: "+12.5%",
    trend: "up" as const,
    icon: ShoppingCart,
    sparkline: [820, 950, 880, 1200, 1350, 1520, 1680, 1800, 1700, 1950, 2200, 2500],
  },
  {
    title: "Active Products",
    value: "12,234",
    change: "+19%",
    trend: "up" as const,
    icon: Package,
    sparkline: [8200, 8900, 9400, 10100, 10800, 11200, 11500, 11800, 12000, 12100, 12200, 12234],
  },
  {
    title: "Active Users",
    value: "573",
    change: "+201",
    trend: "up" as const,
    icon: Users,
    sparkline: [320, 345, 380, 410, 440, 470, 490, 510, 530, 545, 560, 573],
  },
]

const secondaryKpis = [
  {
    title: "Conversion Rate",
    value: "3.8%",
    change: "+0.5%",
    trend: "up" as const,
    icon: Percent,
  },
  {
    title: "Avg Order Value",
    value: "$68.42",
    change: "+$4.20",
    trend: "up" as const,
    icon: CreditCard,
  },
  {
    title: "Customer Satisfaction",
    value: "4.8/5",
    change: "+0.2",
    trend: "up" as const,
    icon: Star,
  },
  {
    title: "Agent Uptime",
    value: "99.8%",
    change: "-0.1%",
    trend: "down" as const,
    icon: Bot,
  },
  {
    title: "Avg Delivery Time",
    value: "2.3 days",
    change: "-0.2 days",
    trend: "up" as const,
    icon: Clock,
  },
  {
    title: "Return Rate",
    value: "2.1%",
    change: "-0.3%",
    trend: "up" as const,
    icon: RefreshCw,
  },
]

const agentPerformance = [
  { name: "Inventory", tasks: 234, accuracy: "99.2%", status: "operational" },
  { name: "Orders", tasks: 456, accuracy: "98.8%", status: "operational" },
  { name: "Support", tasks: 189, accuracy: "97.5%", status: "operational" },
  { name: "Pricing", tasks: 89, accuracy: "99.1%", status: "operational" },
  { name: "Marketing", tasks: 167, accuracy: "98.3%", status: "operational" },
  { name: "Logistics", tasks: 112, accuracy: "99.5%", status: "operational" },
]

const topAlerts = [
  { title: "Low stock on 5 products", severity: "high", time: "2 min ago" },
  { title: "Price anomaly detected on SKU-001", severity: "medium", time: "8 min ago" },
  { title: "Shipment delay for ORD-1231", severity: "medium", time: "15 min ago" },
  { title: "Customer complaint on TKT-502", severity: "low", time: "22 min ago" },
]

const severityStyles: Record<string, string> = {
  high: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
  medium: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  low: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
}

function MiniSparkline({ data }: { data: number[] }) {
  const max = Math.max(...data)
  const min = Math.min(...data)
  const range = max - min || 1
  const height = 32
  const width = 80

  const points = data
    .map((val, i) => {
      const x = (i / (data.length - 1)) * width
      const y = height - ((val - min) / range) * height
      return `${x},${y}`
    })
    .join(" ")

  return (
    <svg width={width} height={height} className="shrink-0">
      <polyline
        points={points}
        fill="none"
        stroke="hsl(var(--primary))"
        strokeWidth="1.5"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  )
}

export default function DashboardPage() {
  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Dashboard</h2>
        <p className="text-muted-foreground">
          Welcome back! Here&apos;s your store at a glance.
        </p>
      </div>

      {/* Primary KPIs with sparklines */}
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {primaryKpis.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">
                {stat.title}
              </CardTitle>
              <stat.icon className="size-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="flex items-end justify-between">
                <div>
                  <div className="text-2xl font-bold">{stat.value}</div>
                  <div className="flex items-center gap-1 text-xs text-muted-foreground">
                    {stat.trend === "up" ? (
                      <ArrowUpRight className="size-3 text-green-500" />
                    ) : (
                      <ArrowDownRight className="size-3 text-red-500" />
                    )}
                    <span className={stat.trend === "up" ? "text-green-500" : "text-red-500"}>
                      {stat.change}
                    </span>
                    <span>from last month</span>
                  </div>
                </div>
                <MiniSparkline data={stat.sparkline} />
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Secondary KPIs */}
      <div className="grid gap-4 md:grid-cols-3 lg:grid-cols-6">
        {secondaryKpis.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-1">
              <CardTitle className="text-xs font-medium text-muted-foreground">
                {stat.title}
              </CardTitle>
              <stat.icon className="size-3 text-muted-foreground" />
            </CardHeader>
            <CardContent className="pt-0">
              <div className="text-xl font-bold">{stat.value}</div>
              <div className="flex items-center gap-1 text-xs">
                {stat.trend === "up" ? (
                  <ArrowUpRight className="size-3 text-green-500" />
                ) : (
                  <ArrowDownRight className="size-3 text-red-500" />
                )}
                <span className={stat.trend === "up" ? "text-green-500" : "text-red-500"}>
                  {stat.change}
                </span>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Main Charts Row */}
      <div className="grid gap-6 lg:grid-cols-3">
        <RevenueChart />
        <OrdersStatusChart />
      </div>

      {/* Second Charts Row */}
      <div className="grid gap-6 lg:grid-cols-3">
        <CategoryChart />
        <TopProductsChart />
        <SalesByRegion />
      </div>

      {/* Bottom Row: Activity + Agents + Alerts */}
      <div className="grid gap-6 lg:grid-cols-3">
        <RecentActivityFeed />

        {/* Agent Performance */}
        <Card>
          <CardHeader>
            <CardTitle>Agent Performance</CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            {agentPerformance.map((agent) => (
              <div key={agent.name} className="flex items-center justify-between rounded-lg border p-3">
                <div className="flex items-center gap-3">
                  <div className="flex size-8 items-center justify-center rounded-lg bg-primary/10">
                    <Bot className="size-4 text-primary" />
                  </div>
                  <div>
                    <p className="text-sm font-medium">{agent.name} Agent</p>
                    <p className="text-xs text-muted-foreground">{agent.tasks} tasks today</p>
                  </div>
                </div>
                <div className="text-right">
                  <p className="text-sm font-bold">{agent.accuracy}</p>
                  <span className="rounded-full bg-green-100 px-1.5 py-0.5 text-[10px] font-medium text-green-800 dark:bg-green-900 dark:text-green-200">
                    {agent.status}
                  </span>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>

        {/* Active Alerts */}
        <Card>
          <CardHeader>
            <CardTitle>Active Alerts</CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            {topAlerts.map((alert, index) => (
              <div
                key={index}
                className="flex items-start justify-between rounded-lg border p-3"
              >
                <div className="space-y-1">
                  <p className="text-sm font-medium">{alert.title}</p>
                  <p className="text-xs text-muted-foreground">{alert.time}</p>
                </div>
                <span className={`shrink-0 rounded-full px-2 py-0.5 text-xs font-medium ${severityStyles[alert.severity]}`}>
                  {alert.severity}
                </span>
              </div>
            ))}
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
