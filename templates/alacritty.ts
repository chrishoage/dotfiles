import { ColorScheme } from "../polkadots/types.ts";
import { dec } from "../polkadots/utils.ts";

export const filePath = ".config/alacritty/colors.yml";

export default (s: ColorScheme) => {
  return `
window:
  opacity: ${dec(s.alpha)}
colors:
  transparent_background_colors: true
  background: '${s.background}'
  foreground: '${s.foreground}'

  cursor:
    cursor: '${s.cursor}'

  normal:
    black:   '${s.color0}'
    red:     '${s.color1}'
    green:   '${s.color2}'
    yellow:  '${s.color3}'
    blue:    '${s.color4}'
    magenta: '${s.color5}'
    cyan:    '${s.color6}'
    white:   '${s.color7}'

  bright:
    black:   '${s.color8}'
    red:     '${s.color9}'
    green:   '${s.color10}'
    yellow:  '${s.color11}'
    blue:    '${s.color12}'
    magenta: '${s.color13}'
    cyan:    '${s.color14}'
    white:   '${s.color15}'
`;
};
