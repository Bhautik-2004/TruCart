"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { CreditCard, MessageCircle, ShoppingBag, Wallet, Loader2, CheckCircle2, AlertCircle } from "lucide-react"

interface ProviderStatus {
  provider: string
  configured: boolean
  missing_env: string[]
}

interface StatusResponse {
  stripe: ProviderStatus
  razorpay: ProviderStatus
  whatsapp: ProviderStatus
  shopify: ProviderStatus
}

function ConfigBadge({ configured }: { configured: boolean }) {
  return configured ? (
    <span className="flex items-center gap-1 rounded-full bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200 px-2 py-0.5 text-xs font-medium">
      <CheckCircle2 className="size-3" />Connected
    </span>
  ) : (
    <span className="flex items-center gap-1 rounded-full bg-amber-100 text-amber-800 dark:bg-amber-900 dark:text-amber-200 px-2 py-0.5 text-xs font-medium">
      <AlertCircle className="size-3" />Not configured
    </span>
  )
}

function MissingEnvNotice({ missing }: { missing: string[] }) {
  return (
    <p className="text-xs text-muted-foreground">
      Add <code className="rounded bg-muted px-1 py-0.5">{missing.join(", ")}</code> to <code className="rounded bg-muted px-1 py-0.5">.env.local</code> to enable this feature.
    </p>
  )
}

export default function IntegrationsClient({ status, backendDown }: { status: StatusResponse | null; backendDown: boolean }) {
  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Integrations</h2>
        <p className="text-muted-foreground">Connect external payment, messaging, and e-commerce platforms.</p>
      </div>

      {backendDown && (
        <Card className="border-destructive/50">
          <CardContent className="py-4 text-sm text-destructive">Backend is unreachable — cannot check integration status.</CardContent>
        </Card>
      )}

      {status && (
        <div className="grid gap-4 md:grid-cols-2">
          <StripeCard data={status.stripe} />
          <RazorpayCard data={status.razorpay} />
          <WhatsAppCard data={status.whatsapp} />
          <ShopifyCard data={status.shopify} />
        </div>
      )}
    </div>
  )
}

function StripeCard({ data }: { data: ProviderStatus }) {
  const [loading, setLoading] = useState(false)
  const [payments, setPayments] = useState<any[] | null>(null)

  async function fetchPayments() {
    setLoading(true)
    try {
      const res = await fetch("/api/integrations/payments/stripe")
      const json = await res.json()
      setPayments(res.ok ? json.payments : [])
    } catch {
      setPayments([])
    }
    setLoading(false)
  }

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div className="flex items-center gap-2"><CreditCard className="size-4" /><CardTitle className="text-base">Stripe</CardTitle></div>
        <ConfigBadge configured={data.configured} />
      </CardHeader>
      <CardContent className="space-y-3">
        <CardDescription>Payment processing and recent charges.</CardDescription>
        {!data.configured ? (
          <MissingEnvNotice missing={data.missing_env} />
        ) : (
          <>
            <Button size="sm" variant="outline" onClick={fetchPayments} disabled={loading}>
              {loading ? <Loader2 className="size-4 animate-spin" /> : "Fetch recent payments"}
            </Button>
            {payments && (
              <p className="text-xs text-muted-foreground">{payments.length} recent charge(s) found.</p>
            )}
          </>
        )}
      </CardContent>
    </Card>
  )
}

function RazorpayCard({ data }: { data: ProviderStatus }) {
  const [loading, setLoading] = useState(false)
  const [payments, setPayments] = useState<any[] | null>(null)

  async function fetchPayments() {
    setLoading(true)
    try {
      const res = await fetch("/api/integrations/payments/razorpay")
      const json = await res.json()
      setPayments(res.ok ? json.payments : [])
    } catch {
      setPayments([])
    }
    setLoading(false)
  }

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div className="flex items-center gap-2"><Wallet className="size-4" /><CardTitle className="text-base">Razorpay</CardTitle></div>
        <ConfigBadge configured={data.configured} />
      </CardHeader>
      <CardContent className="space-y-3">
        <CardDescription>Indian payments gateway — recent transactions.</CardDescription>
        {!data.configured ? (
          <MissingEnvNotice missing={data.missing_env} />
        ) : (
          <>
            <Button size="sm" variant="outline" onClick={fetchPayments} disabled={loading}>
              {loading ? <Loader2 className="size-4 animate-spin" /> : "Fetch recent payments"}
            </Button>
            {payments && (
              <p className="text-xs text-muted-foreground">{payments.length} recent payment(s) found.</p>
            )}
          </>
        )}
      </CardContent>
    </Card>
  )
}

function WhatsAppCard({ data }: { data: ProviderStatus }) {
  const [phone, setPhone] = useState("")
  const [orderNumber, setOrderNumber] = useState("")
  const [sending, setSending] = useState(false)
  const [result, setResult] = useState<string | null>(null)

  async function send() {
    if (!phone.trim() || !orderNumber.trim()) return
    setSending(true)
    setResult(null)
    try {
      const res = await fetch("/api/integrations/whatsapp/order-update", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ to_phone: phone, order_number: orderNumber, status: "shipped" }),
      })
      setResult(res.ok ? "Message sent." : "Failed to send.")
    } catch {
      setResult("Failed to send.")
    }
    setSending(false)
  }

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div className="flex items-center gap-2"><MessageCircle className="size-4" /><CardTitle className="text-base">WhatsApp Business</CardTitle></div>
        <ConfigBadge configured={data.configured} />
      </CardHeader>
      <CardContent className="space-y-3">
        <CardDescription>Send order-update messages via Twilio&apos;s WhatsApp API.</CardDescription>
        {!data.configured ? (
          <MissingEnvNotice missing={data.missing_env} />
        ) : (
          <>
            <div className="flex gap-2">
              <Input placeholder="+91XXXXXXXXXX" value={phone} onChange={(e) => setPhone(e.target.value)} />
              <Input placeholder="Order #" value={orderNumber} onChange={(e) => setOrderNumber(e.target.value)} />
            </div>
            <Button size="sm" onClick={send} disabled={sending}>
              {sending ? <Loader2 className="size-4 animate-spin" /> : "Send test update"}
            </Button>
            {result && <p className="text-xs text-muted-foreground">{result}</p>}
          </>
        )}
      </CardContent>
    </Card>
  )
}

function ShopifyCard({ data }: { data: ProviderStatus }) {
  const [loading, setLoading] = useState(false)
  const [products, setProducts] = useState<any[] | null>(null)

  async function fetchProducts() {
    setLoading(true)
    try {
      const res = await fetch("/api/integrations/shopify/products")
      const json = await res.json()
      setProducts(res.ok ? json.products : [])
    } catch {
      setProducts([])
    }
    setLoading(false)
  }

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div className="flex items-center gap-2"><ShoppingBag className="size-4" /><CardTitle className="text-base">Shopify</CardTitle></div>
        <ConfigBadge configured={data.configured} />
      </CardHeader>
      <CardContent className="space-y-3">
        <CardDescription>Sync products and orders from a connected Shopify store.</CardDescription>
        {!data.configured ? (
          <MissingEnvNotice missing={data.missing_env} />
        ) : (
          <>
            <Button size="sm" variant="outline" onClick={fetchProducts} disabled={loading}>
              {loading ? <Loader2 className="size-4 animate-spin" /> : "Fetch products"}
            </Button>
            {products && (
              <p className="text-xs text-muted-foreground">{products.length} product(s) found.</p>
            )}
          </>
        )}
      </CardContent>
    </Card>
  )
}
