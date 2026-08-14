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

export interface RevenueDataPoint {
  month: string
  revenue: number
  lastYear: number
}

export interface OrdersByStatus {
  status: string
  count: number
  fill: string
}

export interface CategoryData {
  name: string
  value: number
  fill: string
}

export interface TopProduct {
  name: string
  sales: number
  revenue: number
}

export interface RegionData {
  region: string
  sales: number
  percentage: number
}

export interface ActivityItem {
  type: string
  message: string
  time: string
  amount: string | null
}

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

export function RevenueChart({ data }: { data: RevenueDataPoint[] }) {
  return (
    <Card className="col-span-2">
      <CardHeader>
        <CardTitle>Revenue Overview</CardTitle>
        <CardDescription>Monthly revenue with year-over-year comparison</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <AreaChart data={data} margin={{ top: 5, right: 10, left: 10, bottom: 0 }}>
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

export function OrdersStatusChart({ data }: { data: OrdersByStatus[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Orders by Status</CardTitle>
        <CardDescription>Current order distribution</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={data} margin={{ top: 5, right: 5, left: -10, bottom: 5 }}>
              <CartesianGrid strokeDasharray="3 3" className="stroke-muted" vertical={false} />
              <XAxis dataKey="status" className="text-xs" tickLine={false} axisLine={false} />
              <YAxis className="text-xs" tickLine={false} axisLine={false} />
              <Tooltip content={<ChartTooltipContent />} />
              <Bar dataKey="count" name="Orders" radius={[4, 4, 0, 0]}>
                {data.map((entry, index) => (
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

export function CategoryChart({ data }: { data: CategoryData[] }) {
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
                data={data}
                cx="50%"
                cy="50%"
                innerRadius={60}
                outerRadius={100}
                paddingAngle={3}
                dataKey="value"
              >
                {data.map((entry, index) => (
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

export function TopProductsChart({ data }: { data: TopProduct[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Top Products</CardTitle>
        <CardDescription>Best selling products by units sold</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-[300px]">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={data} layout="vertical" margin={{ top: 5, right: 16, left: 0, bottom: 5 }} barCategoryGap="30%">
              <CartesianGrid strokeDasharray="3 3" className="stroke-muted" horizontal={false} />
              <XAxis type="number" className="text-xs" tickLine={false} axisLine={false} />
              <YAxis
                type="category"
                dataKey="name"
                className="text-xs"
                tickLine={false}
                axisLine={false}
                width={140}
                interval={0}
                tickFormatter={(value: string) => (value.length > 18 ? `${value.slice(0, 18)}…` : value)}
              />
              <Tooltip content={<ChartTooltipContent />} />
              <Bar dataKey="sales" name="Units Sold" fill="hsl(var(--primary))" radius={[0, 4, 4, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  )
}

export function SalesByRegion({ data }: { data: RegionData[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Sales by Region</CardTitle>
        <CardDescription>Geographic revenue breakdown</CardDescription>
      </CardHeader>
      <CardContent className="space-y-3">
        {data.map((region) => (
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

export function RecentActivityFeed({ data }: { data: ActivityItem[] }) {
  return (
    <Card className="col-span-2">
      <CardHeader>
        <CardTitle>Recent Activity</CardTitle>
        <CardDescription>Latest store and agent activity</CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        {data.map((activity, index) => (
          <div key={index} className="flex items-start gap-3">
            <div className={`mt-1 size-2 shrink-0 rounded-full ${activityColors[activity.type] || "bg-gray-500"}`} />
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
