"use client"

import { Card, CardContent } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { AlertTriangle } from "lucide-react"

export default function DashboardError({
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
        <h2 className="text-lg font-semibold">Something went wrong</h2>
        <p className="text-sm text-muted-foreground max-w-md mx-auto">
          {error.message || "An unexpected error occurred while loading the dashboard."}
        </p>
        <Button onClick={reset} variant="outline">
          Try Again
        </Button>
      </CardContent>
    </Card>
  )
}
