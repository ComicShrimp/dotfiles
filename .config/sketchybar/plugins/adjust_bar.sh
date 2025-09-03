#!/bin/bash

MONITOR_NAME=$(aerospace list-monitors --json | jq -r '.[] | select(.["monitor-id"]==1) | .["monitor-name"]')

# Replace these names and heights with your actual monitor names and desired heights.
if [[ "$MONITOR_NAME" == "Built-in Retina Display" ]]; then
  # Built-in display, e.g., MacBook with notch
  sketchybar --bar height=32 # or 48, or whatever fits your notch perfectly
  sketchybar --default background.height=28
else
  # External monitor
  sketchybar --bar height=25
  sketchybar --default background.height=20
fi

