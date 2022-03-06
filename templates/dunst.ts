import { color } from "https://deno.land/x/chroma/index.ts";
import { ColorScheme } from "../polkadots/types.ts";
import { dec } from "../polkadots/utils.ts";

export const filePath = ".config/dunst/dunstrc.d/10-colors.conf";

export default (s: ColorScheme) => {
  const background = color(s.background).alpha(dec(s.alpha)).hex("rgba");
  return `
[urgency_low]
  background = "${background}"
  foreground = "${s.foreground}"
  frame_color = "${s.color4}"
[urgency_normal]
  background = "${background}"
  foreground = "${s.foreground}"
  frame_color = "${s.color4}"
[urgency_critical]
  background = "${background}"
  foreground = "${s.foreground}"
  frame_color = "${s.color1}"
`;
};
