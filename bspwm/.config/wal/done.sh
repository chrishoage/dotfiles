#!/bin/sh

# ===================
# ====== bspwm ======
# ===================

# Source the colors from wal
source "${HOME}/.cache/wal/colors.sh"

# Set the border colors
bspc config focused_border_color "$color4"

# ===================
# ====== dunst ======
# ===================

# Restart dunst with the new color scheme
mkdir -p $HOME/.config/dunst/dunstrc.d
ln -sf $HOME/.cache/wal/dunst-colors.conf $HOME/.config/dunst/dunstrc.d/10-colors.conf
pkill dunst
dunst &

# ===================
# ===== polybar =====
# ===================

# Restart polybar to pick up new alpha
$HOME/.config/polybar/launch.sh
