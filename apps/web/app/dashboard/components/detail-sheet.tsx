"use client"

import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
  SheetFooter,
} from "@workspace/ui/components/sheet"
import { Button } from "@workspace/ui/components/button"

interface DetailField {
  label: string
  value: string | React.ReactNode
  className?: string
}

interface DetailSheetProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  title: string
  description?: string
  fields: DetailField[]
  actions?: {
    label: string
    onClick: () => void
    variant?: "default" | "destructive" | "outline"
    icon?: React.ReactNode
  }[]
}

export function DetailSheet({
  open,
  onOpenChange,
  title,
  description,
  fields,
  actions,
}: DetailSheetProps) {
  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent side="right" className="w-full sm:max-w-md">
        <SheetHeader>
          <SheetTitle>{title}</SheetTitle>
          {description && <SheetDescription>{description}</SheetDescription>}
        </SheetHeader>
        <div className="flex-1 overflow-y-auto px-4">
          <div className="space-y-4">
            {fields.map((field) => (
              <div key={field.label} className={field.className}>
                <p className="text-sm font-medium text-muted-foreground">
                  {field.label}
                </p>
                <div className="mt-1 text-sm">{field.value}</div>
              </div>
            ))}
          </div>
        </div>
        {actions && actions.length > 0 && (
          <SheetFooter>
            <div className="flex gap-2 w-full">
              {actions.map((action) => (
                <Button
                  key={action.label}
                  variant={action.variant || "default"}
                  onClick={action.onClick}
                  className="flex-1"
                >
                  {action.icon}
                  {action.label}
                </Button>
              ))}
            </div>
          </SheetFooter>
        )}
      </SheetContent>
    </Sheet>
  )
}
