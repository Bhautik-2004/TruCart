import { cookies } from "next/headers"
import { SESSION_COOKIE, verifySession, type SessionUser } from "./session"

/**
 * Resolve the authenticated user from the signed `trucart_session` cookie.
 * For use in Server Components and server actions only (it reads `next/headers`);
 * middleware.ts does its own lighter-weight check. Returns null when there is no
 * valid session.
 */
export async function getSessionUser(): Promise<SessionUser | null> {
  const token = (await cookies()).get(SESSION_COOKIE)?.value
  const payload = await verifySession(token)
  if (!payload?.sub) return null
  return {
    id: String(payload.sub),
    email: typeof payload.email === "string" ? payload.email : "",
    full_name: typeof payload.full_name === "string" ? payload.full_name : "",
    role: typeof payload.role === "string" ? payload.role : "",
  }
}
