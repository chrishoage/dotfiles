#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  xrandr --query | grep " connected" | while read line; do
    display=$(echo $line  | cut -d" " -f1)
    bar="secondary"
    if echo $line | grep -q "primary"; then
      bar="primary"
    fi
    MONITOR=$display polybar --reload $bar &
  done
else
  polybar --reload primary &
fi

echo "Bars launched..."

