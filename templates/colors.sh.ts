import { ColorScheme } from "../polkadots/types.ts";
import { dec, hex } from "../polkadots/utils.ts";

export const filePath = ".config/colors.sh";

export default (s: ColorScheme) => {
  return `
background='${s.background}'
foreground='${s.foreground}'
cursor='${s.cursor}'
alpha='${s.alpha}'
alpha_dec='${dec(s.alpha)}'
alpha_hex='${hex(s.alpha)}'

# Colors
color0='${s.color0}'
color1='${s.color1}'
color2='${s.color2}'
color3='${s.color3}'
color4='${s.color4}'
color5='${s.color5}'
color6='${s.color6}'
color7='${s.color7}'
color8='${s.color8}'
color9='${s.color9}'
color10='${s.color10}'
color11='${s.color11}'
color12='${s.color12}'
color13='${s.color13}'
color14='${s.color14}'
color15='${s.color15}'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:15,bg:-1,hl:3,fg+:7,bg+:8,hl+:3
    --color info:7,prompt:2,spinner:6,pointer:6,marker:2
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="\${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
`;
};
