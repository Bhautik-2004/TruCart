"use client"

import {
  SidebarMenuButton,
} from "@workspace/ui/components/sidebar"
import { LogOut } from "lucide-react"

export function LogoutButton() {
  return (
    <SidebarMenuButton
      onClick={() => {
        localStorage.removeItem("user")
        window.location.href = "/login"
      }}
    >
      <LogOut />
      <span>Log out</span>
    </SidebarMenuButton>
  )
}
