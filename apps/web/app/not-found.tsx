import { Button } from "@workspace/ui/components/button"
import { FileQuestion } from "lucide-react"

export default function NotFound() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-4 px-4">
      <div className="flex size-16 items-center justify-center rounded-2xl bg-muted">
        <FileQuestion className="size-8 text-muted-foreground" />
      </div>
      <div className="text-center">
        <h1 className="text-3xl font-bold tracking-tight">404</h1>
        <p className="mt-2 text-muted-foreground">
          The page you&apos;re looking for doesn&apos;t exist.
        </p>
      </div>
      <Button nativeButton={false} render={<a href="/dashboard" />}>
        Back to Dashboard
      </Button>
    </div>
  )
}
