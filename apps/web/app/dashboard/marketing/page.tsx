"use client"

import { useState } from "react"
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

const marketingStats = [
  { title: "Active Campaigns", value: "8", icon: Megaphone, change: "3 scheduled" },
  { title: "Total Impressions", value: "1.2M", icon: Eye, change: "+23% this week" },
  { title: "Click-through Rate", value: "3.8%", icon: MousePointerClick, change: "+0.5% from avg" },
  { title: "Conversions", value: "2,847", icon: TrendingUp, change: "$12,450 revenue" },
]

const campaigns = [
  {
    name: "Summer Sale 2024",
    type: "Email",
    status: "active",
    sent: "15,234",
    opened: "8,456",
    clicked: "1,234",
    conversions: 89,
    budget: "$5,000",
    spent: "$3,200",
    startDate: "Jan 1, 2024",
    endDate: "Jan 31, 2024",
  },
  {
    name: "Product Launch - Wireless Earbuds",
    type: "Social Media",
    status: "active",
    sent: "45,000",
    opened: "12,345",
    clicked: "3,456",
    conversions: 156,
    budget: "$10,000",
    spent: "$7,800",
    startDate: "Jan 5, 2024",
    endDate: "Feb 5, 2024",
  },
  {
    name: "Abandoned Cart Recovery",
    type: "Email",
    status: "active",
    sent: "3,456",
    opened: "2,100",
    clicked: "890",
    conversions: 67,
    budget: "$1,000",
    spent: "$450",
    startDate: "Ongoing",
    endDate: "Ongoing",
  },
  {
    name: "VIP Customer Appreciation",
    type: "Email",
    status: "scheduled",
    sent: "-",
    opened: "-",
    clicked: "-",
    conversions: 0,
    budget: "$3,000",
    spent: "$0",
    startDate: "Feb 1, 2024",
    endDate: "Feb 14, 2024",
  },
]

const statusStyles: Record<string, string> = {
  active: "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200",
  scheduled: "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200",
  completed: "bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200",
}

export default function MarketingPage() {
  const [selectedCampaign, setSelectedCampaign] = useState<(typeof campaigns)[number] | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  function openCampaign(campaign: (typeof campaigns)[number]) {
    setSelectedCampaign(campaign)
    setSheetOpen(true)
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
                {campaigns.map((campaign) => (
                  <tr key={campaign.name} className="border-b last:border-0">
                    <td className="py-3 font-medium">{campaign.name}</td>
                    <td className="py-3 text-muted-foreground">{campaign.type}</td>
                    <td className="py-3">
                      <span className={`rounded-full px-2 py-0.5 text-xs font-medium ${statusStyles[campaign.status]}`}>
                        {campaign.status}
                      </span>
                    </td>
                    <td className="py-3">{campaign.sent}</td>
                    <td className="py-3">{campaign.opened}</td>
                    <td className="py-3">{campaign.clicked}</td>
                    <td className="py-3 font-medium">{campaign.conversions}</td>
                    <td className="py-3 text-right">
                      <Button variant="ghost" size="sm" onClick={() => openCampaign(campaign)}>
                        View
                        <ExternalLink className="ml-1 size-3" />
                      </Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
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
                { label: "Sent", value: selectedCampaign.sent },
                { label: "Opened", value: selectedCampaign.opened },
                { label: "Clicked", value: selectedCampaign.clicked },
                { label: "Conversions", value: `${selectedCampaign.conversions}` },
                { label: "Budget", value: selectedCampaign.budget },
                { label: "Spent", value: selectedCampaign.spent },
                { label: "Start Date", value: selectedCampaign.startDate },
                { label: "End Date", value: selectedCampaign.endDate },
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
