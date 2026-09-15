"use client"

import { useEffect, useRef, useState } from "react"
import { Button } from "@workspace/ui/components/button"
import { Input } from "@workspace/ui/components/input"
import { Camera, CameraOff } from "lucide-react"

/**
 * Camera-based barcode/QR scanner using @zxing/library (client-side, no paid
 * service). Falls back gracefully to manual text entry when no camera is
 * available or permission is denied, so the lookup flow always works.
 */
export function BarcodeScanner({ onDetect }: { onDetect: (value: string) => void }) {
  const videoRef = useRef<HTMLVideoElement>(null)
  const readerRef = useRef<any>(null)
  const [scanning, setScanning] = useState(false)
  const [manualValue, setManualValue] = useState("")
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    return () => {
      readerRef.current?.reset?.()
    }
  }, [])

  async function startScanning() {
    setError(null)
    try {
      const { BrowserMultiFormatReader } = await import("@zxing/library")
      const reader = new BrowserMultiFormatReader()
      readerRef.current = reader
      setScanning(true)
      await reader.decodeFromVideoDevice(null, videoRef.current!, (result: any) => {
        if (result) {
          onDetect(result.getText())
          stopScanning()
        }
      })
    } catch {
      setError("Camera unavailable — enter the code manually below.")
      setScanning(false)
    }
  }

  function stopScanning() {
    readerRef.current?.reset?.()
    setScanning(false)
  }

  return (
    <div className="space-y-3">
      <div className="relative overflow-hidden rounded-md border bg-black/5 aspect-video max-w-sm">
        {scanning ? (
          <video ref={videoRef} className="h-full w-full object-cover" muted />
        ) : (
          <div className="flex h-full items-center justify-center text-xs text-muted-foreground">Camera off</div>
        )}
      </div>
      <div className="flex gap-2">
        {!scanning ? (
          <Button variant="outline" size="sm" onClick={startScanning}>
            <Camera className="mr-2 size-4" />Start Camera Scan
          </Button>
        ) : (
          <Button variant="outline" size="sm" onClick={stopScanning}>
            <CameraOff className="mr-2 size-4" />Stop
          </Button>
        )}
      </div>
      {error && <p className="text-xs text-muted-foreground">{error}</p>}
      <div className="flex gap-2 max-w-sm">
        <Input
          placeholder="Or type order #, tracking #, or SKU…"
          value={manualValue}
          onChange={(e) => setManualValue(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter" && manualValue.trim()) {
              onDetect(manualValue.trim())
              setManualValue("")
            }
          }}
        />
        <Button
          size="sm"
          onClick={() => {
            if (manualValue.trim()) {
              onDetect(manualValue.trim())
              setManualValue("")
            }
          }}
        >
          Look up
        </Button>
      </div>
    </div>
  )
}
