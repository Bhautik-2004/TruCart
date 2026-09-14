import { NextResponse } from "next/server"
import { cookies } from "next/headers"
import { signSession, SESSION_COOKIE, SESSION_MAX_AGE } from "../../../../lib/session"

export async function POST(request: Request) {
  const body = await request.json().catch(() => null)
  if (!body?.email || !body?.password) {
    return NextResponse.json({ detail: "Email and password are required." }, { status: 400 })
  }

  const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"
  let res: Response
  try {
    res = await fetch(`${apiUrl}/api/auth/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email: body.email, password: body.password }),
    })
  } catch {
    return NextResponse.json({ detail: "Could not reach the auth service." }, { status: 502 })
  }

  const data = await res.json().catch(() => null)
  if (!res.ok || !data?.user) {
    return NextResponse.json({ detail: data?.detail ?? "Login failed." }, { status: res.status || 401 })
  }

  const token = await signSession(data.user)
  const jar = await cookies()
  const isHttps =
    request.headers.get("x-forwarded-proto") === "https" || new URL(request.url).protocol === "https:"
  jar.set(SESSION_COOKIE, token, {
    httpOnly: true,
    sameSite: "lax",
    path: "/",
    maxAge: SESSION_MAX_AGE,
    secure: isHttps,
  })

  return NextResponse.json({ user: data.user })
}
