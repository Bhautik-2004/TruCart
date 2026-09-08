import { NextResponse } from "next/server"

const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

export async function GET() {
  try {
    const res = await fetch(`${API}/api/ledger/summary`, {
      cache: "no-store",
      signal: AbortSignal.timeout(4000),
    })
    return NextResponse.json(await res.json(), { status: res.status })
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "backend unreachable" },
      { status: 502 },
    )
  }
}
