import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  DollarSign,
  TrendingUp,
  TrendingDown,
  Target,
  Sparkles,
  ArrowRight,
} from "lucide-react"

const pricingStats = [
  { title: "Avg Product Price", value: "$42.50", icon: DollarSign, change: "+$2.30 this week" },
  { title: "Price Increases", value: "156", icon: TrendingUp, change: "Auto-adjusted" },
  { title: "Price Decreases", value: "89", icon: TrendingDown, change: "Competitive matching" },
  { title: "Price Alerts", value: "12", icon: Target, change: "3 critical" },
]

const priceAdjustments = [
  {
    product: "Wireless Bluetooth Headphones",
    sku: "SKU-001",
    oldPrice: "$69.99",
    newPrice: "$79.99",
    change: "+14.3%",
    reason: "Competitor price increase detected",
    agent: "Pricing Agent",
    timestamp: "5 min ago",
  },
  {
    product: "Organic Cotton T-Shirt",
    sku: "SKU-002",
    oldPrice: "$34.99",
    newPrice: "$29.99",
    change: "-14.3%",
    reason: "Low demand - dynamic pricing",
    agent: "Pricing Agent",
    timestamp: "15 min ago",
  },
  {
    product: "Stainless Steel Water Bottle",
    sku: "SKU-003",
    oldPrice: "$24.99",
    newPrice: "$27.99",
    change: "+12.0%",
    reason: "Supply chain cost increase",
    agent: "Pricing Agent",
    timestamp: "30 min ago",
  },
]

const competitorPrices = [
  { product: "Wireless Headphones", ours: "$79.99", competitor1: "$84.99", competitor2: "$74.99", competitor3: "$79.99" },
  { product: "Cotton T-Shirt", ours: "$29.99", competitor1: "$32.99", competitor2: "$27.99", competitor3: "$31.99" },
  { product: "Water Bottle", ours: "$27.99", competitor1: "$29.99", competitor2: "$26.99", competitor3: "$28.99" },
  { product: "Laptop Stand", ours: "$49.99", competitor1: "$54.99", competitor2: "$44.99", competitor3: "$52.99" },
]

export default function PricingPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Pricing</h2>
          <p className="text-muted-foreground">
            AI-powered dynamic pricing optimization.
          </p>
        </div>
        <Button>
          <Sparkles className="mr-2 size-4" />
          Run Price Analysis
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {pricingStats.map((stat) => (
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

      <div className="grid gap-6 lg:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>Recent Price Adjustments</CardTitle>
            <CardDescription>AI-optimized price changes</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            {priceAdjustments.map((item, index) => (
              <div
                key={index}
                className="flex items-center justify-between rounded-lg border p-3"
              >
                <div className="space-y-1">
                  <p className="font-medium text-sm">{item.product}</p>
                  <p className="text-xs text-muted-foreground">
                    {item.sku} &middot; {item.reason}
                  </p>
                  <p className="text-xs text-muted-foreground">
                    {item.agent} &middot; {item.timestamp}
                  </p>
                </div>
                <div className="text-right">
                  <div className="flex items-center gap-2 text-sm">
                    <span className="text-muted-foreground line-through">
                      {item.oldPrice}
                    </span>
                    <span className="font-medium">{item.newPrice}</span>
                  </div>
                  <span
                    className={`text-xs font-medium ${
                      item.change.startsWith("+")
                        ? "text-green-600 dark:text-green-400"
                        : "text-red-600 dark:text-red-400"
                    }`}
                  >
                    {item.change}
                  </span>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Competitor Price Comparison</CardTitle>
            <CardDescription>Market positioning analysis</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b">
                    <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Ours</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Comp. 1</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Comp. 2</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Comp. 3</th>
                  </tr>
                </thead>
                <tbody>
                  {competitorPrices.map((item) => (
                    <tr key={item.product} className="border-b last:border-0">
                      <td className="py-3 font-medium">{item.product}</td>
                      <td className="py-3 font-bold text-primary">{item.ours}</td>
                      <td className="py-3 text-muted-foreground">{item.competitor1}</td>
                      <td className="py-3 text-muted-foreground">{item.competitor2}</td>
                      <td className="py-3 text-muted-foreground">{item.competitor3}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
