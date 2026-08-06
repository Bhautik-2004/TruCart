import { createClient } from "@supabase/supabase-js";

// Publishable key is NOT auto-detected by the Supabase client, so it is
// passed explicitly here. Do not expose SERVICE_ROLE keys in the browser.
export const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!
);