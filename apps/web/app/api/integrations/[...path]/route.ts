import { NextResponse } from "next/server"

const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

async function proxy(request: Request, path: string[]) {
  const { search } = new URL(request.url)
  const target = `${apiUrl}/api/integrations/${path.join("/")}${search}`
  const init: RequestInit = { method: request.method }
  if (request.method !== "GET" && request.method !== "HEAD") {
    init.headers = { "Content-Type": "application/json" }
    init.body = await request.text()
  }
  try {
    const res = await fetch(target, init)
    const data = await res.json()
    return NextResponse.json(data, { status: res.status })
  } catch (error) {
    return NextResponse.json({ error: error instanceof Error ? error.message : "backend unreachable" }, { status: 502 })
  }
}

export async function GET(request: Request, { params }: { params: Promise<{ path: string[] }> }) {
  return proxy(request, (await params).path)
}

export async function POST(request: Request, { params }: { params: Promise<{ path: string[] }> }) {
  return proxy(request, (await params).path)
}
