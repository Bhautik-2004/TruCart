import { NextResponse } from "next/server"

const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

export async function POST() {
  try {
    const res = await fetch(`${API}/api/ledger/verify`, {
      method: "POST",
      signal: AbortSignal.timeout(30000),
    })
    return NextResponse.json(await res.json(), { status: res.status })
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "backend unreachable" },
      { status: 502 },
    )
  }
}
