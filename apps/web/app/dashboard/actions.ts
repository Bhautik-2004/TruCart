"use server"

import { revalidatePath } from "next/cache"
import { createServerClient } from "../../lib/supabase-server"

function getSupabase() {
  return createServerClient()
}

export async function markAllNotificationsRead() {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("notifications")
    .update({ is_read: true })
    .eq("is_read", false)
  if (error) throw error
  revalidatePath("/dashboard/notifications")
}

export async function markNotificationRead(notificationId: string) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("notifications")
    .update({ is_read: true })
    .eq("notification_id", notificationId)
  if (error) throw error
  revalidatePath("/dashboard/notifications")
}

export async function deleteNotification(notificationId: string) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("notifications")
    .delete()
    .eq("notification_id", notificationId)
  if (error) throw error
  revalidatePath("/dashboard/notifications")
}

export async function updateReviewStatus(
  reviewId: string,
  status: "approved" | "rejected",
  opts?: { reviewerId?: string | null; note?: string | null }
) {
  const supabase = getSupabase()

  const { data: item, error: fetchError } = await supabase
    .from("review_queue")
    .select("*")
    .eq("review_id", reviewId)
    .maybeSingle()
  if (fetchError) throw fetchError
  if (!item) throw new Error("Review item not found")
  if (item.status !== "pending") throw new Error(`Review item already ${item.status}`)

  const nowIso = new Date().toISOString()
  const approve = status === "approved"

  const { error: updateError } = await supabase
    .from("review_queue")
    .update({
      status,
      reviewed_by: opts?.reviewerId ?? null,
      review_note: opts?.note ?? null,
      reviewed_at: nowIso,
    })
    .eq("review_id", reviewId)
  if (updateError) throw updateError

  // Cascade the decision into the referenced domain table.
  if (item.item_type === "purchase_order") {
    await supabase
      .from("purchase_orders")
      .update(
        approve
          ? { status: "approved", approved_by: opts?.reviewerId ?? null, approved_at: nowIso }
          : { status: "rejected" }
      )
      .eq("po_id", item.reference_id)
  } else if (item.item_type === "price_change") {
    if (approve) {
      const { data: history } = await supabase
        .from("price_history")
        .select("product_id, new_price")
        .eq("history_id", item.reference_id)
        .maybeSingle()
      if (history) {
        await supabase
          .from("products")
          .update({ current_price: history.new_price })
          .eq("product_id", history.product_id)
      }
    }
    // reject: the price_history row stays as a rejected-proposal record; no product mutation.
  } else if (item.item_type === "refund") {
    const payload = item.payload || {}
    const orderId = payload.order_id ?? item.reference_id
    const ticketId = payload.ticket_id
    if (approve) {
      if (orderId) {
        await supabase
          .from("orders")
          .update({ status: "cancelled", payment_status: "refunded" })
          .eq("order_id", orderId)
      }
      if (ticketId) {
        await supabase
          .from("support_tickets")
          .update({
            status: "resolved",
            resolution: payload.resolution_text ?? null,
            confidence_score: payload.confidence_score ?? null,
            resolved_at: nowIso,
          })
          .eq("ticket_id", ticketId)
      }
    } else if (ticketId) {
      await supabase
        .from("support_tickets")
        .update({ status: "resolved", resolution: "Refund request rejected by reviewer.", resolved_at: nowIso })
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
          resolution: approve
            ? (payload.resolution_text ?? "Reviewed and approved by staff.")
            : "Reviewed and closed by staff.",
          resolved_at: nowIso,
        })
        .eq("ticket_id", ticketId)
    }
  }

  revalidatePath("/dashboard/review")
  revalidatePath("/dashboard/pricing")
  revalidatePath("/dashboard/inventory")
  revalidatePath("/dashboard/orders")
  revalidatePath("/dashboard/support")
}

export async function updateTicketStatus(
  ticketId: string,
  status: string
) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("support_tickets")
    .update({ status, updated_at: new Date().toISOString() })
    .eq("ticket_id", ticketId)
  if (error) throw error
  revalidatePath("/dashboard/support")
}

export async function insertTicket(data: {
  subject: string
  description: string
  priority: string
  category: string
  customer_id: string
  order_id: string | null
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("support_tickets").insert({
    subject: data.subject,
    description: data.description,
    priority: data.priority,
    category: data.category,
    customer_id: data.customer_id,
    order_id: data.order_id || null,
    status: "open",
    assigned_to_agent: "support_agent",
  })
  if (error) throw error
  revalidatePath("/dashboard/support")
}

export async function insertTicketMessage(data: {
  ticket_id: string
  sender_type: string
  content: string
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("ticket_messages").insert({
    ticket_id: data.ticket_id,
    sender_type: data.sender_type,
    message_content: data.content,
  })
  if (error) throw error
  await supabase
    .from("support_tickets")
    .update({ updated_at: new Date().toISOString() })
    .eq("ticket_id", data.ticket_id)
  revalidatePath("/dashboard/support")
}

export async function insertCampaign(data: {
  name: string
  type: string
  segment: string
  budget: number
  content_body: string
  content_subject: string
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("campaigns").insert({
    name: data.name,
    type: data.type,
    segment: data.segment,
    budget: data.budget,
    content_body: data.content_body,
    content_subject: data.content_subject,
    status: "draft",
    created_by_agent: "manual",
  })
  if (error) throw error
  revalidatePath("/dashboard/marketing")
}

export async function insertProduct(data: {
  name: string
  sku: string
  category: string
  base_price: number
  current_price: number
  cost_price: number
  weight_kg: number | null
  description: string
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("products").insert({
    name: data.name,
    sku: data.sku,
    category: data.category,
    base_price: data.base_price,
    current_price: data.current_price,
    cost_price: data.cost_price,
    weight_kg: data.weight_kg,
    description: data.description,
    status: "active",
  })
  if (error) throw error
  revalidatePath("/dashboard/inventory")
}

export async function updateStoreConfig(key: string, value: string) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("store_config")
    .upsert(
      { config_key: key, config_value: JSON.stringify(value) },
      { onConflict: "config_key" }
    )
  if (error) throw error
  revalidatePath("/dashboard/settings")
}

export async function updateOrderStatus(
  orderId: string,
  status: string
) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("orders")
    .update({ status, updated_at: new Date().toISOString() })
    .eq("order_id", orderId)
  if (error) throw error
  revalidatePath("/dashboard/orders")
}
