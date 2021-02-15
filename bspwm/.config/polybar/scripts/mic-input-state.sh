#!/bin/sh

MIC_SOURCE=$(pactl info | sed -En 's/Default Source: (.*)/\1/p')
MIC_MUTED=$(pactl list sources | grep $MIC_SOURCE -A 12 | grep -c 'Mute: yes')

if [ "$MIC_MUTED" = "0" ]; then
  echo ""
else
  echo ""
fi
