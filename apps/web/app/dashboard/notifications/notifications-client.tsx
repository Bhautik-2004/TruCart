"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Bell, ShoppingCart, AlertTriangle, Bot, CheckCircle, Settings, Trash2, EyeOff } from "lucide-react"
import { markAllNotificationsRead, markNotificationRead, deleteNotification } from "../actions"

interface Notification { notification_id: string; title: string; message: string; type: string; is_read: boolean; created_at: string }

const typeStyles: Record<string, string> = {
  order: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  warning: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
  success: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  system: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
  info: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
}

function NotificationIcon({ type }: { type: string }) {
  const c = "size-4"
  switch (type) { case "order": return <ShoppingCart className={c} />; case "warning": return <AlertTriangle className={c} />; case "agent": return <Bot className={c} />; case "success": return <CheckCircle className={c} />; case "system": return <Settings className={c} />; default: return <Bell className={c} /> }
}

function formatTimeAgo(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime()
  const mins = Math.floor(diff / 60000)
  if (mins < 1) return "just now"
  if (mins < 60) return `${mins} min ago`
  const hrs = Math.floor(mins / 60)
  if (hrs < 24) return `${hrs} hr ago`
  return `${Math.floor(hrs / 24)}d ago`
}

export default function NotificationsClient({ notifications }: { notifications: Notification[] }) {
  const router = useRouter()
  const [acting, setActing] = useState<string | null>(null)

  const unreadCount = notifications.filter(n => !n.is_read).length

  async function handleMarkAllRead() {
    setActing("all")
    await markAllNotificationsRead()
    router.refresh()
    setActing(null)
  }

  async function handleMarkRead(id: string) {
    setActing(id)
    await markNotificationRead(id)
    router.refresh()
    setActing(null)
  }

  async function handleDelete(id: string) {
    setActing(id)
    await deleteNotification(id)
    router.refresh()
    setActing(null)
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h2 className="text-2xl font-bold tracking-tight">Notifications</h2><p className="text-muted-foreground">Stay updated with system alerts and activities.</p></div>
        <Button variant="outline" size="sm" onClick={handleMarkAllRead} disabled={acting === "all" || unreadCount === 0}><CheckCircle className="mr-2 size-4" />{acting === "all" ? "Marking..." : "Mark All Read"}</Button>
      </div>

      <Card>
        <CardHeader><CardTitle>Recent Notifications</CardTitle><CardDescription>You have {unreadCount} unread notifications</CardDescription></CardHeader>
        <CardContent className="space-y-3">
          {notifications.length === 0 ? (<p className="text-sm text-muted-foreground text-center py-8">No notifications</p>)
          : notifications.map(n => (
            <div key={n.notification_id} className={`flex items-start gap-4 rounded-lg border p-4 transition-colors ${!n.is_read ? "bg-muted/50" : ""}`}>
              <div className={`flex size-8 shrink-0 items-center justify-center rounded-full ${typeStyles[n.type] || typeStyles.info}`}><NotificationIcon type={n.type} /></div>
              <div className="flex-1 space-y-1">
                <div className="flex items-center gap-2">
                  <span className={`font-medium text-sm ${!n.is_read ? "font-semibold" : ""}`}>{n.title}</span>
                  {!n.is_read && <span className="size-2 rounded-full bg-blue-500" />}
                </div>
                <p className="text-sm text-muted-foreground">{n.message}</p>
                <span className="text-xs text-muted-foreground">{formatTimeAgo(n.created_at)}</span>
              </div>
              <div className="flex gap-1">
                {!n.is_read && (<Button variant="ghost" size="sm" onClick={() => handleMarkRead(n.notification_id)} disabled={acting === n.notification_id}><EyeOff className="size-3" /></Button>)}
                <Button variant="ghost" size="sm" onClick={() => handleDelete(n.notification_id)} disabled={acting === n.notification_id}><Trash2 className="size-3" /></Button>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  )
}
