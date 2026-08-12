"use client"

import { useEffect, useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@workspace/ui/components/card"
import { Button } from "@workspace/ui/components/button"
import {
  Eye,
  MousePointerClick,
  TrendingUp,
  Plus,
  BarChart3,
  Megaphone,
  ExternalLink,
} from "lucide-react"
import { DetailSheet } from "../components/detail-sheet"
import { supabase } from "../../../lib/supabase"

interface Campaign {
  campaign_id: string
  name: string
  type: string
  status: string
  budget: number
  spent: number
  scheduled_at: string
  sent_at: string
  campaign_metrics?: {
    recipients: number
    opened: number
    clicked: number
    converted: number
  }[]
}

export default function MarketingPage() {
  const [campaigns, setCampaigns] = useState<Campaign[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedCampaign, setSelectedCampaign] = useState<Campaign | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  useEffect(() => {
    async function fetchCampaigns() {
      const { data } = await supabase
        .from("campaigns")
        .select("*, campaign_metrics(recipients, opened, clicked, converted)")
        .order("created_at", { ascending: false })
        .limit(20)

      setCampaigns(data || [])
      setLoading(false)
    }
    fetchCampaigns()
  }, [])

  const activeCampaigns = campaigns.filter(c => c.status === "active").length
  const totalRecipients = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.recipients || 0), 0)
  const totalClicked = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.clicked || 0), 0)
  const totalConverted = campaigns.reduce((sum, c) => sum + (c.campaign_metrics?.[0]?.converted || 0), 0)
  const ctr = totalRecipients > 0 ? ((totalClicked / totalRecipients) * 100) : 0

  const marketingStats = [
    { title: "Active Campaigns", value: activeCampaigns.toString(), icon: Megaphone, change: `${campaigns.length} total` },
    { title: "Total Impressions", value: totalRecipients.toLocaleString(), icon: Eye, change: "Across all campaigns" },
    { title: "Click-through Rate", value: `${ctr.toFixed(1)}%`, icon: MousePointerClick, change: "Average CTR" },
    { title: "Conversions", value: totalConverted.toLocaleString(), icon: TrendingUp, change: "Total conversions" },
  ]

  function openCampaign(campaign: Campaign) {
    setSelectedCampaign(campaign)
    setSheetOpen(true)
  }

  const statusStyles: Record<string, string> = {
    active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
    draft: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    scheduled: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
    completed: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
    paused: "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200",
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Marketing</h2>
          <p className="text-muted-foreground">
            AI-driven marketing campaign management.
          </p>
        </div>
        <Button>
          <Plus className="mr-2 size-4" />
          New Campaign
        </Button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {marketingStats.map((stat) => (
          <Card key={stat.title}>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">
                {stat.title}
              </CardTitle>
              <stat.icon className="size-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{stat.value}</div>
              <p className="text-xs text-muted-foreground">{stat.change}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <div>
              <CardTitle>Campaigns</CardTitle>
              <CardDescription>Active and scheduled marketing campaigns</CardDescription>
            </div>
            <Button variant="outline" size="sm">
              <BarChart3 className="mr-2 size-4" />
              Analytics
            </Button>
          </div>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="space-y-3">
              {Array.from({ length: 5 }).map((_, i) => (
                <div key={i} className="h-12 bg-muted animate-pulse rounded" />
              ))}
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b">
                    <th className="pb-2 text-left font-medium text-muted-foreground">Campaign</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Type</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Status</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Sent</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Opened</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Clicked</th>
                    <th className="pb-2 text-left font-medium text-muted-foreground">Conversions</th>
                    <th className="pb-2 text-right font-medium text-muted-foreground">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {campaigns.map((campaign) => {
                    const metrics = campaign.campaign_metrics?.[0]
                    return (
                      <tr key={campaign.campaign_id} className="border-b last:border-0">
                        <td className="py-3 font-medium">{campaign.name}</td>
                        <td className="py-3 text-muted-foreground">{campaign.type}</td>
                        <td className="py-3">
                          <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[campaign.status] || statusStyles.draft}`}>
                            {campaign.status}
                          </span>
                        </td>
                        <td className="py-3">{(metrics?.recipients || 0).toLocaleString()}</td>
                        <td className="py-3">{(metrics?.opened || 0).toLocaleString()}</td>
                        <td className="py-3">{(metrics?.clicked || 0).toLocaleString()}</td>
                        <td className="py-3 font-medium">{metrics?.converted || 0}</td>
                        <td className="py-3 text-right">
                          <Button variant="ghost" size="sm" onClick={() => openCampaign(campaign)}>
                            View
                            <ExternalLink className="ml-1 size-3" />
                          </Button>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          )}
        </CardContent>
      </Card>

      <DetailSheet
        open={sheetOpen}
        onOpenChange={setSheetOpen}
        title={selectedCampaign?.name ?? ""}
        description={selectedCampaign ? `${selectedCampaign.type} Campaign` : undefined}
        fields={
          selectedCampaign
            ? [
                { label: "Status", value: selectedCampaign.status },
                { label: "Type", value: selectedCampaign.type },
                { label: "Sent", value: (selectedCampaign.campaign_metrics?.[0]?.recipients || 0).toLocaleString() },
                { label: "Opened", value: (selectedCampaign.campaign_metrics?.[0]?.opened || 0).toLocaleString() },
                { label: "Clicked", value: (selectedCampaign.campaign_metrics?.[0]?.clicked || 0).toLocaleString() },
                { label: "Conversions", value: `${selectedCampaign.campaign_metrics?.[0]?.converted || 0}` },
                { label: "Budget", value: `₹${Number(selectedCampaign.budget).toFixed(2)}` },
                { label: "Spent", value: `₹${Number(selectedCampaign.spent).toFixed(2)}` },
                { label: "Start Date", value: selectedCampaign.scheduled_at ? new Date(selectedCampaign.scheduled_at).toLocaleDateString() : "N/A" },
                { label: "End Date", value: selectedCampaign.sent_at ? new Date(selectedCampaign.sent_at).toLocaleDateString() : "Ongoing" },
              ]
            : []
        }
        actions={
          selectedCampaign
            ? [
                { label: "View Analytics", onClick: () => setSheetOpen(false) },
                { label: "Close", variant: "outline" as const, onClick: () => setSheetOpen(false) },
              ]
            : []
        }
      />
    </div>
  )
}
