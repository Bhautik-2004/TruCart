import { NextResponse } from "next/server"

const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

export async function POST(request: Request) {
  try {
    const body = await request.json()
    const res = await fetch(`${apiUrl}/api/ai-tools/report`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    })
    const data = await res.json()
    return NextResponse.json(data, { status: res.status })
  } catch (error) {
    return NextResponse.json({ error: error instanceof Error ? error.message : "backend unreachable" }, { status: 502 })
  }
}

export async function GET() {
  try {
    const res = await fetch(`${apiUrl}/api/ai-tools/report`)
    const data = await res.json()
    return NextResponse.json(data, { status: res.status })
  } catch (error) {
    return NextResponse.json({ error: error instanceof Error ? error.message : "backend unreachable" }, { status: 502 })
  }
}
