#!/bin/sh

MIC_MUTED=$(pulseaudio-ctl full-status | cut -d" " -f3)

if [ "$MIC_MUTED" = "no" ]; then
  echo ""
else
  echo ""
fi

