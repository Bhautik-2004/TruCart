import { NextResponse } from "next/server"

export async function POST(_request: Request, { params }: { params: Promise<{ action_id: string }> }) {
  const { action_id } = await params
  const apiUrl = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

  try {
    const res = await fetch(`${apiUrl}/api/ai-tools/explain/ledger/${action_id}`, { method: "POST" })
    const data = await res.json()
    return NextResponse.json(data, { status: res.status })
  } catch (error) {
    return NextResponse.json({ error: error instanceof Error ? error.message : "backend unreachable" }, { status: 502 })
  }
}
