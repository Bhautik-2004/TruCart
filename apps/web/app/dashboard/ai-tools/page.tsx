import { createServerClient } from "../../../lib/supabase-server"
import AiToolsClient from "./ai-tools-client"

export const dynamic = "force-dynamic"

const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

async function getJson(path: string) {
  try {
    const res = await fetch(`${API}${path}`, { cache: "no-store", signal: AbortSignal.timeout(4000) })
    return res.ok ? await res.json() : null
  } catch {
    return null
  }
}

export default async function AiToolsPage() {
  const supabase = createServerClient()

  const [reportHistory, { data: tickets }, { data: reviews }] = await Promise.all([
    getJson("/api/ai-tools/report?limit=10"),
    supabase
      .from("support_tickets")
      .select("ticket_id, subject, status, priority, sentiment_label, sentiment_score, sentiment_summary, sentiment_analyzed_at, created_at")
      .order("created_at", { ascending: false })
      .limit(30),
    supabase
      .from("product_reviews")
      .select("review_id, product_id, rating, body, sentiment_label, sentiment_score, sentiment_summary, sentiment_analyzed_at, created_at, products(name, sku)")
      .order("created_at", { ascending: false })
      .limit(50),
  ])

  return (
    <AiToolsClient
      reports={reportHistory?.reports ?? []}
      tickets={tickets ?? []}
      reviews={(reviews ?? []) as unknown as Parameters<typeof AiToolsClient>[0]["reviews"]}
      backendDown={reportHistory === null}
    />
  )
}
