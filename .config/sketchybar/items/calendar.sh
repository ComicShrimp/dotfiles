#!/bin/sh

attr_calendar=(
  icon=􀉉
  icon.color=0xfff6c177
  icon.padding_right=8
  icon.y_offset=1
  label="$(LC_TIME=pt_BR.UTF-8 date '+%d/%m/%y 􀐫 %H:%M')"
  label.color=0xffe0def4
  padding_left=5

  script="$PLUGIN_DIR/calendar.sh"
  update_freq=30
)

sketchybar    -m    --add     item    calendar    right                   \
                    --set             calendar    "${attr_calendar[@]}"   \
                    --subscribe       calendar system_woke mouse.clicked mouse.entered mouse.exited mouse.exited.global
