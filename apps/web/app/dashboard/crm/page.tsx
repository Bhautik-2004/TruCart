import CrmClient from "./crm-client"

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

export default async function CrmPage() {
  const segments = await getJson("/api/ai-tools/crm/segments")

  return (
    <CrmClient
      customers={segments?.customers ?? []}
      segmentCounts={segments?.segment_counts ?? {}}
      backendDown={segments === null}
    />
  )
}
