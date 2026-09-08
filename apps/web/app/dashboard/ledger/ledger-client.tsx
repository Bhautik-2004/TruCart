"use client"

import { useMemo, useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Gauge, TrendingUp, RefreshCw, Loader2 } from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"

interface AgentCard {
  agent_name: string; verified: number; pending: number
  wins: number; losses: number; neutral: number; win_rate: number
  realized_delta_30d_inr: number; realized_delta_90d_inr: number
  median_calibration_error_inr: number; trust_score: number
}
interface Summary {
  headline: { measured_30d: number; estimated_30d: number; measured_90d: number; estimated_90d: number }
  agents: AgentCard[]
  total_actions: number
}
interface Action {
  action_id: string; agent_name: string; action_type: string; entity_id: string | null
  decision: Record<string, unknown> | null; baseline: Record<string, unknown> | null
  outcome: Record<string, unknown> | null
  autonomy: string; measurability: string; status: string; grade: string | null
  realized_delta_inr: number | null; baseline_delta_inr: number | null; calibration_error: number | null
  created_at: string; verified_at: string | null; verify_after: string
}

const names: Record<string, string> = {
  pricing_agent: "Pricing", inventory_agent: "Inventory", marketing_agent: "Marketing", support_agent: "Support",
}
const inr = (n: number | null | undefined) =>
  (n ?? 0) < 0 ? `-₹${Math.abs(n ?? 0).toLocaleString("en-IN", { maximumFractionDigits: 0 })}`
               : `₹${(n ?? 0).toLocaleString("en-IN", { maximumFractionDigits: 0 })}`
const gradeColor: Record<string, string> = {
  win: "text-green-600 dark:text-green-400", loss: "text-red-600 dark:text-red-400",
  neutral: "text-muted-foreground", unmeasurable: "text-muted-foreground",
}
function trustColor(s: number) {
  if (s >= 70) return "bg-green-500"
  if (s >= 45) return "bg-yellow-500"
  return "bg-red-500"
}

export default function LedgerClient({ summary, actions, backendDown }: { summary: Summary | null; actions: Action[]; backendDown: boolean }) {
  const router = useRouter()
  const [verifying, setVerifying] = useState(false)
  const [toast, setToast] = useState<string | null>(null)
  const [agentFilter, setAgentFilter] = useState("all")
  const [gradeFilter, setGradeFilter] = useState("all")
  const [selected, setSelected] = useState<Action | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  async function runVerify() {
    setVerifying(true)
    try {
      const res = await fetch("/api/ledger/verify", { method: "POST" })
      const data = await res.json()
      setToast(res.ok
        ? `Swept ${data.due ?? 0} due · ${data.verified ?? 0} verified · ${data.autonomy_proposals ?? 0} autonomy proposal(s)`
        : `Verification failed: ${data.error ?? "unknown"}`)
      router.refresh()
    } catch (e) {
      setToast(e instanceof Error ? e.message : "Verification failed")
    } finally {
      setVerifying(false)
      setTimeout(() => setToast(null), 6000)
    }
  }

  const net30 = (summary?.headline.measured_30d ?? 0) + (summary?.headline.estimated_30d ?? 0)
  const net90 = (summary?.headline.measured_90d ?? 0) + (summary?.headline.estimated_90d ?? 0)

  const filtered = useMemo(() => actions.filter(a =>
    (agentFilter === "all" || a.agent_name === agentFilter) &&
    (gradeFilter === "all" || (a.grade ?? "pending") === gradeFilter)
  ), [actions, agentFilter, gradeFilter])

  if (backendDown) {
    return (
      <div className="space-y-4">
        <h2 className="text-2xl font-bold tracking-tight">Autopilot Ledger</h2>
        <Card><CardContent className="py-10 text-center text-sm text-muted-foreground">
          The agent backend is unreachable, so verified-outcome data can&apos;t be loaded right now.
        </CardContent></Card>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {toast && <div className="fixed top-4 right-4 z-50 rounded-lg bg-slate-800 px-4 py-2 text-sm text-white shadow-lg">{toast}</div>}

      <div className="flex items-start justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Autopilot Ledger</h2>
          <p className="text-muted-foreground">Every autonomous decision, scored against the &quot;do nothing&quot; baseline once its outcome is in.</p>
        </div>
        <Button variant="outline" onClick={runVerify} disabled={verifying}>
          {verifying ? <Loader2 className="mr-2 size-4 animate-spin" /> : <RefreshCw className="mr-2 size-4" />}
          {verifying ? "Verifying..." : "Run verification now"}
        </Button>
      </div>

      {/* headline */}
      <div className="grid gap-4 md:grid-cols-2">
        {[
          { label: "AI margin contribution — last 30 days", net: net30, measured: summary?.headline.measured_30d ?? 0, estimated: summary?.headline.estimated_30d ?? 0 },
          { label: "AI margin contribution — last 90 days", net: net90, measured: summary?.headline.measured_90d ?? 0, estimated: summary?.headline.estimated_90d ?? 0 },
        ].map(h => (
          <Card key={h.label}>
            <CardHeader className="pb-2"><CardTitle className="flex items-center gap-2 text-sm font-medium"><TrendingUp className="size-4" />{h.label}</CardTitle></CardHeader>
            <CardContent>
              <div className={`text-3xl font-bold ${h.net >= 0 ? "text-green-600 dark:text-green-400" : "text-red-600 dark:text-red-400"}`}>{inr(h.net)}</div>
              <p className="mt-1 text-xs text-muted-foreground">
                {inr(h.measured)} measured · {inr(h.estimated)} estimated (marketing / support outcomes are modelled, not instrumented)
              </p>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* per-agent report cards */}
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {(summary?.agents ?? []).map(a => (
          <Card key={a.agent_name}>
            <CardHeader className="pb-2">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base">{names[a.agent_name] ?? a.agent_name}</CardTitle>
                <Gauge className="size-4 text-muted-foreground" />
              </div>
              <CardDescription>{a.verified} verified · {a.pending} pending</CardDescription>
            </CardHeader>
            <CardContent className="space-y-3">
              <div>
                <div className="flex items-baseline justify-between">
                  <span className="text-xs text-muted-foreground">Trust score</span>
                  <span className="text-2xl font-bold">{a.verified > 0 ? a.trust_score : "—"}</span>
                </div>
                <div className="mt-1 h-1.5 w-full rounded-full bg-muted">
                  <div className={`h-1.5 rounded-full ${trustColor(a.trust_score)}`} style={{ width: `${a.verified > 0 ? a.trust_score : 0}%` }} />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-2 text-xs">
                <div><span className="text-muted-foreground">Win rate</span><br /><span className="font-semibold">{a.verified > 0 ? `${Math.round(a.win_rate * 100)}%` : "—"}</span></div>
                <div><span className="text-muted-foreground">W / L / N</span><br /><span className="font-semibold">{a.wins} / {a.losses} / {a.neutral}</span></div>
                <div><span className="text-muted-foreground">Net 30d</span><br /><span className={`font-semibold ${a.realized_delta_30d_inr >= 0 ? "text-green-600 dark:text-green-400" : "text-red-600 dark:text-red-400"}`}>{inr(a.realized_delta_30d_inr)}</span></div>
                <div><span className="text-muted-foreground">Net 90d</span><br /><span className={`font-semibold ${a.realized_delta_90d_inr >= 0 ? "text-green-600 dark:text-green-400" : "text-red-600 dark:text-red-400"}`}>{inr(a.realized_delta_90d_inr)}</span></div>
              </div>
              <p className="text-xs text-muted-foreground">Median projection error {inr(a.median_calibration_error_inr)}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* decisions table */}
      <Card>
        <CardHeader>
          <div className="flex flex-wrap items-center justify-between gap-2">
            <CardTitle>Decisions</CardTitle>
            <div className="flex flex-wrap gap-1">
              {["all", "pricing_agent", "inventory_agent", "marketing_agent", "support_agent"].map(g => (
                <Button key={g} size="sm" variant={agentFilter === g ? "default" : "outline"} onClick={() => setAgentFilter(g)}>{g === "all" ? "All agents" : names[g]}</Button>
              ))}
              {["all", "win", "loss", "neutral", "pending"].map(g => (
                <Button key={g} size="sm" variant={gradeFilter === g ? "default" : "outline"} onClick={() => setGradeFilter(g)}>{g}</Button>
              ))}
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b text-left text-muted-foreground">
                  <th className="pb-2 font-medium">When</th>
                  <th className="pb-2 font-medium">Agent</th>
                  <th className="pb-2 font-medium">Decision</th>
                  <th className="pb-2 font-medium">Autonomy</th>
                  <th className="pb-2 text-right font-medium">Baseline Δ</th>
                  <th className="pb-2 text-right font-medium">Realized Δ</th>
                  <th className="pb-2 text-right font-medium">Net</th>
                  <th className="pb-2 font-medium">Grade</th>
                </tr>
              </thead>
              <tbody>
                {filtered.length === 0 ? (
                  <tr><td colSpan={8} className="py-8 text-center text-muted-foreground">No decisions recorded yet. Run an agent cycle, then verify.</td></tr>
                ) : filtered.map(a => {
                  const net = a.status === "verified" ? (Number(a.realized_delta_inr ?? 0) - Number(a.baseline_delta_inr ?? 0)) : null
                  return (
                    <tr key={a.action_id} className="cursor-pointer border-b last:border-0 hover:bg-muted/40" onClick={() => { setSelected(a); setSheetOpen(true) }}>
                      <td className="py-2 text-muted-foreground">{new Date(a.created_at).toLocaleDateString()}</td>
                      <td className="py-2">{names[a.agent_name] ?? a.agent_name}</td>
                      <td className="py-2">{a.action_type.replace(/_/g, " ")}</td>
                      <td className="py-2 text-xs">{a.autonomy.replace(/_/g, " ")}</td>
                      <td className="py-2 text-right">{a.status === "verified" ? inr(a.baseline_delta_inr) : "—"}</td>
                      <td className="py-2 text-right">{a.status === "verified" ? inr(a.realized_delta_inr) : <span className="text-xs text-muted-foreground">pending</span>}</td>
                      <td className={`py-2 text-right font-medium ${net === null ? "" : net >= 0 ? "text-green-600 dark:text-green-400" : "text-red-600 dark:text-red-400"}`}>{net === null ? "—" : inr(net)}</td>
                      <td className={`py-2 font-medium ${gradeColor[a.grade ?? ""] ?? "text-muted-foreground"}`}>{a.grade ?? "pending"}</td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen} onOpenChange={setSheetOpen}
        title={selected ? `${names[selected.agent_name] ?? selected.agent_name} — ${selected.action_type.replace(/_/g, " ")}` : ""}
        description={selected ? `${selected.measurability} · ${selected.status}` : undefined}
        fields={selected ? [
          { label: "Autonomy", value: selected.autonomy.replace(/_/g, " ") },
          { label: "Grade", value: selected.grade ?? "pending" },
          { label: "Baseline formula", value: String((selected.baseline as Record<string, unknown>)?.formula ?? "—") },
          { label: "Baseline inputs", value: JSON.stringify((selected.baseline as Record<string, unknown>)?.inputs ?? {}) },
          { label: "Baseline Δ (do nothing)", value: inr(selected.baseline_delta_inr) },
          { label: "Projected Δ (agent)", value: inr(Number((selected.baseline as Record<string, unknown>)?.projected_delta_inr ?? 0)) },
          { label: "Realized Δ (actual)", value: selected.status === "verified" ? inr(selected.realized_delta_inr) : "pending" },
          { label: "Projection error", value: selected.calibration_error != null ? inr(selected.calibration_error) : "—" },
          { label: "Decision", value: JSON.stringify(selected.decision ?? {}) },
          { label: "Outcome", value: JSON.stringify(selected.outcome ?? {}) },
          { label: "Verify after", value: new Date(selected.verify_after).toLocaleString() },
        ] : []}
        actions={[{ label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) }]}
      />
    </div>
  )
}
