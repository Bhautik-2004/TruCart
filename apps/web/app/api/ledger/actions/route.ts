import { NextResponse } from "next/server"

const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

export async function GET(request: Request) {
  const incoming = new URL(request.url).searchParams
  const qs = new URLSearchParams()
  for (const k of ["agent", "grade", "action_type", "limit"]) {
    const v = incoming.get(k)
    if (v) qs.set(k, v)
  }
  try {
    const res = await fetch(`${API}/api/ledger/actions?${qs.toString()}`, {
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
