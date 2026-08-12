import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  Bell,
  ShoppingCart,
  AlertTriangle,
  Bot,
  CheckCircle,
  Settings,
  Trash2,
  EyeOff,
} from "lucide-react"
import { createServerClient } from "../../../lib/supabase-server"

export const dynamic = "force-dynamic"

const typeStyles: Record<string, string> = {
  order: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  warning: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
  success: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  system: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
  info: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
}

function NotificationIcon({ type }: { type: string }) {
  const className = "size-4"
  switch (type) {
    case "order":
      return <ShoppingCart className={className} />
    case "warning":
      return <AlertTriangle className={className} />
    case "agent":
      return <Bot className={className} />
    case "success":
      return <CheckCircle className={className} />
    case "system":
      return <Settings className={className} />
    default:
      return <Bell className={className} />
  }
}

function formatTimeAgo(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime()
  const mins = Math.floor(diff / 60000)
  if (mins < 1) return "just now"
  if (mins < 60) return `${mins} min ago`
  const hrs = Math.floor(mins / 60)
  if (hrs < 24) return `${hrs} hr ago`
  const days = Math.floor(hrs / 24)
  return `${days}d ago`
}

export default async function NotificationsPage() {
  const supabase = createServerClient()

  const { data: notifications } = await supabase
    .from("notifications")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(30)

  const allNotifications = notifications || []
  const unreadCount = allNotifications.filter(n => !n.is_read).length

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Notifications</h2>
          <p className="text-muted-foreground">
            Stay updated with system alerts and activities.
          </p>
        </div>
        <div className="flex gap-2">
          <Button variant="outline" size="sm">
            <CheckCircle className="mr-2 size-4" />
            Mark All Read
          </Button>
          <Button variant="outline" size="sm">
            <Settings className="mr-2 size-4" />
            Preferences
          </Button>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Recent Notifications</CardTitle>
          <CardDescription>
            You have {unreadCount} unread notifications
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          {allNotifications.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">No notifications</p>
          ) : (
            allNotifications.map((notification) => (
              <div
                key={notification.notification_id}
                className={`flex items-start gap-4 rounded-lg border p-4 transition-colors ${
                  !notification.is_read ? "bg-muted/50" : ""
                }`}
              >
                <div className={`flex size-8 shrink-0 items-center justify-center rounded-full ${typeStyles[notification.type] || typeStyles.info}`}>
                  <NotificationIcon type={notification.type} />
                </div>
                <div className="flex-1 space-y-1">
                  <div className="flex items-center gap-2">
                    <span className={`font-medium text-sm ${!notification.is_read ? "font-semibold" : ""}`}>
                      {notification.title}
                    </span>
                    {!notification.is_read && (
                      <span className="size-2 rounded-full bg-blue-500" />
                    )}
                  </div>
                  <p className="text-sm text-muted-foreground">
                    {notification.message}
                  </p>
                  <span className="text-xs text-muted-foreground">
                    {formatTimeAgo(notification.created_at)}
                  </span>
                </div>
                <div className="flex gap-1">
                  {!notification.is_read && (
                    <Button variant="ghost" size="sm">
                      <EyeOff className="size-3" />
                    </Button>
                  )}
                  <Button variant="ghost" size="sm">
                    <Trash2 className="size-3" />
                  </Button>
                </div>
              </div>
            ))
          )}
        </CardContent>
      </Card>
    </div>
  )
}
