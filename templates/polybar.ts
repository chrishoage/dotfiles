import { color } from "https://deno.land/x/chroma/index.ts";
import { ColorScheme } from "../polkadots/types.ts";
import { dec } from "../polkadots/utils.ts";

export const filePath = ".config/polybar/colors.ini";

export default (s: ColorScheme) => {
  return `
background="${
    color(s.background).alpha(dec(s.alpha))
      .hex("argb")
  }"
foreground="${s.foreground}"
color0="${s.color0}"
color1="${s.color1}"
color2="${s.color2}"
color3="${s.color3}"
color4="${s.color4}"
color5="${s.color5}"
color6="${s.color6}"
color7="${s.color7}"
color8="${s.color8}"
color9="${s.color9}"
color10="${s.color10}"
color11="${s.color11}"
color12="${s.color12}"
color13="${s.color13}"
color14="${s.color14}"
color15="${s.color15}"
`;
};
