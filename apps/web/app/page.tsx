import Link from "next/link"
import { Button } from "@workspace/ui/components/button"
import {
  Package,
  ShoppingCart,
  Headphones,
  TrendingUp,
  Megaphone,
  Truck,
} from "lucide-react"

const agents = [
  { icon: Package, name: "Inventory" },
  { icon: ShoppingCart, name: "Orders" },
  { icon: Headphones, name: "Support" },
  { icon: TrendingUp, name: "Pricing" },
  { icon: Megaphone, name: "Marketing" },
  { icon: Truck, name: "Logistics" },
]

export default function Page() {
  return (
    <div className="flex min-h-svh flex-col justify-between px-6 py-6">
      <div className="flex flex-1 flex-col items-center justify-center gap-6">
        {/* Logo & Title */}
        <div className="flex items-center gap-2.5">
          <Package className="size-7" />
          <h1 className="text-xl font-bold tracking-tight">TruCart</h1>
        </div>

        {/* Tagline */}
        <p className="text-muted-foreground max-w-md text-center text-sm leading-relaxed">
          AI-powered e-commerce operations. Six autonomous agents manage
          inventory, orders, support, pricing, marketing, and logistics.
        </p>

        {/* Buttons */}
        <div className="flex gap-2.5">
          <Link href="/login">
            <Button
              size="default"
              variant="outline"
              className="border border-black px-6 text-xs font-semibold text-black hover:bg-black hover:text-white dark:border-white dark:text-white dark:hover:bg-white dark:hover:text-black"
            >
              Login
            </Button>
          </Link>
        </div>

        {/* Agent Badges */}
        <div className="flex flex-wrap justify-center gap-2">
          {agents.map((agent) => (
            <div
              key={agent.name}
              className="bg-muted/60 flex items-center gap-1.5 rounded-full px-2.5 py-1"
            >
              <agent.icon className="size-3" />
              <span className="text-[10px] font-medium">{agent.name}</span>
            </div>
          ))}
        </div>

        {/* Dark mode hint */}
        <p className="text-muted-foreground font-mono text-[10px]">
          press{" "}
          <kbd className="rounded border bg-muted px-1 py-0.5 text-[9px]">
            d
          </kbd>{" "}
          for dark mode
        </p>
      </div>

      {/* Footer */}
      <footer className="flex items-center justify-between">
        <p className="text-muted-foreground text-[12px]">
          Bhautik Vaghamshi &amp; Daksh Patel
        </p>

        <a
          href="https://github.com/your-repo/trucart"
          target="_blank"
          rel="noopener noreferrer"
          className="text-muted-foreground hover:text-foreground text-[12px] transition-colors"
        >
          GitHub
        </a>
      </footer>
    </div>
  )
}
