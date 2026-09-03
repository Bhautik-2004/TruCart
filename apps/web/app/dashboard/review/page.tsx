import { createServerClient } from "../../../lib/supabase-server"
import { getSessionUser } from "../../../lib/auth"
import ReviewClient from "./review-client"

export const dynamic = "force-dynamic"

export default async function ReviewPage() {
  const supabase = createServerClient()
  const sessionUser = await getSessionUser()

  const { data: reviewItems } = await supabase
    .from("review_queue")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(30)

  return <ReviewClient items={reviewItems || []} reviewerId={sessionUser?.id ?? null} />
}
