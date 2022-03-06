import { ColorScheme } from "./types.ts";

export function dec(alpha: number): number {
  return alpha / 100;
}

export function hex(alpha: number): string {
  return Math.floor(dec(alpha) * 255).toString(16).toUpperCase();
}

export function loadColorScheme(filePath: string): ColorScheme {
  const decoder = new TextDecoder("utf-8");
  const json = JSON.parse(decoder.decode(Deno.readFileSync(filePath)));

  return ColorScheme.parse(json);
}
