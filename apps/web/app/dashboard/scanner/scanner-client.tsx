"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { PackageSearch, Loader2 } from "lucide-react"
import { BarcodeScanner } from "../components/barcode-scanner"

type LookupResult =
  | { type: "order"; order: any; items: any[]; shipment: any }
  | { type: "shipment"; shipment: any }
  | { type: "product"; product: any; inventory: any[] }
  | { type: "not_found" }
  | { type: "error"; message: string }

export default function ScannerClient() {
  const [loading, setLoading] = useState(false)
  const [lastCode, setLastCode] = useState<string | null>(null)
  const [result, setResult] = useState<LookupResult | null>(null)

  async function handleDetect(code: string) {
    setLastCode(code)
    setLoading(true)
    try {
      const res = await fetch(`/api/lookup?code=${encodeURIComponent(code)}`)
      const data = await res.json()
      setResult(res.ok ? data : { type: "not_found" })
    } catch (e) {
      setResult({ type: "error", message: e instanceof Error ? e.message : "Lookup failed" })
    }
    setLoading(false)
  }

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Barcode / Order Tracking</h2>
        <p className="text-muted-foreground">Scan a barcode/QR code, or type an order number, tracking number, or SKU.</p>
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>Scan or Enter a Code</CardTitle>
            <CardDescription>Works with product SKUs, order numbers, and shipment tracking numbers.</CardDescription>
          </CardHeader>
          <CardContent>
            <BarcodeScanner onDetect={handleDetect} />
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Result</CardTitle>
            {lastCode && <CardDescription>Looked up: {lastCode}</CardDescription>}
          </CardHeader>
          <CardContent>
            {loading && (
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <Loader2 className="size-4 animate-spin" />Looking up…
              </div>
            )}
            {!loading && !result && (
              <div className="flex flex-col items-center justify-center py-12 text-muted-foreground gap-2">
                <PackageSearch className="size-10" />
                <p className="text-sm">No lookup yet</p>
              </div>
            )}
            {!loading && result?.type === "not_found" && (
              <p className="text-sm text-muted-foreground">No order, shipment, or product matched that code.</p>
            )}
            {!loading && result?.type === "error" && (
              <p className="text-sm text-destructive">{result.message}</p>
            )}
            {!loading && result?.type === "order" && <OrderResult data={result} />}
            {!loading && result?.type === "shipment" && <ShipmentResult data={result} />}
            {!loading && result?.type === "product" && <ProductResult data={result} />}
          </CardContent>
        </Card>
      </div>
    </div>
  )
}

function Field({ label, value }: { label: string; value: React.ReactNode }) {
  return (
    <div className="flex justify-between text-sm py-1 border-b last:border-0">
      <span className="text-muted-foreground">{label}</span>
      <span className="font-medium">{value}</span>
    </div>
  )
}

function OrderResult({ data }: { data: Extract<LookupResult, { type: "order" }> }) {
  const { order, items, shipment } = data
  return (
    <div className="space-y-4">
      <div>
        <Field label="Order #" value={order.order_number} />
        <Field label="Customer" value={order.customers?.full_name || "—"} />
        <Field label="Status" value={order.status} />
        <Field label="Payment" value={order.payment_status} />
        <Field label="Total" value={`₹${Number(order.total_amount).toFixed(2)}`} />
        <Field label="Placed" value={new Date(order.placed_at).toLocaleString()} />
      </div>
      {shipment && (
        <div>
          <p className="text-xs font-medium text-muted-foreground mb-1">Shipment</p>
          <Field label="Carrier" value={shipment.carrier || "—"} />
          <Field label="Tracking #" value={shipment.tracking_number || "—"} />
          <Field label="Status" value={shipment.status} />
          <Field label="Est. delivery" value={shipment.estimated_delivery || "—"} />
        </div>
      )}
      <div>
        <p className="text-xs font-medium text-muted-foreground mb-1">Items</p>
        {items.map((it, i) => (
          <Field key={i} label={`${it.products?.name} (${it.products?.sku})`} value={`x${it.quantity} · ₹${Number(it.total_price).toFixed(2)}`} />
        ))}
      </div>
    </div>
  )
}

function ShipmentResult({ data }: { data: Extract<LookupResult, { type: "shipment" }> }) {
  const s = data.shipment
  return (
    <div>
      <Field label="Order #" value={s.orders?.order_number || "—"} />
      <Field label="Carrier" value={s.carrier || "—"} />
      <Field label="Tracking #" value={s.tracking_number || "—"} />
      <Field label="Status" value={s.status} />
      <Field label="Shipped" value={s.shipped_at ? new Date(s.shipped_at).toLocaleString() : "—"} />
      <Field label="Delivered" value={s.delivered_at ? new Date(s.delivered_at).toLocaleString() : "—"} />
      <Field label="Est. delivery" value={s.estimated_delivery || "—"} />
    </div>
  )
}

function ProductResult({ data }: { data: Extract<LookupResult, { type: "product" }> }) {
  const { product, inventory } = data
  const totalAvailable = inventory.reduce((sum: number, i: any) => sum + (i.quantity_available || 0), 0)
  const lowStock = inventory.some((i: any) => (i.quantity_available || 0) <= (i.reorder_point || 0))
  return (
    <div className="space-y-3">
      <div>
        <Field label="SKU" value={product.sku} />
        <Field label="Name" value={product.name} />
        <Field label="Category" value={product.category || "—"} />
        <Field label="Price" value={`₹${Number(product.current_price).toFixed(2)}`} />
        <Field label="Total available" value={totalAvailable} />
        {lowStock && <p className="text-xs text-amber-600 dark:text-amber-400 pt-1">Below reorder point in at least one warehouse — check Inventory to raise a restock.</p>}
      </div>
      <div>
        <p className="text-xs font-medium text-muted-foreground mb-1">By warehouse</p>
        {inventory.map((i: any, idx: number) => (
          <Field key={idx} label={i.warehouses?.name || "—"} value={`${i.quantity_available} available`} />
        ))}
      </div>
    </div>
  )
}
