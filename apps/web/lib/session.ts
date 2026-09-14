import { SignJWT, jwtVerify, type JWTPayload } from "jose"

const FALLBACK_SECRET = "dev-only-insecure-secret-change-me"
let warnedMissingSecret = false

function getSecret() {
  const secretString = process.env.SESSION_SECRET
  if (!secretString) {
    if (process.env.NODE_ENV === "production") {
      throw new Error("SESSION_SECRET must be set in production")
    }
    if (!warnedMissingSecret) {
      warnedMissingSecret = true
      console.warn("[session] SESSION_SECRET not set — using an insecure dev fallback")
    }
  }
  return new TextEncoder().encode(secretString || FALLBACK_SECRET)
}

export const SESSION_COOKIE = "trucart_session"
export const SESSION_MAX_AGE = 60 * 60 * 8 // 8 hours

export interface SessionUser {
  id: string
  email: string
  full_name: string
  role: string
}

export async function signSession(user: SessionUser): Promise<string> {
  return new SignJWT({
    email: user.email,
    full_name: user.full_name,
    role: user.role,
  })
    .setProtectedHeader({ alg: "HS256" })
    .setSubject(user.id)
    .setIssuedAt()
    .setExpirationTime(`${SESSION_MAX_AGE}s`)
    .sign(getSecret())
}

export async function verifySession(
  token: string | undefined,
): Promise<JWTPayload | null> {
  if (!token) return null
  try {
    const { payload } = await jwtVerify(token, getSecret())
    return payload
  } catch {
    return null
  }
}
