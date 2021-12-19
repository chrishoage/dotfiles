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
pkill dunst
dunst-daemon &

# ===================
# ===== polybar =====
# ===================

# Restart polybar to pick up new alpha
$HOME/.config/polybar/launch.sh
