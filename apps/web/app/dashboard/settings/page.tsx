import { createServerClient } from "../../../lib/supabase-server"
import SettingsClient from "./settings-client"

export const dynamic = "force-dynamic"

export default async function SettingsPage() {
  const supabase = createServerClient()

  const { data: configData } = await supabase.from("store_config").select("config_key, config_value")
  const { data: userData } = await supabase.from("users").select("full_name, email").limit(1).single()

  const config = new Map((configData || []).map(c => [c.config_key, typeof c.config_value === "string" ? c.config_value : JSON.stringify(c.config_value)]))

  return <SettingsClient
    userName={userData?.full_name || "Admin User"}
    userEmail={userData?.email || "admin@trucart.com"}
    initialConfig={Object.fromEntries(config)}
  />
}
