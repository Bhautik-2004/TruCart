"use client"

import { useEffect, useState } from "react"

export function useSupabaseQuery<T>(
  queryFn: () => Promise<{ data: T | null; error: Error | null }>
) {
  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<Error | null>(null)

  useEffect(() => {
    let cancelled = false

    async function fetchData() {
      setLoading(true)
      const { data, error } = await queryFn()
      if (!cancelled) {
        setData(data)
        setError(error)
        setLoading(false)
      }
    }

    fetchData()
    return () => { cancelled = true }
  }, [queryFn])

  return { data, loading, error }
}
