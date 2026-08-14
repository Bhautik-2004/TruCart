import { createServerClient } from "../../../lib/supabase-server"
import NotificationsClient from "./notifications-client"

export const dynamic = "force-dynamic"

export default async function NotificationsPage() {
  const supabase = createServerClient()

  const { data: notifications } = await supabase
    .from("notifications")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(30)

  return <NotificationsClient notifications={notifications || []} />
}
