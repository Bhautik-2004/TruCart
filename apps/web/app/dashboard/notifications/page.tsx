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

const notifications = [
  {
    id: "NOT-001",
    title: "New Order Received",
    message: "Order #ORD-1234 has been placed by Alice Johnson for $156.99",
    type: "order" as const,
    time: "5 min ago",
    read: false,
  },
  {
    id: "NOT-002",
    title: "Low Stock Alert",
    message: "Product SKU-002 (Organic Cotton T-Shirt) is running low on stock. Current: 12 units",
    type: "warning" as const,
    time: "15 min ago",
    read: false,
  },
  {
    id: "NOT-003",
    title: "Agent Task Completed",
    message: "Pricing Agent has updated 15 product prices based on market analysis",
    type: "agent" as const,
    time: "30 min ago",
    read: false,
  },
  {
    id: "NOT-004",
    title: "Shipment Delivered",
    message: "Order #ORD-1232 has been successfully delivered to Chicago, IL",
    type: "success" as const,
    time: "1 hr ago",
    read: true,
  },
  {
    id: "NOT-005",
    title: "System Update",
    message: "Platform maintenance scheduled for tonight at 2:00 AM EST",
    type: "system" as const,
    time: "2 hr ago",
    read: true,
  },
  {
    id: "NOT-006",
    title: "Campaign Performance",
    message: "Summer Sale 2024 campaign has exceeded targets by 23%",
    type: "success" as const,
    time: "3 hr ago",
    read: true,
  },
]

const typeStyles: Record<string, string> = {
  order: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  warning: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  agent: "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200",
  success: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  system: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
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

export default function NotificationsPage() {
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
            You have {notifications.filter((n) => !n.read).length} unread notifications
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          {notifications.map((notification) => (
            <div
              key={notification.id}
              className={`flex items-start gap-4 rounded-lg border p-4 transition-colors ${
                !notification.read ? "bg-muted/50" : ""
              }`}
            >
              <div className={`flex size-8 shrink-0 items-center justify-center rounded-full ${typeStyles[notification.type]}`}>
                <NotificationIcon type={notification.type} />
              </div>
              <div className="flex-1 space-y-1">
                <div className="flex items-center gap-2">
                  <span className={`font-medium text-sm ${!notification.read ? "font-semibold" : ""}`}>
                    {notification.title}
                  </span>
                  {!notification.read && (
                    <span className="size-2 rounded-full bg-blue-500" />
                  )}
                </div>
                <p className="text-sm text-muted-foreground">
                  {notification.message}
                </p>
                <span className="text-xs text-muted-foreground">
                  {notification.time}
                </span>
              </div>
              <div className="flex gap-1">
                {!notification.read && (
                  <Button variant="ghost" size="sm">
                    <EyeOff className="size-3" />
                  </Button>
                )}
                <Button variant="ghost" size="sm">
                  <Trash2 className="size-3" />
                </Button>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  )
}
