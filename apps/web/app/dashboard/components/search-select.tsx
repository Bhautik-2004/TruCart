"use client"

import { useMemo, useRef, useState } from "react"
import { Input } from "@workspace/ui/components/input"

export interface SearchSelectOption {
  value: string
  label: string
  sublabel?: string
}

interface SearchSelectProps {
  options: SearchSelectOption[]
  value: string
  onChange: (value: string) => void
  placeholder?: string
}

/** A searchable "pick by name" dropdown that resolves to an underlying id — used
 * anywhere a form needs a foreign key (customer, product, ...) without asking
 * the user to type a UUID. */
export function SearchSelect({ options, value, onChange, placeholder }: SearchSelectProps) {
  const [query, setQuery] = useState("")
  const [open, setOpen] = useState(false)
  const containerRef = useRef<HTMLDivElement>(null)

  const selected = options.find((o) => o.value === value)

  const filtered = useMemo(() => {
    if (!query.trim()) return options.slice(0, 20)
    const q = query.toLowerCase()
    return options
      .filter((o) => o.label.toLowerCase().includes(q) || o.sublabel?.toLowerCase().includes(q))
      .slice(0, 20)
  }, [options, query])

  function handleBlur() {
    setTimeout(() => setOpen(false), 150)
  }

  return (
    <div className="relative" ref={containerRef}>
      <Input
        placeholder={placeholder}
        value={open ? query : selected?.label || ""}
        onChange={(e) => {
          setQuery(e.target.value)
          if (value) onChange("")
        }}
        onFocus={() => { setOpen(true); setQuery("") }}
        onBlur={handleBlur}
      />
      {open && (
        <div className="absolute z-50 mt-1 max-h-56 w-full overflow-y-auto rounded-md border bg-popover shadow-md">
          {filtered.length === 0 ? (
            <p className="px-3 py-2 text-sm text-muted-foreground">No matches</p>
          ) : (
            filtered.map((o) => (
              <button
                key={o.value}
                type="button"
                className="flex w-full flex-col items-start px-3 py-2 text-left text-sm hover:bg-muted"
                onMouseDown={(e) => {
                  e.preventDefault()
                  onChange(o.value)
                  setQuery("")
                  setOpen(false)
                }}
              >
                <span className="font-medium">{o.label}</span>
                {o.sublabel && <span className="text-xs text-muted-foreground">{o.sublabel}</span>}
              </button>
            ))
          )}
        </div>
      )}
    </div>
  )
}
