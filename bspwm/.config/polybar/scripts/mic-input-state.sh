#!/bin/sh

MIC_MUTED=$(pamixer --default-source --get-mute | grep -c 'true')

if [ "$MIC_MUTED" = "0" ]; then
	echo ""
else
	echo ""
fi
