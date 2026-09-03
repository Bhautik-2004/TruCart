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
  Clock,
  Bot,
  CreditCard,
  RefreshCw,
} from "lucide-react"
import {
  RevenueChart,
  OrdersStatusChart,
  CategoryChart,
  TopProductsChart,
  RecentActivityFeed,
  RevenueDataPoint,
  OrdersByStatus,
  CategoryData,
  TopProduct,
  ActivityItem,
} from "./components/charts"
import { createServerClient } from "../../lib/supabase-server"

export const dynamic = "force-dynamic"

const categoryColors: Record<string, string> = {
  "Tablets": "#3b82f6",
  "Headphones & Earbuds": "#8b5cf6",
  "Speakers": "#22c55e",
  "Smart Home": "#f59e0b",
  "Cameras": "#ef4444",
  "Wearables": "#6366f1",
  "Other": "#6b7280",
}

const statusFills: Record<string, string> = {
  pending: "#f59e0b",
  confirmed: "#3b82f6",
  processing: "#8b5cf6",
  shipped: "#8b5cf6",
  delivered: "#22c55e",
  cancelled: "#ef4444",
}

const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

function formatCurrency(amount: number): string {
  if (amount >= 100000) return `$${(amount / 1000).toFixed(1)}k`
  return `$${amount.toLocaleString("en-US", { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`
}

function formatTimeAgo(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime()
  const mins = Math.floor(diff / 60000)
  if (mins < 1) return "just now"
  if (mins < 60) return `${mins} min ago`
  const hrs = Math.floor(mins / 60)
  if (hrs < 24) return `${hrs} hr ago`
  const days = Math.floor(hrs / 24)
  return `${days}d ago`
}

export default async function DashboardPage() {
  const supabase = createServerClient()

  const [
    ordersResult,
    productsResult,
    customersResult,
    inventoryResult,
    taskLogResult,
    shipmentsResult,
    orderItemsResult,
  ] = await Promise.all([
    supabase.from("orders").select("total_amount, status, placed_at, created_at"),
    supabase.from("products").select("product_id, sku, name, category, current_price, status"),
    supabase.from("customers").select("customer_id, created_at"),
    supabase.from("inventory").select("product_id, quantity_on_hand, reorder_point"),
    supabase.from("agent_task_log").select("agent_name, status, task_type, created_at, input_data, output_data").order("created_at", { ascending: false }).limit(100),
    supabase.from("shipments").select("shipment_id, status, shipped_at, delivered_at, created_at").order("created_at", { ascending: false }).limit(50),
    supabase.from("order_items").select("quantity, unit_price, product_id, products(name, category)").limit(500),
  ])

  const orders = ordersResult.data || []
  const products = productsResult.data || []
  const customers = customersResult.data || []
  const inventory = inventoryResult.data || []
  const taskLogs = taskLogResult.data || []
  const shipments = shipmentsResult.data || []
  const orderItems = orderItemsResult.data || []

  const totalRevenue = orders.reduce((sum, o) => sum + (Number(o.total_amount) || 0), 0)
  const totalOrders = orders.length
  const activeProducts = products.filter(p => p.status === "active").length
  const activeUsers = customers.length
  const avgOrderValue = totalOrders > 0 ? totalRevenue / totalOrders : 0

  const cancelledOrders = orders.filter(o => o.status === "cancelled").length
  const returnRate = totalOrders > 0 ? (cancelledOrders / totalOrders) * 100 : null

  const completedTasks = taskLogs.filter(t => t.status === "completed" || t.status === "success").length
  const totalTasks = taskLogs.length
  const agentSuccessRate = totalTasks > 0 ? (completedTasks / totalTasks) * 100 : null

  const deliveredShipments = shipments.filter(s => s.delivered_at && s.shipped_at)
  const avgDeliveryDays = deliveredShipments.length > 0
    ? deliveredShipments.reduce((sum, s) => {
        const diff = (new Date(s.delivered_at!).getTime() - new Date(s.shipped_at!).getTime()) / (1000 * 60 * 60 * 24)
        return sum + diff
      }, 0) / deliveredShipments.length
    : null

  // Revenue for the trailing 12 calendar months, from real order dates.
  const now = new Date()
  const monthBuckets: { key: string; label: string }[] = []
  for (let i = 11; i >= 0; i--) {
    const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
    monthBuckets.push({ key: `${d.getFullYear()}-${d.getMonth()}`, label: monthNames[d.getMonth()] || "" })
  }
  const revenueByKey: Record<string, number> = {}
  for (const order of orders) {
    const d = new Date(order.placed_at || order.created_at)
    if (Number.isNaN(d.getTime())) continue
    const key = `${d.getFullYear()}-${d.getMonth()}`
    revenueByKey[key] = (revenueByKey[key] || 0) + (Number(order.total_amount) || 0)
  }
  const revenueData: RevenueDataPoint[] = monthBuckets.map(m => ({
    month: m.label,
    revenue: revenueByKey[m.key] || 0,
  }))

  const statusCounts: Record<string, number> = {}
  for (const order of orders) {
    const s = order.status || "pending"
    statusCounts[s] = (statusCounts[s] || 0) + 1
  }
  const ordersByStatus: OrdersByStatus[] = Object.entries(statusCounts).map(([status, count]) => ({
    status: status.charAt(0).toUpperCase() + status.slice(1),
    count,
    fill: statusFills[status] || "#6b7280",
  }))

  const categoryRevenue: Record<string, number> = {}
  for (const item of orderItems) {
    const cat = (item.products as any)?.category || "Other"
    categoryRevenue[cat] = (categoryRevenue[cat] || 0) + (Number(item.unit_price) * Number(item.quantity))
  }
  const defaultColors = ["#3b82f6", "#8b5cf6", "#22c55e", "#f59e0b", "#ef4444", "#6b7280"]
  const categoryData: CategoryData[] = Object.entries(categoryRevenue)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 6)
    .map(([name, value], i) => ({
      name,
      value,
      fill: categoryColors[name] || defaultColors[i] || "#6b7280",
    }))

  const productSales: Record<string, { name: string; sales: number; revenue: number }> = {}
  for (const item of orderItems) {
    const name = (item.products as any)?.name || "Unknown"
    if (!productSales[name]) productSales[name] = { name, sales: 0, revenue: 0 }
    productSales[name].sales += Number(item.quantity) || 0
    productSales[name].revenue += (Number(item.unit_price) * Number(item.quantity)) || 0
  }
  const topProducts: TopProduct[] = Object.values(productSales)
    .sort((a, b) => b.sales - a.sales)
    .slice(0, 6)

  const agentNames = ["inventory_agent", "order_agent", "support_agent", "pricing_agent", "marketing_agent", "logistics_agent"]
  const agentDisplayNames: Record<string, string> = {
    inventory_agent: "Inventory",
    order_agent: "Orders",
    support_agent: "Support",
    pricing_agent: "Pricing",
    marketing_agent: "Marketing",
    logistics_agent: "Logistics",
  }
  const agentPerformance = agentNames.map(name => {
    const agentTasks = taskLogs.filter(t => t.agent_name === name)
    const completed = agentTasks.filter(t => t.status === "completed" || t.status === "success").length
    const total = agentTasks.length
    return {
      name: agentDisplayNames[name] || name,
      tasks: total,
      successRate: total > 0 ? `${((completed / total) * 100).toFixed(0)}%` : "—",
      status: total > 0 ? "operational" : "idle",
    }
  }).filter(a => a.tasks > 0)

  const lowStockProducts = inventory
    .filter(i => i.quantity_on_hand <= i.reorder_point)
    .slice(0, 3)
  const alerts: { title: string; severity: string; time: string }[] = lowStockProducts.map(i => {
    const product = products.find(p => p.product_id === i.product_id)
    return {
      title: `Low stock on ${product?.name || "product"} (${i.quantity_on_hand} units)`,
      severity: i.quantity_on_hand === 0 ? "high" : "medium",
      time: "current",
    }
  })

  const recentActivityItems: ActivityItem[] = taskLogs.slice(0, 8).map(log => ({
    type: (log.status === "completed" || log.status === "success") ? "success" : (log.status === "failed" || log.status === "error") ? "alert" : "agent",
    message: `${agentDisplayNames[log.agent_name] || log.agent_name} - ${log.task_type}`,
    time: formatTimeAgo(log.created_at),
    amount: null,
  }))

  const primaryKpis = [
    { title: "Total Revenue", value: formatCurrency(totalRevenue), icon: DollarSign },
    { title: "Total Orders", value: totalOrders.toLocaleString(), icon: ShoppingCart },
    { title: "Active Products", value: activeProducts.toLocaleString(), icon: Package },
    { title: "Customers", value: activeUsers.toLocaleString(), icon: Users },
  ]

  const secondaryKpis = [
    { title: "Avg Order Value", value: `$${avgOrderValue.toFixed(2)}`, icon: CreditCard },
    { title: "Agent Task Success", value: agentSuccessRate === null ? "—" : `${agentSuccessRate.toFixed(0)}%`, icon: Bot },
    { title: "Avg Delivery Time", value: avgDeliveryDays === null ? "—" : `${avgDeliveryDays.toFixed(1)} days`, icon: Clock },
    { title: "Cancellation Rate", value: returnRate === null ? "—" : `${returnRate.toFixed(1)}%`, icon: RefreshCw },
  ]

  const severityStyles: Record<string, string> = {
    high: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
    medium: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
    low: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  }

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Dashboard</h2>
        <p className="text-muted-foreground">
          Welcome back! Here&apos;s your store at a glance.
        </p>
      </div>

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
              <div className="text-2xl font-bold">{stat.value}</div>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
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
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <RevenueChart data={revenueData} />
        <OrdersStatusChart data={ordersByStatus} />
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <CategoryChart data={categoryData} />
        <TopProductsChart data={topProducts} />
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <RecentActivityFeed data={recentActivityItems} />

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
                    <p className="text-xs text-muted-foreground">{agent.tasks} tasks logged</p>
                  </div>
                </div>
                <div className="text-right">
                  <p className="text-sm font-bold">{agent.successRate}</p>
                  <span className="rounded-full bg-green-100 px-1.5 py-0.5 text-[10px] font-medium text-green-800 dark:bg-green-900 dark:text-green-200">
                    {agent.status}
                  </span>
                </div>
              </div>
            ))}
            {agentPerformance.length === 0 && (
              <p className="text-sm text-muted-foreground text-center py-4">No agent activity yet</p>
            )}
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Active Alerts</CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            {alerts.map((alert, index) => (
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
            {alerts.length === 0 && (
              <p className="text-sm text-muted-foreground text-center py-4">No active alerts</p>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
