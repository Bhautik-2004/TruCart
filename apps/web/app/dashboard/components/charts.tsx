"use client"

import {
  Area,
  AreaChart,
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  Legend,
  Pie,
  PieChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@workspace/ui/components/card"

const revenueData = [
  { month: "Jan", revenue: 18500, orders: 820, lastYear: 14200 },
  { month: "Feb", revenue: 22100, orders: 950, lastYear: 16800 },
  { month: "Mar", revenue: 19800, orders: 880, lastYear: 15100 },
  { month: "Apr", revenue: 28400, orders: 1200, lastYear: 19500 },
  { month: "May", revenue: 31200, orders: 1350, lastYear: 22100 },
  { month: "Jun", revenue: 35600, orders: 1520, lastYear: 24800 },
  { month: "Jul", revenue: 38900, orders: 1680, lastYear: 26200 },
  { month: "Aug", revenue: 42100, orders: 1800, lastYear: 28900 },
  { month: "Sep", revenue: 39500, orders: 1700, lastYear: 30100 },
  { month: "Oct", revenue: 45200, orders: 1950, lastYear: 32400 },
  { month: "Nov", revenue: 51800, orders: 2200, lastYear: 38200 },
  { month: "Dec", revenue: 58400, orders: 2500, lastYear: 42100 },
]

const ordersByStatus = [
  { status: "Pending", count: 45, fill: "#f59e0b" },
  { status: "Processing", count: 78, fill: "#3b82f6" },
  { status: "Shipped", count: 142, fill: "#8b5cf6" },
  { status: "Delivered", count: 389, fill: "#22c55e" },
  { status: "Cancelled", count: 12, fill: "#ef4444" },
]

const categoryData = [
  { name: "Electronics", value: 35200, fill: "#3b82f6" },
  { name: "Apparel", value: 22100, fill: "#8b5cf6" },
  { name: "Home & Garden", value: 18400, fill: "#22c55e" },
  { name: "Accessories", value: 12800, fill: "#f59e0b" },
  { name: "Sports", value: 8900, fill: "#ef4444" },
  { name: "Other", value: 5400, fill: "#6b7280" },
]

const topProducts = [
  { name: "Wireless Headphones", sales: 1234, revenue: 98720 },
  { name: "Smart Watch Pro", sales: 987, revenue: 88830 },
  { name: "USB-C Hub", sales: 876, revenue: 35040 },
  { name: "Laptop Stand", sales: 654, revenue: 32700 },
  { name: "Mechanical Keyboard", sales: 543, revenue: 43440 },
  { name: "Webcam HD", sales: 432, revenue: 21600 },
]

const salesByRegion = [
  { region: "North America", sales: 42100, percentage: 35.2 },
  { region: "Europe", sales: 28400, percentage: 23.7 },
  { region: "Asia Pacific", sales: 24800, percentage: 20.7 },
  { region: "Latin America", sales: 14200, percentage: 11.9 },
  { region: "Middle East", sales: 6300, percentage: 5.3 },
  { region: "Africa", sales: 4000, percentage: 3.3 },
]

const recentActivity = [
  { type: "order", message: "New order #ORD-1234 from Alice Johnson", time: "2 min ago", amount: "$156.99" },
  { type: "agent", message: "Pricing Agent adjusted 12 product prices", time: "5 min ago", amount: null },
  { type: "alert", message: "Low stock alert: SKU-002 (12 units left)", time: "8 min ago", amount: null },
  { type: "order", message: "Order #ORD-1233 shipped via FedEx", time: "12 min ago", amount: "$49.99" },
  { type: "success", message: "Support Agent resolved ticket #TKT-501", time: "15 min ago", amount: null },
  { type: "order", message: "New order #ORD-1232 from Carol Davis", time: "20 min ago", amount: "$234.50" },
  { type: "agent", message: "Marketing Agent launched Summer Sale campaign", time: "25 min ago", amount: null },
  { type: "alert", message: "Delivery issue with shipment #SHP-004", time: "30 min ago", amount: null },
]

const activityColors: Record<string, string> = {
  order: "bg-blue-500",
  agent: "bg-purple-500",
  alert: "bg-yellow-500",
  success: "bg-green-500",
}

function ChartTooltipContent({ active, payload, label }: { active?: boolean; payload?: Array<{ value: number; name: string }>; label?: string }) {
  if (!active || !payload?.length) return null
  return (
    <div className="rounded-lg border bg-popover p-3 shadow-md">
      <p className="mb-1 text-sm font-medium">{label}</p>
      {payload.map((entry) => (
        <p key={entry.name} className="text-sm text-muted-foreground">
          {entry.name}: {typeof entry.value === "number" && entry.value > 1000
            ? `$${(entry.value / 1000).toFixed(1)}k`
            : entry.value}
        </p>
      ))}
    </div>
  )
}

export function RevenueChart() {
  return (
    <Card className="col-span-2">
      <CardHeader>
        <CardTitle>Revenue Overview</CardTitle>
        <CardDescription>Monthly revenue with year-over-year comparison</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <AreaChart data={revenueData} margin={{ top: 5, right: 10, left: 10, bottom: 0 }}>
              <defs>
                <linearGradient id="revenueGrad" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="hsl(var(--primary))" stopOpacity={0.3} />
                  <stop offset="95%" stopColor="hsl(var(--primary))" stopOpacity={0} />
                </linearGradient>
                <linearGradient id="lastYearGrad" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="hsl(var(--muted-foreground))" stopOpacity={0.15} />
                  <stop offset="95%" stopColor="hsl(var(--muted-foreground))" stopOpacity={0} />
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" className="stroke-muted" />
              <XAxis dataKey="month" className="text-xs" tickLine={false} axisLine={false} />
              <YAxis className="text-xs" tickLine={false} axisLine={false} tickFormatter={(v) => `$${v / 1000}k`} />
              <Tooltip content={<ChartTooltipContent />} />
              <Area type="monotone" dataKey="lastYear" name="Last Year" stroke="hsl(var(--muted-foreground))" strokeWidth={1.5} fill="url(#lastYearGrad)" strokeDasharray="5 5" />
              <Area type="monotone" dataKey="revenue" name="This Year" stroke="hsl(var(--primary))" strokeWidth={2} fill="url(#revenueGrad)" />
            </AreaChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  )
}

export function OrdersStatusChart() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Orders by Status</CardTitle>
        <CardDescription>Current order distribution</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={ordersByStatus} margin={{ top: 5, right: 5, left: -10, bottom: 5 }}>
              <CartesianGrid strokeDasharray="3 3" className="stroke-muted" vertical={false} />
              <XAxis dataKey="status" className="text-xs" tickLine={false} axisLine={false} />
              <YAxis className="text-xs" tickLine={false} axisLine={false} />
              <Tooltip content={<ChartTooltipContent />} />
              <Bar dataKey="count" name="Orders" radius={[4, 4, 0, 0]}>
                {ordersByStatus.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.fill} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  )
}

export function CategoryChart() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Sales by Category</CardTitle>
        <CardDescription>Revenue distribution across categories</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <PieChart>
              <Pie
                data={categoryData}
                cx="50%"
                cy="50%"
                innerRadius={60}
                outerRadius={100}
                paddingAngle={3}
                dataKey="value"
              >
                {categoryData.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.fill} />
                ))}
              </Pie>
              <Tooltip content={<ChartTooltipContent />} />
              <Legend
                verticalAlign="bottom"
                height={36}
                formatter={(value) => <span className="text-xs text-muted-foreground">{value}</span>}
              />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  )
}

export function TopProductsChart() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Top Products</CardTitle>
        <CardDescription>Best selling products by units sold</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={topProducts} layout="vertical" margin={{ top: 5, right: 10, left: 0, bottom: 5 }}>
              <CartesianGrid strokeDasharray="3 3" className="stroke-muted" horizontal={false} />
              <XAxis type="number" className="text-xs" tickLine={false} axisLine={false} />
              <YAxis type="category" dataKey="name" className="text-xs" tickLine={false} axisLine={false} width={120} />
              <Tooltip content={<ChartTooltipContent />} />
              <Bar dataKey="sales" name="Units Sold" fill="hsl(var(--primary))" radius={[0, 4, 4, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  )
}

export function SalesByRegion() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Sales by Region</CardTitle>
        <CardDescription>Geographic revenue breakdown</CardDescription>
      </CardHeader>
      <CardContent className="space-y-3">
        {salesByRegion.map((region) => (
          <div key={region.region} className="space-y-1">
            <div className="flex items-center justify-between text-sm">
              <span>{region.region}</span>
              <span className="font-medium">${(region.sales / 1000).toFixed(1)}k</span>
            </div>
            <div className="h-2 w-full rounded-full bg-muted overflow-hidden">
              <div
                className="h-full rounded-full bg-primary transition-all"
                style={{ width: `${region.percentage}%` }}
              />
            </div>
          </div>
        ))}
      </CardContent>
    </Card>
  )
}

export function RecentActivityFeed() {
  return (
    <Card className="col-span-2">
      <CardHeader>
        <CardTitle>Recent Activity</CardTitle>
        <CardDescription>Latest store and agent activity</CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        {recentActivity.map((activity, index) => (
          <div key={index} className="flex items-start gap-3">
            <div className={`mt-1 size-2 shrink-0 rounded-full ${activityColors[activity.type]}`} />
            <div className="flex-1 space-y-0.5">
              <p className="text-sm">{activity.message}</p>
              <div className="flex items-center gap-2 text-xs text-muted-foreground">
                <span>{activity.time}</span>
                {activity.amount && (
                  <span className="font-medium text-foreground">{activity.amount}</span>
                )}
              </div>
            </div>
          </div>
        ))}
      </CardContent>
    </Card>
  )
}
