"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { MessageCircle, FileText, Smile, Sparkles, Loader2, Star } from "lucide-react"
import { CopilotChat } from "../components/copilot-chat"

interface Ticket {
  ticket_id: string
  subject: string
  status: string
  priority: string
  sentiment_label: string | null
  sentiment_score: number | null
  sentiment_summary: string | null
  sentiment_analyzed_at: string | null
  created_at: string
}

interface ReportSummary {
  report_id: string
  period: string
  focus: string | null
  title: string
  created_at: string
}

interface Review {
  review_id: string
  product_id: string
  rating: number
  body: string
  sentiment_label: string | null
  sentiment_score: number | null
  sentiment_summary: string | null
  sentiment_analyzed_at: string | null
  created_at: string
  products?: { name: string; sku: string }
}

const SENTIMENT_STYLES: Record<string, string> = {
  positive: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  neutral: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
  negative: "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200",
}

const TABS = [
  { id: "chat", label: "Chat Assistant", icon: MessageCircle },
  { id: "reports", label: "AI Reports", icon: FileText },
  { id: "sentiment", label: "Ticket Sentiment", icon: Smile },
  { id: "reviews", label: "Product Reviews", icon: Star },
] as const

export default function AiToolsClient({
  reports,
  tickets,
  reviews,
  backendDown,
}: {
  reports: ReportSummary[]
  tickets: Ticket[]
  reviews: Review[]
  backendDown: boolean
}) {
  const [tab, setTab] = useState<(typeof TABS)[number]["id"]>("chat")

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">AI Enhancements</h2>
        <p className="text-muted-foreground">Chatbot, AI-generated reports, and ticket sentiment analysis.</p>
      </div>

      {backendDown && (
        <Card className="border-destructive/50">
          <CardContent className="py-4 text-sm text-destructive">
            Backend is unreachable — AI tools need the FastAPI service (and a local Ollama model) running.
          </CardContent>
        </Card>
      )}

      <div className="flex gap-2 border-b">
        {TABS.map((t) => (
          <button
            key={t.id}
            onClick={() => setTab(t.id)}
            className={`flex items-center gap-2 px-3 py-2 text-sm font-medium border-b-2 -mb-px transition-colors ${
              tab === t.id ? "border-primary text-foreground" : "border-transparent text-muted-foreground hover:text-foreground"
            }`}
          >
            <t.icon className="size-4" />
            {t.label}
          </button>
        ))}
      </div>

      {tab === "chat" && <ChatPanel />}
      {tab === "reports" && <ReportsPanel initialReports={reports} />}
      {tab === "sentiment" && <SentimentPanel initialTickets={tickets} />}
      {tab === "reviews" && <ReviewsPanel initialReviews={reviews} />}
    </div>
  )
}

function ChatPanel() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Chat Copilot</CardTitle>
        <CardDescription>Ask questions about your store, or ask it to run an agent / generate a report (needs your confirmation first).</CardDescription>
      </CardHeader>
      <CardContent>
        <CopilotChat />
      </CardContent>
    </Card>
  )
}

function ReportsPanel({ initialReports }: { initialReports: ReportSummary[] }) {
  const [reports, setReports] = useState(initialReports)
  const [period, setPeriod] = useState<"today" | "week" | "month">("week")
  const [focus, setFocus] = useState("")
  const [generating, setGenerating] = useState(false)
  const [current, setCurrent] = useState<{ title: string; content_md: string } | null>(null)

  async function generate() {
    setGenerating(true)
    try {
      const res = await fetch("/api/ai-tools/report", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ period, focus: focus.trim() || undefined }),
      })
      const data = await res.json()
      if (data.content_md) {
        setCurrent({ title: data.title, content_md: data.content_md })
        setReports((r) => [{ report_id: data.report_id, period: data.period, focus: data.focus, title: data.title, created_at: new Date().toISOString() }, ...r])
      }
    } catch {
      setCurrent({ title: "Error", content_md: "Failed to generate report." })
    }
    setGenerating(false)
  }

  return (
    <div className="grid gap-6 lg:grid-cols-3">
      <Card className="lg:col-span-1">
        <CardHeader>
          <CardTitle>Generate Report</CardTitle>
          <CardDescription>AI writes a prose summary from live store metrics.</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <label className="text-sm font-medium">Period</label>
            <div className="flex gap-2">
              {(["today", "week", "month"] as const).map((p) => (
                <Button key={p} variant={period === p ? "default" : "outline"} size="sm" onClick={() => setPeriod(p)}>
                  {p}
                </Button>
              ))}
            </div>
          </div>
          <div className="space-y-2">
            <label className="text-sm font-medium">Focus (optional)</label>
            <Input placeholder="e.g. inventory risk, customer satisfaction" value={focus} onChange={(e) => setFocus(e.target.value)} />
          </div>
          <Button onClick={generate} disabled={generating} className="w-full">
            {generating ? <><Loader2 className="mr-2 size-4 animate-spin" />Generating…</> : <><Sparkles className="mr-2 size-4" />Generate Report</>}
          </Button>

          <div className="pt-2 space-y-2">
            <p className="text-xs font-medium text-muted-foreground">Recent reports</p>
            {reports.length === 0 && <p className="text-xs text-muted-foreground">No reports generated yet.</p>}
            {reports.map((r) => (
              <div key={r.report_id} className="text-xs rounded border px-2 py-1.5">
                <div className="font-medium">{r.title}</div>
                <div className="text-muted-foreground">{r.period} · {new Date(r.created_at).toLocaleString()}</div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      <Card className="lg:col-span-2">
        <CardHeader><CardTitle>{current?.title || "Report Preview"}</CardTitle></CardHeader>
        <CardContent>
          {current ? (
            <div className="whitespace-pre-wrap text-sm leading-relaxed">{current.content_md}</div>
          ) : (
            <p className="text-sm text-muted-foreground">Generate a report to see it here.</p>
          )}
        </CardContent>
      </Card>
    </div>
  )
}

function SentimentPanel({ initialTickets }: { initialTickets: Ticket[] }) {
  const [tickets, setTickets] = useState(initialTickets)
  const [analyzingAll, setAnalyzingAll] = useState(false)
  const [analyzingOne, setAnalyzingOne] = useState<string | null>(null)

  async function analyzeOne(ticketId: string) {
    setAnalyzingOne(ticketId)
    try {
      const res = await fetch(`/api/ai-tools/sentiment/${ticketId}`, { method: "POST" })
      const data = await res.json()
      setTickets((ts) => ts.map((t) => (t.ticket_id === ticketId ? { ...t, ...data } : t)))
    } catch {
      // best-effort
    }
    setAnalyzingOne(null)
  }

  async function analyzeAll() {
    setAnalyzingAll(true)
    try {
      const res = await fetch("/api/ai-tools/sentiment/bulk", { method: "POST" })
      const data = await res.json()
      const byId: Record<string, any> = {}
      for (const r of data.results || []) byId[r.ticket_id] = r
      setTickets((ts) => ts.map((t) => (byId[t.ticket_id] ? { ...t, ...byId[t.ticket_id] } : t)))
    } catch {
      // best-effort
    }
    setAnalyzingAll(false)
  }

  const breakdown = tickets.reduce(
    (acc, t) => {
      const label = t.sentiment_label && t.sentiment_label in acc ? t.sentiment_label : null
      if (label) acc[label as keyof typeof acc] += 1
      return acc
    },
    { positive: 0, neutral: 0, negative: 0 }
  )

  return (
    <Card>
      <CardHeader className="flex flex-row items-center justify-between">
        <div>
          <CardTitle>Ticket Sentiment Analysis</CardTitle>
          <CardDescription>
            {breakdown.positive} positive · {breakdown.neutral} neutral · {breakdown.negative} negative (of {tickets.length} recent tickets)
          </CardDescription>
        </div>
        <Button onClick={analyzeAll} disabled={analyzingAll} size="sm">
          {analyzingAll ? <><Loader2 className="mr-2 size-4 animate-spin" />Analyzing…</> : "Bulk Analyze Unscored"}
        </Button>
      </CardHeader>
      <CardContent>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b">
                <th className="pb-2 text-left font-medium text-muted-foreground">Ticket</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Priority</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Sentiment</th>
                <th className="pb-2 text-left font-medium text-muted-foreground">Summary</th>
                <th className="pb-2 text-right font-medium text-muted-foreground">Action</th>
              </tr>
            </thead>
            <tbody>
              {tickets.length === 0 ? (
                <tr><td colSpan={5} className="py-8 text-center text-muted-foreground">No tickets found</td></tr>
              ) : (
                tickets.map((t) => (
                  <tr key={t.ticket_id} className="border-b last:border-0">
                    <td className="py-3 font-medium">{t.subject}</td>
                    <td className="py-3 text-muted-foreground">{t.priority}</td>
                    <td className="py-3">
                      {t.sentiment_label ? (
                        <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${SENTIMENT_STYLES[t.sentiment_label] || SENTIMENT_STYLES.neutral}`}>
                          {t.sentiment_label} {t.sentiment_score !== null ? `(${t.sentiment_score.toFixed(2)})` : ""}
                        </span>
                      ) : (
                        <span className="text-xs text-muted-foreground">Not analyzed</span>
                      )}
                    </td>
                    <td className="py-3 text-muted-foreground max-w-xs truncate">{t.sentiment_summary || "—"}</td>
                    <td className="py-3 text-right">
                      <Button variant="ghost" size="sm" onClick={() => analyzeOne(t.ticket_id)} disabled={analyzingOne === t.ticket_id}>
                        {analyzingOne === t.ticket_id ? <Loader2 className="size-3 animate-spin" /> : "Analyze"}
                      </Button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </CardContent>
    </Card>
  )
}

function ReviewsPanel({ initialReviews }: { initialReviews: Review[] }) {
  const [reviews, setReviews] = useState(initialReviews)
  const [analyzingAll, setAnalyzingAll] = useState(false)
  const [analyzingOne, setAnalyzingOne] = useState<string | null>(null)
  const [summaryProductId, setSummaryProductId] = useState<string | null>(null)
  const [summary, setSummary] = useState<{ summary: string; review_count: number; average_rating: number | null } | null>(null)
  const [summarizing, setSummarizing] = useState(false)

  async function analyzeOne(reviewId: string) {
    setAnalyzingOne(reviewId)
    try {
      const res = await fetch(`/api/ai-tools/reviews/sentiment/${reviewId}`, { method: "POST" })
      const data = await res.json()
      setReviews((rs) => rs.map((r) => (r.review_id === reviewId ? { ...r, ...data } : r)))
    } catch {
      // best-effort
    }
    setAnalyzingOne(null)
  }

  async function analyzeAll() {
    setAnalyzingAll(true)
    try {
      const res = await fetch("/api/ai-tools/reviews/sentiment/bulk", { method: "POST" })
      const data = await res.json()
      const byId: Record<string, any> = {}
      for (const r of data.results || []) byId[r.review_id] = r
      setReviews((rs) => rs.map((r) => (byId[r.review_id] ? { ...r, ...byId[r.review_id] } : r)))
    } catch {
      // best-effort
    }
    setAnalyzingAll(false)
  }

  async function viewSummary(productId: string) {
    setSummaryProductId(productId)
    setSummarizing(true)
    setSummary(null)
    try {
      const res = await fetch(`/api/ai-tools/reviews/summary/${productId}`)
      const data = await res.json()
      setSummary(data)
    } catch {
      setSummary({ summary: "Failed to load summary.", review_count: 0, average_rating: null })
    }
    setSummarizing(false)
  }

  const breakdown = reviews.reduce(
    (acc, r) => {
      if (r.sentiment_label && r.sentiment_label in acc) acc[r.sentiment_label as keyof typeof acc] += 1
      return acc
    },
    { positive: 0, neutral: 0, negative: 0 }
  )

  return (
    <div className="grid gap-6 lg:grid-cols-3">
      <Card className="lg:col-span-2">
        <CardHeader className="flex flex-row items-center justify-between">
          <div>
            <CardTitle>Product Review Sentiment</CardTitle>
            <CardDescription>
              {breakdown.positive} positive · {breakdown.neutral} neutral · {breakdown.negative} negative (of {reviews.length} recent reviews)
            </CardDescription>
          </div>
          <Button onClick={analyzeAll} disabled={analyzingAll} size="sm">
            {analyzingAll ? <><Loader2 className="mr-2 size-4 animate-spin" />Analyzing…</> : "Bulk Analyze Unscored"}
          </Button>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="pb-2 text-left font-medium text-muted-foreground">Product</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Rating</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Sentiment</th>
                  <th className="pb-2 text-left font-medium text-muted-foreground">Review</th>
                  <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                </tr>
              </thead>
              <tbody>
                {reviews.length === 0 ? (
                  <tr><td colSpan={5} className="py-8 text-center text-muted-foreground">No reviews found</td></tr>
                ) : (
                  reviews.map((r) => (
                    <tr key={r.review_id} className="border-b last:border-0">
                      <td className="py-3 font-medium">
                        <button className="hover:underline text-left" onClick={() => viewSummary(r.product_id)}>
                          {r.products?.name || "—"}
                        </button>
                      </td>
                      <td className="py-3 text-muted-foreground">{"★".repeat(r.rating)}{"☆".repeat(5 - r.rating)}</td>
                      <td className="py-3">
                        {r.sentiment_label ? (
                          <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${SENTIMENT_STYLES[r.sentiment_label] || SENTIMENT_STYLES.neutral}`}>
                            {r.sentiment_label} {r.sentiment_score !== null ? `(${r.sentiment_score.toFixed(2)})` : ""}
                          </span>
                        ) : (
                          <span className="text-xs text-muted-foreground">Not analyzed</span>
                        )}
                      </td>
                      <td className="py-3 text-muted-foreground max-w-xs truncate">{r.body}</td>
                      <td className="py-3 text-right">
                        <Button variant="ghost" size="sm" onClick={() => analyzeOne(r.review_id)} disabled={analyzingOne === r.review_id}>
                          {analyzingOne === r.review_id ? <Loader2 className="size-3 animate-spin" /> : "Analyze"}
                        </Button>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader><CardTitle>AI Product Summary</CardTitle><CardDescription>Click a product name to summarize its reviews.</CardDescription></CardHeader>
        <CardContent>
          {!summaryProductId && <p className="text-sm text-muted-foreground">No product selected.</p>}
          {summarizing && (
            <div className="flex items-center gap-2 text-sm text-muted-foreground"><Loader2 className="size-4 animate-spin" />Summarizing…</div>
          )}
          {!summarizing && summary && (
            <div className="space-y-2 text-sm">
              {summary.average_rating !== null && (
                <p className="text-xs text-muted-foreground">Average rating: {summary.average_rating.toFixed(1)} / 5 · {summary.review_count} review(s)</p>
              )}
              <p className="leading-relaxed">{summary.summary}</p>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
