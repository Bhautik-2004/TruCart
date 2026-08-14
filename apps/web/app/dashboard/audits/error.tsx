"use client"

import { Card, CardContent } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { AlertTriangle } from "lucide-react"

export default function AuditsError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <Card>
      <CardContent className="py-12 text-center space-y-4">
        <AlertTriangle className="size-10 text-destructive mx-auto" />
        <h2 className="text-lg font-semibold">Failed to load audit logs</h2>
        <p className="text-sm text-muted-foreground">{error.message}</p>
        <Button onClick={reset} variant="outline">Try Again</Button>
      </CardContent>
    </Card>
  )
}
