"use client"

import { usePathname } from "next/navigation"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@workspace/ui/components/breadcrumb"

const pageNames: Record<string, string> = {
  "/dashboard": "Overview",
  "/dashboard/review": "Review Queue",
  "/dashboard/orders": "Orders",
  "/dashboard/inventory": "Inventory",
  "/dashboard/support": "Support",
  "/dashboard/pricing": "Pricing",
  "/dashboard/marketing": "Marketing",
  "/dashboard/logistics": "Logistics",
  "/dashboard/agents": "Agents",
  "/dashboard/audits": "Audit Logs",
  "/dashboard/notifications": "Notifications",
  "/dashboard/settings": "Settings",
}

export function BreadcrumbNav() {
  const pathname = usePathname()
  const pageName = pageNames[pathname] || "Overview"

  return (
    <Breadcrumb>
      <BreadcrumbList>
        <BreadcrumbItem>
          <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
        </BreadcrumbItem>
        {pathname !== "/dashboard" && (
          <>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{pageName}</BreadcrumbPage>
            </BreadcrumbItem>
          </>
        )}
      </BreadcrumbList>
    </Breadcrumb>
  )
}
