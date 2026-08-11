import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarRail,
} from "@workspace/ui/components/sidebar"
import { Separator } from "@workspace/ui/components/separator"
import {
  LayoutDashboard,
  ShoppingCart,
  Package,
  ShelvingUnit,
  Settings,
  Bell,
  LogOut,
  Info,
  DollarSign,
  Ad,
  Forklift,
  Bot,
  ListMinus,
  Logs
} from "lucide-react"

const navItems = [
  {
    label: "Overview",
    items: [
      { title: "Dashboard", url: "/dashboard", icon: LayoutDashboard },
      { title: "Review Queue", url: "/dashboard/review", icon: ListMinus },
    ],
  },
  {
    label: "Management",
    items: [
      { title: "Orders", url: "/dashboard/orders", icon: ShoppingCart },
      { title: "Inventory", url: "/dashboard/inventory", icon: ShelvingUnit },
      { title: "Support", url: "/dashboard/support", icon: Info },
      { title: "Pricing", url: "/dashboard/pricing", icon:  DollarSign },
      { title: "Marketing", url: "/dashboard/marketing", icon: Ad },
      { title: "Logistics", url: "/dashboard/logistics", icon: Forklift },
      { title: "Agents", url: "/dashboard/agents", icon: Bot },
      { title: "Audit Logs", url: "/dashboard/audits", icon: Logs },

    ],
  },
  {
    label: "Support",
    items: [
      { title: "Notifications", url: "/dashboard/notifications", icon: Bell },
      { title: "Settings", url: "/dashboard/settings", icon: Settings },
    ],
  },
]

export function DashboardSidebar(props: React.ComponentProps<typeof Sidebar>) {
  return (
    <Sidebar {...props}>
      <SidebarHeader>
        <div className="flex items-center gap-2 px-2 py-1.5">
          <div className="flex size-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
            <Package className="size-4" />
          </div>
          <div className="flex flex-col gap-0.5 leading-none">
            <span className="font-semibold">TruCart</span>
            <span className="text-xs text-muted-foreground">Admin Panel</span>
          </div>
        </div>
      </SidebarHeader>
      <Separator />
      <SidebarContent>
        {navItems.map((group) => (
          <SidebarGroup key={group.label}>
            <SidebarGroupLabel>{group.label}</SidebarGroupLabel>
            <SidebarGroupContent>
              <SidebarMenu>
                {group.items.map((item) => (
                  <SidebarMenuItem key={item.title}>
                    <SidebarMenuButton render={<a href={item.url} />}>
                      <item.icon />
                      <span>{item.title}</span>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                ))}
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        ))}
      </SidebarContent>
      <Separator />
      <SidebarFooter>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton
              onClick={() => {
                localStorage.removeItem("user")
                window.location.href = "/login"
              }}
            >
              <LogOut />
              <span>Log out</span>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
      <SidebarRail />
    </Sidebar>
  )
}
