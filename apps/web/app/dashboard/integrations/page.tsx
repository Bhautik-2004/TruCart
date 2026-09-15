import IntegrationsClient from "./integrations-client"

export const dynamic = "force-dynamic"

const API = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000"

async function getJson(path: string) {
  try {
    const res = await fetch(`${API}${path}`, { cache: "no-store", signal: AbortSignal.timeout(4000) })
    return res.ok ? await res.json() : null
  } catch {
    return null
  }
}

export default async function IntegrationsPage() {
  const status = await getJson("/api/integrations/status")

  return <IntegrationsClient status={status} backendDown={status === null} />
}
