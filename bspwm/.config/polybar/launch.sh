#!/usr/bin/env bash

# The identifier of the hwmon and thermnal zone of the cpu
# package changes between reboots, so we must search for
# the correct sys link and send it to polybar
get_cpu_package_hwmon() {
	for i in /sys/class/hwmon/hwmon*/temp*_input; do
		local label="$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))"
		if [ "$label" = "k10temp: Tctl" ]; then
			echo $(readlink -f $i)
			break
		fi
	done
}

export CPU_PACKAGE_HWMON="$(get_cpu_package_hwmon)"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	xrandr --query | grep " connected" | while read line; do
		display=$(echo $line | cut -d" " -f1)
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
