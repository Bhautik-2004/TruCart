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
} from "lucide-react"
import { createServerClient } from "../../../lib/supabase-server"

export const dynamic = "force-dynamic"

export default async function PricingPage() {
  const supabase = createServerClient()

  const [productsResult, priceHistoryResult, competitorResult] = await Promise.all([
    supabase.from("products").select("product_id, sku, name, current_price, base_price, status"),
    supabase.from("price_history").select("product_id, old_price, new_price, change_reason, changed_by, created_at").order("created_at", { ascending: false }).limit(20),
    supabase.from("competitor_prices").select("product_id, competitor_name, competitor_price, detected_at").order("detected_at", { ascending: false }),
  ])

  const products = productsResult.data || []
  const priceHistory = priceHistoryResult.data || []
  const competitors = competitorResult.data || []

  const prices = products.map(p => Number(p.current_price)).filter(p => p > 0)
  const avgPrice = prices.length > 0 ? prices.reduce((a, b) => a + b, 0) / prices.length : 0

  const increases = priceHistory.filter(h => Number(h.new_price) > Number(h.old_price)).length
  const decreases = priceHistory.filter(h => Number(h.new_price) < Number(h.old_price)).length

  const significantChanges = competitors.filter(cp => {
    const product = products.find(p => p.product_id === cp.product_id)
    if (!product) return false
    const diff = Math.abs(Number(cp.competitor_price) - Number(product.current_price)) / Number(product.current_price)
    return diff > 0.1
  }).length

  const pricingStats = [
    { title: "Avg Product Price", value: `₹${avgPrice.toFixed(2)}`, icon: DollarSign, change: `${products.length} products` },
    { title: "Price Increases", value: increases.toString(), icon: TrendingUp, change: "Auto-adjusted" },
    { title: "Price Decreases", value: decreases.toString(), icon: TrendingDown, change: "Competitive matching" },
    { title: "Price Alerts", value: significantChanges.toString(), icon: Target, change: `${significantChanges} critical` },
  ]

  const priceAdjustments = priceHistory
    .filter(h => h.old_price && h.new_price)
    .map(h => {
      const product = products.find(p => p.product_id === h.product_id)
      const oldP = Number(h.old_price)
      const newP = Number(h.new_price)
      const changePct = oldP > 0 ? ((newP - oldP) / oldP * 100) : 0
      return {
        product: product?.name || "Unknown",
        sku: product?.sku || "N/A",
        oldPrice: `₹${oldP.toFixed(2)}`,
        newPrice: `₹${newP.toFixed(2)}`,
        change: `${changePct >= 0 ? "+" : ""}${changePct.toFixed(1)}%`,
        reason: h.change_reason || "Price update",
        agent: h.changed_by || "pricing_agent",
        timestamp: h.created_at,
        isIncrease: changePct > 0,
      }
    })

  const productMap = new Map(products.map(p => [p.product_id, p]))
  const competitorMap = new Map<string, { ours: number; prices: Record<string, number> }>()
  for (const cp of competitors) {
    const product = productMap.get(cp.product_id)
    if (!product) continue
    if (!competitorMap.has(product.name)) {
      competitorMap.set(product.name, { ours: Number(product.current_price), prices: {} })
    }
    const entry = competitorMap.get(product.name)!
    entry.prices[cp.competitor_name || "Unknown"] = Number(cp.competitor_price)
  }
  const competitorPrices = Array.from(competitorMap.entries())
    .slice(0, 6)
    .map(([product, data]) => ({
      product: product.length > 30 ? product.substring(0, 30) + "..." : product,
      ours: `₹${data.ours.toFixed(2)}`,
      competitors: Object.entries(data.prices).slice(0, 3).map(([name, price]) => ({
        name,
        price: `₹${price.toFixed(2)}`,
      })),
    }))

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
            {priceAdjustments.length === 0 ? (
              <p className="text-sm text-muted-foreground text-center py-4">No price adjustments yet</p>
            ) : (
              priceAdjustments.map((item, index) => (
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
                      {item.agent} &middot; {new Date(item.timestamp).toLocaleDateString()}
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
                        item.isIncrease
                          ? "text-green-600 dark:text-green-400"
                          : "text-red-600 dark:text-red-400"
                      }`}
                    >
                      {item.change}
                    </span>
                  </div>
                </div>
              ))
            )}
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
                    {competitorPrices[0]?.competitors.map((_, i) => (
                      <th key={i} className="pb-2 text-left font-medium text-muted-foreground">Comp. {i + 1}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {competitorPrices.map((item) => (
                    <tr key={item.product} className="border-b last:border-0">
                      <td className="py-3 font-medium">{item.product}</td>
                      <td className="py-3 font-bold text-primary">{item.ours}</td>
                      {item.competitors.map((c, i) => (
                        <td key={i} className="py-3 text-muted-foreground">{c.price}</td>
                      ))}
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
