"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { useTheme } from "next-themes"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Label } from "@workspace/ui/components/label"
import { User, Bell, Shield, Palette, Globe, Save } from "lucide-react"
import { updateStoreConfig } from "../actions"

export default function SettingsClient({ userName, userEmail, initialConfig }: { userName: string; userEmail: string; initialConfig: Record<string, string> }) {
  const router = useRouter()
  const { setTheme, theme } = useTheme()
  const [saving, setSaving] = useState(false)
  const [toast, setToast] = useState<{ message: string; type: "success" | "error" } | null>(null)

  const [name, setName] = useState(userName)
  const [company, setCompany] = useState(initialConfig.store_name || "TechBazaar")
  const [timezone, setTimezone] = useState(initialConfig["regional.timezone"] || "Asia/Kolkata")
  const [currency, setCurrency] = useState(initialConfig["regional.currency"] || "INR")
  const [language, setLanguage] = useState(initialConfig["regional.language"] || "English")

  const [emailEnabled, setEmailEnabled] = useState(initialConfig["marketing.channel.email.enabled"] !== "false")
  const [smsEnabled, setSmsEnabled] = useState(initialConfig["marketing.channel.sms.enabled"] !== "false")
  const [whatsappEnabled, setWhatsappEnabled] = useState(initialConfig["marketing.channel.whatsapp.enabled"] !== "false")
  const [pushEnabled, setPushEnabled] = useState(initialConfig["marketing.channel.push.enabled"] === "true")

  function showToast(message: string, type: "success" | "error" = "success") {
    setToast({ message, type }); setTimeout(() => setToast(null), 3000)
  }

  async function saveProfile() {
    setSaving(true)
    try { await updateStoreConfig("store_name", company); showToast("Profile saved") } catch { showToast("Failed to save", "error") }
    setSaving(false); router.refresh()
  }

  async function saveRegional() {
    setSaving(true)
    try {
      await Promise.all([updateStoreConfig("regional.timezone", timezone), updateStoreConfig("regional.currency", currency), updateStoreConfig("regional.language", language)])
      showToast("Regional settings saved")
    } catch { showToast("Failed to save", "error") }
    setSaving(false); router.refresh()
  }

  async function toggleNotification(key: string, current: boolean) {
    const next = !current
    try { await updateStoreConfig(key, String(next)); showToast("Preference updated"); return next } catch { showToast("Failed", "error"); return current }
  }

  return (
    <div className="space-y-6">
      {toast && <div className={`fixed top-4 right-4 z-50 rounded-lg px-4 py-2 text-sm text-white shadow-lg ${toast.type === "success" ? "bg-green-600" : "bg-red-600"}`}>{toast.message}</div>}

      <div><h2 className="text-2xl font-bold tracking-tight">Settings</h2><p className="text-muted-foreground">Manage your account and application preferences.</p></div>

      <div className="grid gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2 space-y-6">
          <Card>
            <CardHeader><div className="flex items-center gap-2"><User className="size-5" /><div><CardTitle>Profile</CardTitle><CardDescription>Manage your personal information</CardDescription></div></div></CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                <div className="space-y-2"><Label>Full Name</Label><Input value={name} onChange={e => setName(e.target.value)} /></div>
                <div className="space-y-2"><Label>Email</Label><Input value={userEmail} disabled /></div>
              </div>
              <div className="space-y-2"><Label>Company</Label><Input value={company} onChange={e => setCompany(e.target.value)} /></div>
              <Button onClick={saveProfile} disabled={saving}><Save className="mr-2 size-4" />{saving ? "Saving..." : "Save Changes"}</Button>
            </CardContent>
          </Card>

          <Card>
            <CardHeader><div className="flex items-center gap-2"><Bell className="size-5" /><div><CardTitle>Notifications</CardTitle><CardDescription>Configure notification preferences</CardDescription></div></div></CardHeader>
            <CardContent className="space-y-4">
              {[
                { label: "Email Notifications", desc: "Receive alerts via email", key: "marketing.channel.email.enabled", value: emailEnabled, setter: setEmailEnabled },
                { label: "SMS Notifications", desc: "Receive alerts via SMS", key: "marketing.channel.sms.enabled", value: smsEnabled, setter: setSmsEnabled },
                { label: "WhatsApp Notifications", desc: "Receive alerts via WhatsApp", key: "marketing.channel.whatsapp.enabled", value: whatsappEnabled, setter: setWhatsappEnabled },
                { label: "Push Notifications", desc: "Browser push notifications", key: "marketing.channel.push.enabled", value: pushEnabled, setter: setPushEnabled },
              ].map(item => (
                <div key={item.key} className="flex items-center justify-between">
                  <div className="space-y-0.5"><p className="text-sm font-medium">{item.label}</p><p className="text-sm text-muted-foreground">{item.desc}</p></div>
                  <Button variant={item.value ? "default" : "outline"} size="sm" onClick={async () => { const r = await toggleNotification(item.key, item.value); item.setter(r) }}>{item.value ? "Enabled" : "Disabled"}</Button>
                </div>
              ))}
            </CardContent>
          </Card>

          <Card>
            <CardHeader><div className="flex items-center gap-2"><Globe className="size-5" /><div><CardTitle>Regional</CardTitle><CardDescription>Set your timezone and currency</CardDescription></div></div></CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                <div className="space-y-2"><Label>Timezone</Label><Input value={timezone} onChange={e => setTimezone(e.target.value)} /></div>
                <div className="space-y-2"><Label>Currency</Label><Input value={currency} onChange={e => setCurrency(e.target.value)} /></div>
              </div>
              <div className="space-y-2"><Label>Language</Label><Input value={language} onChange={e => setLanguage(e.target.value)} /></div>
              <Button onClick={saveRegional} disabled={saving}><Save className="mr-2 size-4" />{saving ? "Saving..." : "Save Changes"}</Button>
            </CardContent>
          </Card>
        </div>

        <div className="space-y-6">
          <Card>
            <CardHeader><div className="flex items-center gap-2"><Shield className="size-5" /><div><CardTitle>Security</CardTitle><CardDescription>Manage security settings</CardDescription></div></div></CardHeader>
            <CardContent className="space-y-4">
              <Button variant="outline" className="w-full justify-start" onClick={() => showToast("Password change coming soon")}>Change Password</Button>
              <Button variant="outline" className="w-full justify-start" onClick={() => showToast("2FA coming soon")}>Two-Factor Authentication</Button>
              <Button variant="outline" className="w-full justify-start" onClick={() => showToast("API key management coming soon")}>API Keys</Button>
              <Button variant="outline" className="w-full justify-start" onClick={() => showToast("Session history coming soon")}>Session History</Button>
            </CardContent>
          </Card>

          <Card>
            <CardHeader><div className="flex items-center gap-2"><Palette className="size-5" /><div><CardTitle>Appearance</CardTitle><CardDescription>Customize the look and feel</CardDescription></div></div></CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2"><Label>Theme</Label><div className="flex gap-2">{(["light", "dark", "system"] as const).map(t => (<Button key={t} variant={theme === t ? "default" : "outline"} size="sm" className="flex-1" onClick={() => setTheme(t)}>{t.charAt(0).toUpperCase() + t.slice(1)}</Button>))}</div></div>
            </CardContent>
          </Card>

          <Card className="border-destructive">
            <CardHeader><CardTitle className="text-destructive">Danger Zone</CardTitle><CardDescription>Irreversible actions</CardDescription></CardHeader>
            <CardContent>
              <Button variant="destructive" className="w-full" onClick={() => { if (window.confirm("Delete your account? This cannot be undone.")) showToast("Account deletion requested", "error") }}>Delete Account</Button>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
