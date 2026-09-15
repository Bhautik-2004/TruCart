"use client"

import { useEffect, useRef, useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Send, Loader2, Sparkles, Check, X } from "lucide-react"

interface ChatTurn {
  role: "user" | "agent"
  content: string
}

interface PendingAction {
  tool: string
  args: Record<string, unknown>
  reason: string
}

const DEFAULT_GREETING = "Hi, I'm the TruCart ops copilot. Ask me about orders, inventory, or tickets — or say \"run the pricing agent\" or \"generate this week's report\"."

/**
 * Shared copilot chat UI: posts to /api/ai-tools/chat, and — when the model
 * proposes a write action (running an agent, generating a report) — renders
 * a Confirm/Cancel prompt instead of executing it, per the read/write tool
 * split in backend/agents/chat.py. Used by both the AI Enhancements page and
 * the global command palette so the behavior only lives in one place.
 */
export function CopilotChat({ heightClass = "h-96", greeting = DEFAULT_GREETING }: { heightClass?: string; greeting?: string }) {
  const router = useRouter()
  const [history, setHistory] = useState<ChatTurn[]>([{ role: "agent", content: greeting }])
  const [input, setInput] = useState("")
  const [sending, setSending] = useState(false)
  const [pending, setPending] = useState<PendingAction | null>(null)
  const [confirming, setConfirming] = useState(false)
  const bottomRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" })
  }, [history, pending])

  async function send() {
    const message = input.trim()
    if (!message || sending) return
    const nextHistory: ChatTurn[] = [...history, { role: "user", content: message }]
    setHistory(nextHistory)
    setInput("")
    setSending(true)
    setPending(null)
    try {
      const res = await fetch("/api/ai-tools/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message, history: nextHistory }),
      })
      const data = await res.json()
      if (data.type === "pending_confirmation") {
        setHistory((h) => [...h, { role: "agent", content: data.reason || `Confirm: ${data.tool}?` }])
        setPending({ tool: data.tool, args: data.args || {}, reason: data.reason || data.tool })
      } else {
        setHistory((h) => [...h, { role: "agent", content: data.reply || "Sorry, I couldn't generate a reply." }])
      }
    } catch {
      setHistory((h) => [...h, { role: "agent", content: "Something went wrong reaching the assistant." }])
    }
    setSending(false)
  }

  async function confirmPending() {
    if (!pending) return
    setConfirming(true)
    try {
      const res = await fetch("/api/ai-tools/chat/execute", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ tool: pending.tool, args: pending.args }),
      })
      const data = await res.json()
      const summary = data.error
        ? `Failed: ${data.error}`
        : pending.tool === "run_agent"
          ? `Done — ${pending.args.agent_name} ran: ${JSON.stringify(data.summary || data)}`
          : pending.tool === "generate_report"
            ? `Report generated: "${data.title}"`
            : `Done: ${JSON.stringify(data)}`
      setHistory((h) => [...h, { role: "agent", content: summary }])
      router.refresh()
    } catch {
      setHistory((h) => [...h, { role: "agent", content: "Failed to execute — backend unreachable." }])
    }
    setPending(null)
    setConfirming(false)
  }

  function cancelPending() {
    setHistory((h) => [...h, { role: "agent", content: "Cancelled." }])
    setPending(null)
  }

  return (
    <div className="space-y-4">
      <div className={`${heightClass} overflow-y-auto rounded-md border p-4 space-y-3 bg-muted/20`}>
        {history.map((turn, i) => (
          <div key={i} className={`flex ${turn.role === "user" ? "justify-end" : "justify-start"}`}>
            <div
              className={`max-w-[80%] rounded-lg px-3 py-2 text-sm whitespace-pre-wrap ${
                turn.role === "user" ? "bg-primary text-primary-foreground" : "bg-background border"
              }`}
            >
              {turn.content}
            </div>
          </div>
        ))}
        {sending && (
          <div className="flex justify-start">
            <div className="rounded-lg border bg-background px-3 py-2 text-sm text-muted-foreground flex items-center gap-2">
              <Loader2 className="size-3 animate-spin" /> Thinking…
            </div>
          </div>
        )}
        {pending && (
          <div className="flex justify-start">
            <div className="max-w-[85%] rounded-lg border border-amber-400/60 bg-amber-50 dark:bg-amber-950 px-3 py-2 text-sm space-y-2">
              <div className="flex items-center gap-1.5 font-medium"><Sparkles className="size-3.5" />Confirm action: {pending.tool.replace(/_/g, " ")}</div>
              {Object.keys(pending.args).length > 0 && (
                <div className="text-xs text-muted-foreground">{JSON.stringify(pending.args)}</div>
              )}
              <div className="flex gap-2 pt-1">
                <Button size="sm" onClick={confirmPending} disabled={confirming}>
                  {confirming ? <Loader2 className="mr-1 size-3 animate-spin" /> : <Check className="mr-1 size-3" />}Confirm
                </Button>
                <Button size="sm" variant="outline" onClick={cancelPending} disabled={confirming}>
                  <X className="mr-1 size-3" />Cancel
                </Button>
              </div>
            </div>
          </div>
        )}
        <div ref={bottomRef} />
      </div>
      <div className="flex gap-2">
        <Input
          placeholder="Ask about orders, stock, tickets… or run an agent"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => { if (e.key === "Enter") send() }}
          disabled={sending || !!pending}
        />
        <Button onClick={send} disabled={sending || !!pending || !input.trim()}>
          <Send className="size-4" />
        </Button>
      </div>
    </div>
  )
}
