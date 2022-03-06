import { z } from "https://deno.land/x/zod@v3.12.0/mod.ts";

const hexString = z.string().regex(/#([a-f0-9]{3}){1,2}\b/i);

export const ColorScheme = z.object({
  alpha: z.optional(z.number().min(0).max(100)).default(100),
  background: hexString,
  foreground: hexString,
  cursor: hexString,
  color0: hexString,
  color1: hexString,
  color2: hexString,
  color3: hexString,
  color4: hexString,
  color5: hexString,
  color6: hexString,
  color7: hexString,
  color8: hexString,
  color9: hexString,
  color10: hexString,
  color11: hexString,
  color12: hexString,
  color13: hexString,
  color14: hexString,
  color15: hexString,
});

export type ColorScheme = z.infer<typeof ColorScheme>;
