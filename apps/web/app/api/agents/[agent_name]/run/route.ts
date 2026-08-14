import { NextResponse } from "next/server"

export async function POST(_request: Request, { params }: { params: Promise<{ agent_name: string }> }) {
  const { agent_name } = await params
  const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

  try {
    const res = await fetch(`${apiUrl}/api/agents/${agent_name}/run`, { method: "POST" })
    const data = await res.json()
    return NextResponse.json(data, { status: res.status })
  } catch (error) {
    return NextResponse.json({ error: error instanceof Error ? error.message : "backend unreachable" }, { status: 502 })
  }
}
