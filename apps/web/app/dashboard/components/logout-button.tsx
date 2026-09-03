"use client"

import {
  SidebarMenuButton,
} from "@workspace/ui/components/sidebar"
import { LogOut } from "lucide-react"

export function LogoutButton() {
  return (
    <SidebarMenuButton
      onClick={async () => {
        try {
          await fetch("/api/auth/logout", { method: "POST" })
        } catch {
          // ignore — still clear client state and redirect
        }
        localStorage.removeItem("user")
        window.location.href = "/login"
      }}
    >
      <LogOut />
      <span>Log out</span>
    </SidebarMenuButton>
  )
}
