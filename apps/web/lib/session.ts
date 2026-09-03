import { SignJWT, jwtVerify, type JWTPayload } from "jose"

const secretString =
  process.env.SESSION_SECRET || "dev-only-insecure-secret-change-me"

if (!process.env.SESSION_SECRET) {
  if (process.env.NODE_ENV === "production") {
    throw new Error("SESSION_SECRET must be set in production")
  }
  // eslint-disable-next-line no-console
  console.warn("[session] SESSION_SECRET not set — using an insecure dev fallback")
}

const secret = new TextEncoder().encode(secretString)

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
    .sign(secret)
}

export async function verifySession(
  token: string | undefined,
): Promise<JWTPayload | null> {
  if (!token) return null
  try {
    const { payload } = await jwtVerify(token, secret)
    return payload
  } catch {
    return null
  }
}
