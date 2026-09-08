"use server"

import { revalidatePath } from "next/cache"
import { createServerClient } from "../../lib/supabase-server"
import { getSessionUser } from "../../lib/auth"

const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

function getSupabase() {
  return createServerClient()
}

// Throw with a useful message if a Supabase write failed. Used so a review
// cascade cannot silently leave the queue saying "approved" while the domain
// row is unchanged.
function must(result: { error: { message?: string } | null }, what: string) {
  if (result.error) throw new Error(`${what}: ${result.error.message ?? "write failed"}`)
}

export async function updateProfileName(fullName: string) {
  const user = await getSessionUser()
  if (!user) throw new Error("Not authenticated")
  const trimmed = fullName.trim()
  if (!trimmed) throw new Error("Name cannot be empty")
  const supabase = getSupabase()
  const { error } = await supabase
    .from("users")
    .update({ full_name: trimmed })
    .eq("user_id", user.id)
  if (error) throw error
  revalidatePath("/dashboard/settings")
}

export async function changePassword(currentPassword: string, newPassword: string) {
  const user = await getSessionUser()
  if (!user) throw new Error("Not authenticated")
  if (newPassword.length < 8) throw new Error("New password must be at least 8 characters")

  // The FastAPI backend owns password hashing / verification. The user id comes
  // from the verified session JWT, never from the client.
  const res = await fetch(`${API_URL}/api/auth/change-password`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      user_id: user.id,
      current_password: currentPassword,
      new_password: newPassword,
    }),
  })
  if (!res.ok) {
    const data = await res.json().catch(() => null)
    throw new Error(data?.detail ?? "Could not change password")
  }
}

export async function updateAgentConfig(agentName: string, configKey: string, rawValue: string) {
  const user = await getSessionUser()
  if (!user) throw new Error("Not authenticated")
  const trimmed = rawValue.trim()
  // Config values are stored as JSONB scalars (see database/migrations/010,014).
  // Accept a JSON literal (number, "string", true/false); fall back to treating
  // a bare token as a string so "qwen2.5:7b" works without surrounding quotes.
  let value: unknown
  try {
    value = JSON.parse(trimmed)
  } catch {
    value = trimmed
  }
  const supabase = getSupabase()
  const { error } = await supabase
    .from("agent_config")
    .upsert(
      { agent_name: agentName, config_key: configKey, config_value: value },
      { onConflict: "agent_name,config_key" }
    )
  if (error) throw error
  revalidatePath("/dashboard/agents")
}

export async function deactivateAccount() {
  const user = await getSessionUser()
  if (!user) throw new Error("Not authenticated")
  const supabase = getSupabase()
  const { error } = await supabase
    .from("users")
    .update({ is_active: false })
    .eq("user_id", user.id)
  if (error) throw error
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
  opts?: { note?: string | null; makeStandingRule?: boolean }
) {
  const user = await getSessionUser()
  if (!user) throw new Error("Not authenticated")
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
  const note = opts?.note?.trim() || null
  const payload = item.payload || {}

  // --- run the domain cascade FIRST; only flip the queue row if it succeeds ---
  if (item.item_type === "purchase_order") {
    must(
      await supabase
        .from("purchase_orders")
        .update(approve ? { status: "approved", approved_by: user.id, approved_at: nowIso } : { status: "rejected" })
        .eq("po_id", item.reference_id),
      "purchase order",
    )
  } else if (item.item_type === "price_change") {
    if (approve) {
      const { data: history, error: hErr } = await supabase
        .from("price_history")
        .select("product_id, new_price")
        .eq("history_id", item.reference_id)
        .maybeSingle()
      if (hErr) throw hErr
      if (history) {
        must(
          await supabase.from("products").update({ current_price: history.new_price }).eq("product_id", history.product_id),
          "apply price",
        )
      }
    }
  } else if (item.item_type === "refund") {
    const orderId = payload.order_id ?? item.reference_id
    const ticketId = payload.ticket_id
    if (approve && orderId) {
      const { data: ord } = await supabase.from("orders").select("status").eq("order_id", orderId).maybeSingle()
      if (["confirmed", "processing", "shipped"].includes(ord?.status ?? "")) {
        const { error: relErr } = await supabase.rpc("release_order_reservation", { p_order_id: orderId })
        // Tolerate the RPC being absent (migration 016 not yet applied); surface anything else.
        if (relErr && !/function .* does not exist|not found|schema cache/i.test(relErr.message ?? "")) {
          throw new Error(`release reservation: ${relErr.message}`)
        }
      }
      must(
        await supabase.from("orders").update({ status: "cancelled", payment_status: "refunded" }).eq("order_id", orderId),
        "refund order",
      )
    }
    if (ticketId) {
      must(
        await supabase
          .from("support_tickets")
          .update(
            approve
              ? { status: "resolved", resolution: payload.resolution_text ?? null, confidence_score: payload.confidence_score ?? null, resolved_at: nowIso }
              : { status: "resolved", resolution: "Refund request rejected by reviewer.", resolved_at: nowIso },
          )
          .eq("ticket_id", ticketId),
        "resolve ticket",
      )
    }
  } else if (item.item_type === "other") {
    const ticketId = payload.ticket_id ?? item.reference_id
    if (ticketId) {
      must(
        await supabase
          .from("support_tickets")
          .update({
            status: "resolved",
            resolution: approve ? (payload.resolution_text ?? "Reviewed and approved by staff.") : "Reviewed and closed by staff.",
            resolved_at: nowIso,
          })
          .eq("ticket_id", ticketId),
        "close ticket",
      )
    }
  } else if (item.item_type === "campaign") {
    const campaignId = payload.reference_id ?? item.reference_id
    must(
      await supabase
        .from("campaigns")
        .update(approve ? { status: "active", approved_by: user.id, sent_at: nowIso } : { status: "archived" })
        .eq("campaign_id", campaignId),
      "campaign",
    )
  } else if (item.item_type === "shipment_exception") {
    const shipmentId = payload.shipment_id ?? item.reference_id
    must(
      await supabase.from("shipments").update({ status: approve ? "in_transit" : "failed" }).eq("shipment_id", shipmentId),
      "shipment",
    )
  } else if (item.item_type === "order") {
    const orderId = payload.order_id ?? item.reference_id
    if (approve) {
      const { error: rpcError } = await supabase.rpc("confirm_order_and_reserve", { p_order_id: orderId })
      if (rpcError) {
        // Only fall back to a plain confirm if the RPC genuinely isn't installed.
        // A real stock shortage must surface, not silently confirm unreserved stock.
        const msg = rpcError.message ?? ""
        if (/function .* does not exist|not found|schema cache/i.test(msg)) {
          must(await supabase.from("orders").update({ status: "confirmed", confirmed_at: nowIso }).eq("order_id", orderId), "confirm order")
        } else {
          throw new Error(`confirm order: ${msg}`)
        }
      }
    } else {
      must(await supabase.from("orders").update({ status: "cancelled" }).eq("order_id", orderId), "cancel order")
    }
  } else if (item.item_type === "autonomy_adjustment") {
    // Autopilot Ledger proposal: apply the config change on approve.
    if (approve) {
      const { scope, key, to } = payload as { scope?: string; key?: string; to?: number }
      if (scope === "store_config" && key !== undefined) {
        must(
          await supabase.from("store_config").upsert({ config_key: key, config_value: to }, { onConflict: "config_key" }),
          "store_config",
        )
      } else if (scope === "agent_config" && key !== undefined) {
        must(
          await supabase
            .from("agent_config")
            .upsert({ agent_name: payload.agent_name, config_key: key, config_value: to }, { onConflict: "agent_name,config_key" }),
          "agent_config",
        )
      }
    }
  }

  // Attach a standing rule for the agent when the reviewer rejected with a note.
  if (!approve && note && opts?.makeStandingRule && item.agent_name && item.agent_name !== "autopilot_ledger") {
    await supabase.from("agent_policy").insert({
      agent_name: item.agent_name,
      rule_text: note,
      created_from_review_id: reviewId,
    })
  }

  // Mark the linked ledger action as human-touched (best effort).
  if (["price_change", "campaign", "purchase_order"].includes(item.item_type)) {
    await supabase
      .from("agent_action")
      .update({ autonomy: approve ? "human_approved" : "human_rejected" })
      .eq("entity_id", item.reference_id)
      .eq("status", "pending")
  }

  const { error: updateError } = await supabase
    .from("review_queue")
    .update({ status, reviewed_by: user.id, review_note: note, reviewed_at: nowIso })
    .eq("review_id", reviewId)
  if (updateError) throw updateError

  for (const p of ["review", "pricing", "inventory", "orders", "support", "marketing", "logistics", "agents", "ledger"]) {
    revalidatePath(`/dashboard/${p}`)
  }
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
