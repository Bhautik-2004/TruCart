import { NextResponse } from "next/server"
import { createServerClient } from "../../../lib/supabase-server"

export async function GET() {
  const supabase = createServerClient()

  const { data, error } = await supabase
    .from("shipments")
    .select("*, orders(order_number, shipping_address_id)")
    .order("created_at", { ascending: false })
    .limit(20)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  return NextResponse.json({ shipments: data || [] })
}
