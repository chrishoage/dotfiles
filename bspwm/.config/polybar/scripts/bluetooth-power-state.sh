#!/bin/sh

source ~/.config/colors.sh

TOGGLE_STATE='off'

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
	echo "%{F$color8}%{F}"
	TOGGLE_STATE='on'
else
	if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
		echo "%{F$foreground}%{F}"
	fi
	echo "%{F$color4}%{F}"
	TOGGLE_STATE='off'
fi

if [ "$1" = "toggle" ]; then
	bluetoothctl power $TOGGLE_STATE
fi
