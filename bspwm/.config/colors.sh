background='#242B2E'
foreground='#D4D4D4'
cursor='#C0C5CE'
alpha='80'
alpha_dec='0.8'
alpha_hex='CC'

# Colors
color0='#1B2B34'
color1='#E15A60'
color2='#99C794'
color3='#FAC863'
color4='#6699CC'
color5='#C594C5'
color6='#5FB3B3'
color7='#C0C5CE'
color8='#65737E'
color9='#E15A60'
color10='#99C794'
color11='#FAC863'
color12='#6699CC'
color13='#C594C5'
color14='#5FB3B3'
color15='#D8DEE9'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:15,bg:-1,hl:3,fg+:7,bg+:8,hl+:3
    --color info:7,prompt:2,spinner:6,pointer:6,marker:2
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
