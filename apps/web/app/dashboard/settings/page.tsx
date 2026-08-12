import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Label } from "@workspace/ui/components/label"
import {
  User,
  Bell,
  Shield,
  Palette,
  Globe,
  Save,
} from "lucide-react"
import { createServerClient } from "../../../lib/supabase-server"

export const dynamic = "force-dynamic"

export default async function SettingsPage() {
  const supabase = createServerClient()

  const { data: configData } = await supabase
    .from("store_config")
    .select("config_key, config_value")

  const config = new Map((configData || []).map(c => [c.config_key, c.config_value]))

  const storeName = config.get("store_name") || "TechBazaar"
  const emailEnabled = config.get("marketing.channel.email.enabled") !== "false"
  const smsEnabled = config.get("marketing.channel.sms.enabled") !== "false"
  const whatsappEnabled = config.get("marketing.channel.whatsapp.enabled") !== "false"
  const pushEnabled = config.get("marketing.channel.push.enabled") === "true"

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold tracking-tight">Settings</h2>
        <p className="text-muted-foreground">
          Manage your account and application preferences.
        </p>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <div className="lg:col-span-2 space-y-6">
          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <User className="size-5" />
                <div>
                  <CardTitle>Profile</CardTitle>
                  <CardDescription>Manage your personal information</CardDescription>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                <div className="space-y-2">
                  <Label htmlFor="name">Full Name</Label>
                  <Input id="name" placeholder="Your name" defaultValue="Admin User" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="email">Email</Label>
                  <Input id="email" type="email" placeholder="Your email" defaultValue="admin@trucart.com" />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="company">Company</Label>
                <Input id="company" placeholder="Company name" defaultValue={String(storeName)} />
              </div>
              <Button>
                <Save className="mr-2 size-4" />
                Save Changes
              </Button>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <Bell className="size-5" />
                <div>
                  <CardTitle>Notifications</CardTitle>
                  <CardDescription>Configure notification preferences</CardDescription>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="flex items-center justify-between">
                <div className="space-y-0.5">
                  <p className="text-sm font-medium">Email Notifications</p>
                  <p className="text-sm text-muted-foreground">Receive alerts via email</p>
                </div>
                <Button variant="outline" size="sm">{emailEnabled ? "Enabled" : "Disabled"}</Button>
              </div>
              <div className="flex items-center justify-between">
                <div className="space-y-0.5">
                  <p className="text-sm font-medium">SMS Notifications</p>
                  <p className="text-sm text-muted-foreground">Receive alerts via SMS</p>
                </div>
                <Button variant="outline" size="sm">{smsEnabled ? "Enabled" : "Disabled"}</Button>
              </div>
              <div className="flex items-center justify-between">
                <div className="space-y-0.5">
                  <p className="text-sm font-medium">WhatsApp Notifications</p>
                  <p className="text-sm text-muted-foreground">Receive alerts via WhatsApp</p>
                </div>
                <Button variant="outline" size="sm">{whatsappEnabled ? "Enabled" : "Disabled"}</Button>
              </div>
              <div className="flex items-center justify-between">
                <div className="space-y-0.5">
                  <p className="text-sm font-medium">Push Notifications</p>
                  <p className="text-sm text-muted-foreground">Browser push notifications</p>
                </div>
                <Button variant="outline" size="sm">{pushEnabled ? "Enabled" : "Disabled"}</Button>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <Globe className="size-5" />
                <div>
                  <CardTitle>Regional</CardTitle>
                  <CardDescription>Set your timezone and currency</CardDescription>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                <div className="space-y-2">
                  <Label htmlFor="timezone">Timezone</Label>
                  <Input id="timezone" defaultValue="Asia/Kolkata" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="currency">Currency</Label>
                  <Input id="currency" defaultValue="INR" />
                </div>
              </div>
              <Button>
                <Save className="mr-2 size-4" />
                Save Changes
              </Button>
            </CardContent>
          </Card>
        </div>

        <div className="space-y-6">
          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <Shield className="size-5" />
                <div>
                  <CardTitle>Security</CardTitle>
                  <CardDescription>Manage security settings</CardDescription>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <Button variant="outline" className="w-full justify-start">
                Change Password
              </Button>
              <Button variant="outline" className="w-full justify-start">
                Two-Factor Authentication
              </Button>
              <Button variant="outline" className="w-full justify-start">
                API Keys
              </Button>
              <Button variant="outline" className="w-full justify-start">
                Session History
              </Button>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <Palette className="size-5" />
                <div>
                  <CardTitle>Appearance</CardTitle>
                  <CardDescription>Customize the look and feel</CardDescription>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label>Theme</Label>
                <div className="flex gap-2">
                  <Button variant="outline" size="sm" className="flex-1">
                    Light
                  </Button>
                  <Button variant="outline" size="sm" className="flex-1">
                    Dark
                  </Button>
                  <Button variant="outline" size="sm" className="flex-1">
                    System
                  </Button>
                </div>
              </div>
              <div className="space-y-2">
                <Label>Language</Label>
                <Input defaultValue="English" />
              </div>
            </CardContent>
          </Card>

          <Card className="border-destructive">
            <CardHeader>
              <CardTitle className="text-destructive">Danger Zone</CardTitle>
              <CardDescription>Irreversible actions</CardDescription>
            </CardHeader>
            <CardContent>
              <Button variant="destructive" className="w-full">
                Delete Account
              </Button>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
