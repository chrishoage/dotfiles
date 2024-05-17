#!/bin/sh

HEADPHONES_DEFAULT=$(pactl info | sed -n 's/Default Sink: //p' | grep -c alsa_output.pci-0000_03_00.1.hdmi-stereo)
source ~/.config/colors.sh

if [ "$HEADPHONES_DEFAULT" = "0" ]; then
	echo "%{F$color8}%{F}"
else
	echo "%{F$color4}%{F}"
fi

if [ "$1" = "toggle" ]; then
	pa-switch alsa_output.pci-0000_03_00.1.hdmi-stereo alsa_output.usb-Vanatoo_Vanatoo_T0P_CTUA170405-00.analog-stereo
fi
