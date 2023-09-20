#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log
polybar top >> /tmp/polybar1.log 2>&1 &

# Count the number of connected screens using xrandr
connected_screens=$(xrandr --query | grep ' connected' | wc -l)

# If we have more than one screen connected, run polybar external
if (( connected_screens > 1 )); then
    polybar external >> /tmp/polybar2.log 2>&1 &
fi

echo "Bars launched..."

