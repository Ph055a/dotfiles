#!/usr/bin/env bash
# Start one polybar on every connected screen (i3 runs this on start and reload)
killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.2; done
if command -v xrandr >/dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main >/tmp/polybar-$m.log 2>&1 &
  done
else
  polybar --reload main >/tmp/polybar.log 2>&1 &
fi
