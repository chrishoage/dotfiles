#!/bin/sh

source ~/.cache/wal/colors.sh

BLUETOOTH_POWERED=$(bluetoothctl show 3C:6A:A7:43:D2:6B | grep "Powered: yes" | wc -c)
TOGGLE_STATE='off'

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F$color8}%{F}"
  TOGGLE_STATE='on'
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then
    echo "%{F$foreground}%{F}"
  fi
  echo "%{F$color4}%{F}"
  TOGGLE_STATE='off'
fi

if [ "$1" = "toggle" ]; then
  bluetoothctl power $TOGGLE_STATE
fi
