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
  status: "approved" | "rejected"
) {
  const supabase = getSupabase()
  const { error } = await supabase
    .from("review_queue")
    .update({ status, reviewed_at: new Date().toISOString() })
    .eq("review_id", reviewId)
  if (error) throw error
  revalidatePath("/dashboard/review")
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
  customer_id: string
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("support_tickets").insert({
    subject: data.subject,
    description: data.description,
    priority: data.priority,
    customer_id: data.customer_id,
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
  description: string
}) {
  const supabase = getSupabase()
  const { error } = await supabase.from("products").insert({
    name: data.name,
    sku: data.sku,
    category: data.category,
    base_price: data.base_price,
    current_price: data.current_price,
    cost_price: data.base_price,
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
