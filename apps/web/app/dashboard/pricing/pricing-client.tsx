"use client"

import { useState, useMemo } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Percent, TrendingDown, PackageX, History, Sparkles } from "lucide-react"

// Mirrors agent_config for pricing_agent (migration 014). Display only — the
// agent reads the authoritative values from the database at run time.
const TARGET_MARGIN_PCT = 30
const OVERSTOCK_COVER_DAYS = 60

interface Product { product_id: string; sku: string; name: string; current_price: number; cost_price: number; status: string }
interface PriceHistory { product_id: string; old_price: number; new_price: number; change_reason: string; changed_by: string; created_at: string }
interface InventoryRow { product_id: string; quantity_on_hand: number; quantity_reserved: number }
interface OrderItemRow { product_id: string; quantity: number }

export default function PricingClient({
  products,
  inventory,
  priceHistory,
  orderItems,
  demandWindowDays,
}: {
  products: Product[]
  inventory: InventoryRow[]
  priceHistory: PriceHistory[]
  orderItems: OrderItemRow[]
  demandWindowDays: number
}) {
  const router = useRouter()
  const [analyzing, setAnalyzing] = useState(false)
  const [toast, setToast] = useState<string | null>(null)

  const productMap = useMemo(() => new Map(products.map(p => [p.product_id, p])), [products])

  const stockOnHand = useMemo(() => {
    const m = new Map<string, number>()
    for (const r of inventory) {
      const avail = (Number(r.quantity_on_hand) || 0) - (Number(r.quantity_reserved) || 0)
      m.set(r.product_id, (m.get(r.product_id) || 0) + avail)
    }
    return m
  }, [inventory])

  const unitsSold = useMemo(() => {
    const m = new Map<string, number>()
    for (const r of orderItems) m.set(r.product_id, (m.get(r.product_id) || 0) + (Number(r.quantity) || 0))
    return m
  }, [orderItems])

  const lastChange = useMemo(() => {
    const m = new Map<string, string>()
    for (const h of priceHistory) if (!m.has(h.product_id)) m.set(h.product_id, h.created_at)
    return m
  }, [priceHistory])

  const rows = useMemo(() => {
    return products
      .map(p => {
        const price = Number(p.current_price) || 0
        const cost = Number(p.cost_price) || 0
        const marginPct = price > 0 ? ((price - cost) / price) * 100 : 0
        const onHand = Math.max(stockOnHand.get(p.product_id) || 0, 0)
        const sold = unitsSold.get(p.product_id) || 0
        const dailyVelocity = demandWindowDays > 0 ? sold / demandWindowDays : 0
        const daysOfCover = dailyVelocity > 0 ? onHand / dailyVelocity : null
        return { p, price, cost, marginPct, onHand, daysOfCover, last: lastChange.get(p.product_id) || null }
      })
      .filter(r => r.price > 0 && r.cost > 0)
  }, [products, stockOnHand, unitsSold, lastChange, demandWindowDays])

  const withMargin = rows.filter(r => Number.isFinite(r.marginPct))
  const avgMargin = withMargin.length > 0 ? withMargin.reduce((a, r) => a + r.marginPct, 0) / withMargin.length : 0
  const belowTarget = rows.filter(r => r.marginPct < TARGET_MARGIN_PCT).length
  const overstocked = rows.filter(r => r.daysOfCover !== null && r.daysOfCover > OVERSTOCK_COVER_DAYS).length

  const stats = [
    { title: "Avg Margin", value: `${avgMargin.toFixed(1)}%`, icon: Percent, change: `Target ${TARGET_MARGIN_PCT}%` },
    { title: "Below Target Margin", value: belowTarget.toString(), icon: TrendingDown, change: `of ${rows.length} priced products` },
    { title: "Overstocked", value: overstocked.toString(), icon: PackageX, change: `> ${OVERSTOCK_COVER_DAYS} days of cover` },
    { title: "Recent Adjustments", value: priceHistory.length.toString(), icon: History, change: "last 20 logged" },
  ]

  const adjustments = priceHistory.filter(h => h.old_price && h.new_price).map(h => {
    const product = productMap.get(h.product_id)
    const oldP = Number(h.old_price), newP = Number(h.new_price)
    const changePct = oldP > 0 ? ((newP - oldP) / oldP * 100) : 0
    return { product: product?.name || "Unknown", sku: product?.sku || "N/A", oldPrice: `₹${oldP.toFixed(2)}`, newPrice: `₹${newP.toFixed(2)}`, change: `${changePct >= 0 ? "+" : ""}${changePct.toFixed(1)}%`, reason: h.change_reason || "Price update", agent: h.changed_by || "pricing_agent", timestamp: h.created_at, isIncrease: changePct > 0 }
  })

  const tableRows = useMemo(
    () => [...rows].sort((a, b) => Math.abs(b.marginPct - TARGET_MARGIN_PCT) - Math.abs(a.marginPct - TARGET_MARGIN_PCT)).slice(0, 40),
    [rows],
  )

  async function handleRunAnalysis() {
    setAnalyzing(true)
    try {
      const res = await fetch("/api/agents/pricing_agent/run", { method: "POST" })
      const data = await res.json()
      if (!res.ok || data.status === "error") {
        setToast(`Price analysis failed: ${data.error || data.detail || "unknown error"}`)
      } else {
        const s = data.summary || {}
        setToast(`Price analysis complete — scanned ${s.scanned ?? 0}, auto-applied ${s.auto_executed ?? 0}, escalated ${s.escalated ?? 0}.`)
        router.refresh()
      }
    } catch (error) {
      setToast(`Price analysis failed: ${error instanceof Error ? error.message : "backend unreachable"}`)
    } finally {
      setAnalyzing(false)
      setTimeout(() => setToast(null), 5000)
    }
  }

  return (
    <div className="space-y-6">
      {toast && <div className="fixed top-4 right-4 z-50 rounded-lg bg-green-600 px-4 py-2 text-sm text-white shadow-lg">{toast}</div>}

      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Pricing</h2><p className="text-muted-foreground">Cost-basis and margin-driven repricing.</p></div>
        <Button onClick={handleRunAnalysis} disabled={analyzing}><Sparkles className="mr-2 size-4" />{analyzing ? "Analyzing..." : "Run Price Analysis"}</Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {stats.map(s => (
          <Card key={s.title}><CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2"><CardTitle className="text-sm font-medium">{s.title}</CardTitle><s.icon className="size-4 text-muted-foreground" /></CardHeader><CardContent><div className="text-2xl font-bold">{s.value}</div><p className="text-xs text-muted-foreground">{s.change}</p></CardContent></Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card>
          <CardHeader><CardTitle>Recent Price Adjustments</CardTitle><CardDescription>Logged price changes and their rationale</CardDescription></CardHeader>
          <CardContent className="space-y-4">
            {adjustments.length === 0 ? (<p className="text-sm text-muted-foreground text-center py-4">No price adjustments yet</p>)
            : adjustments.map((item, i) => (
              <div key={i} className="flex items-center justify-between rounded-lg border p-3">
                <div className="space-y-1">
                  <p className="font-medium text-sm">{item.product}</p>
                  <p className="text-xs text-muted-foreground">{item.sku} · {item.reason}</p>
                  <p className="text-xs text-muted-foreground">{item.agent} · {new Date(item.timestamp).toLocaleDateString()}</p>
                </div>
                <div className="text-right">
                  <div className="flex items-center gap-2 text-sm"><span className="text-muted-foreground line-through">{item.oldPrice}</span><span className="font-medium">{item.newPrice}</span></div>
                  <span className={`text-xs font-medium ${item.isIncrease ? "text-green-600 dark:text-green-400" : "text-red-600 dark:text-red-400"}`}>{item.change}</span>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>

        <Card>
          <CardHeader><CardTitle>Margin &amp; Stock Cover</CardTitle><CardDescription>Priced products furthest from the {TARGET_MARGIN_PCT}% target margin</CardDescription></CardHeader>
          <CardContent>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead><tr className="border-b">
                  <th className="pb-2 text-left font-medium text-muted-foreground">SKU</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Unit Cost</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Price</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Margin</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Days Cover</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Last Change</th>
                </tr></thead>
                <tbody>
                  {tableRows.length === 0 ? (<tr><td colSpan={7} className="py-4 text-center text-muted-foreground">No priced products</td></tr>)
                  : tableRows.map(r => (
                    <tr key={r.p.product_id} className="border-b last:border-0">
                      <td className="py-3 font-mono text-xs">{r.p.sku}</td>
                      <td className="py-3 font-medium">{r.p.name.length > 28 ? r.p.name.substring(0, 28) + "…" : r.p.name}</td>
                      <td className="py-3 text-right text-muted-foreground">₹{r.cost.toFixed(2)}</td>
                      <td className="py-3 text-right font-bold text-primary">₹{r.price.toFixed(2)}</td>
                      <td className={`py-3 text-right font-medium ${r.marginPct < TARGET_MARGIN_PCT ? "text-red-600 dark:text-red-400" : "text-green-600 dark:text-green-400"}`}>{r.marginPct.toFixed(1)}%</td>
                      <td className="py-3 text-right text-muted-foreground">{r.daysOfCover === null ? "—" : Math.round(r.daysOfCover)}</td>
                      <td className="py-3 text-right text-muted-foreground">{r.last ? new Date(r.last).toLocaleDateString() : "—"}</td>
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
