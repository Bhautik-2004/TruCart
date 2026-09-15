"use client"

import { useEffect, useState } from "react"
import { MessageCircle, X } from "lucide-react"
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetDescription } from "@workspace/ui/components/sheet"
import { CopilotChat } from "./copilot-chat"

/**
 * Global copilot, available from any dashboard page: press Ctrl+K / Cmd+K,
 * or click the floating chat button pinned to the bottom-right of the
 * screen. Same chat + confirm-before-write behavior as the AI Enhancements
 * page's Chat tab (see copilot-chat.tsx) — this is just a quick-access
 * entry point.
 */
export function CommandPalette() {
  const [open, setOpen] = useState(false)

  useEffect(() => {
    function onKeyDown(e: KeyboardEvent) {
      const isMac = navigator.platform.toUpperCase().includes("MAC")
      const modifierPressed = isMac ? e.metaKey : e.ctrlKey
      if (modifierPressed && e.key.toLowerCase() === "k") {
        e.preventDefault()
        setOpen((o) => !o)
      }
      if (e.key === "Escape") setOpen(false)
    }
    window.addEventListener("keydown", onKeyDown)
    return () => window.removeEventListener("keydown", onKeyDown)
  }, [])

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-label={open ? "Close TruCart Copilot" : "Open TruCart Copilot"}
        className="fixed bottom-6 right-6 z-50 flex size-14 items-center justify-center rounded-full bg-primary text-primary-foreground shadow-lg transition-transform hover:scale-105"
      >
        {open ? <X className="size-6" /> : <MessageCircle className="size-6" />}
      </button>

      <Sheet open={open} onOpenChange={setOpen}>
        <SheetContent side="right" className="w-full sm:max-w-lg">
          <SheetHeader>
            <SheetTitle>TruCart Copilot</SheetTitle>
            <SheetDescription>Press Ctrl+K (Cmd+K on Mac) or click the chat button anywhere to open this. Actions that change data always need your confirmation.</SheetDescription>
          </SheetHeader>
          <div className="flex-1 overflow-y-auto px-4 pb-4">
            <CopilotChat heightClass="h-[60vh]" />
          </div>
        </SheetContent>
      </Sheet>
    </>
  )
}
