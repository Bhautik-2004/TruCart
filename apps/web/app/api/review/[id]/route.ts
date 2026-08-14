import { NextResponse } from "next/server"
import { createServerClient } from "../../../../lib/supabase-server"

export async function PATCH(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const { action, reviewer_id, note } = await request.json()

  if (action !== "approve" && action !== "reject") {
    return NextResponse.json({ error: "action must be 'approve' or 'reject'" }, { status: 400 })
  }

  const supabase = createServerClient()

  const { data: item, error: fetchError } = await supabase
    .from("review_queue")
    .select("*")
    .eq("review_id", id)
    .maybeSingle()

  if (fetchError) {
    return NextResponse.json({ error: fetchError.message }, { status: 500 })
  }
  if (!item) {
    return NextResponse.json({ error: "review item not found" }, { status: 404 })
  }
  if (item.status !== "pending") {
    return NextResponse.json({ error: `review item already ${item.status}` }, { status: 409 })
  }

  const newStatus = action === "approve" ? "approved" : "rejected"

  const { error: updateError } = await supabase
    .from("review_queue")
    .update({
      status: newStatus,
      reviewed_by: reviewer_id ?? null,
      review_note: note ?? null,
      reviewed_at: new Date().toISOString(),
    })
    .eq("review_id", id)

  if (updateError) {
    return NextResponse.json({ error: updateError.message }, { status: 500 })
  }

  // Cascade the decision into the referenced table.
  if (item.item_type === "purchase_order") {
    if (action === "approve") {
      await supabase
        .from("purchase_orders")
        .update({ status: "approved", approved_by: reviewer_id ?? null, approved_at: new Date().toISOString() })
        .eq("po_id", item.reference_id)
    } else {
      await supabase.from("purchase_orders").update({ status: "rejected" }).eq("po_id", item.reference_id)
    }
  } else if (item.item_type === "price_change") {
    if (action === "approve") {
      const { data: history } = await supabase
        .from("price_history")
        .select("product_id, new_price")
        .eq("history_id", item.reference_id)
        .maybeSingle()
      if (history) {
        await supabase.from("products").update({ current_price: history.new_price }).eq("product_id", history.product_id)
      }
    }
    // reject: the proposed price_history row stays as a rejected-proposal record; no product mutation.
  } else if (item.item_type === "refund") {
    const payload = item.payload || {}
    const orderId = payload.order_id ?? item.reference_id
    const ticketId = payload.ticket_id
    if (action === "approve") {
      if (orderId) {
        await supabase.from("orders").update({ status: "cancelled", payment_status: "refunded" }).eq("order_id", orderId)
      }
      if (ticketId) {
        await supabase
          .from("support_tickets")
          .update({ status: "resolved", resolution: payload.resolution_text ?? null, confidence_score: payload.confidence_score ?? null, resolved_at: new Date().toISOString() })
          .eq("ticket_id", ticketId)
      }
    } else if (ticketId) {
      await supabase
        .from("support_tickets")
        .update({ status: "resolved", resolution: "Refund request rejected by reviewer.", resolved_at: new Date().toISOString() })
        .eq("ticket_id", ticketId)
    }
  } else if (item.item_type === "other") {
    const payload = item.payload || {}
    const ticketId = payload.ticket_id ?? item.reference_id
    if (ticketId) {
      await supabase
        .from("support_tickets")
        .update({
          status: "resolved",
          resolution: action === "approve" ? (payload.resolution_text ?? "Reviewed and approved by staff.") : "Reviewed and closed by staff.",
          resolved_at: new Date().toISOString(),
        })
        .eq("ticket_id", ticketId)
    }
  }

  return NextResponse.json({ status: "ok", review_id: id, item_type: item.item_type, cascaded: true })
}
