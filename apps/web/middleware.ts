import { NextResponse } from "next/server"
import type { NextRequest } from "next/server"
import { verifySession, SESSION_COOKIE } from "./lib/session"

export async function middleware(request: NextRequest) {
  const token = request.cookies.get(SESSION_COOKIE)?.value
  const session = await verifySession(token)
  if (session) return NextResponse.next()

  if (request.nextUrl.pathname.startsWith("/api/")) {
    return NextResponse.json({ error: "unauthorized" }, { status: 401 })
  }
  const url = request.nextUrl.clone()
  url.pathname = "/login"
  url.search = ""
  return NextResponse.redirect(url)
}

export const config = {
  // Gate the dashboard and the agent-run / simulate proxies. Auth routes and
  // /login stay open.
  matcher: [
    "/dashboard/:path*",
    "/api/agents/:path*",
    "/api/simulate/:path*",
    "/api/ledger/:path*",
  ],
}
