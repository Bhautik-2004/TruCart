import { SidebarProvider, SidebarInset } from "@workspace/ui/components/sidebar"
import { DashboardSidebar } from "./components/dashboard-sidebar"
import { DashboardHeader } from "./components/dashboard-header"

// Access control for /dashboard/* is enforced server-side by middleware.ts
// (it verifies the signed `trucart_session` cookie and redirects to /login).
export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <SidebarProvider>
      <DashboardSidebar />
      <SidebarInset>
        <DashboardHeader />
        <main className="flex-1 p-6">{children}</main>
      </SidebarInset>
    </SidebarProvider>
  )
}
