import { SidebarTrigger } from "@workspace/ui/components/sidebar"
import { Separator } from "@workspace/ui/components/separator"
import { Avatar, AvatarFallback } from "@workspace/ui/components/avatar"
import { BreadcrumbNav } from "./breadcrumb-nav"

export function DashboardHeader() {
  return (
    <header className="sticky top-0 z-50 flex h-16 shrink-0 items-center gap-2 border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 px-4">
      <SidebarTrigger className="-ml-1" />
      <Separator orientation="vertical" className="mr-2 h-4" />
      <BreadcrumbNav />
      <div className="ml-auto flex items-center gap-2">
        <Avatar className="size-8">
          <AvatarFallback>U</AvatarFallback>
        </Avatar>
      </div>
    </header>
  )
}
