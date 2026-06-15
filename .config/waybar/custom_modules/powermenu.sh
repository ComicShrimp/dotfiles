#!/bin/sh
chosen=$(printf "󰤄 Suspend\n󰜉 Reboot\n󰐥 Shutdown" | rofi -dmenu -p "")
case "$chosen" in
  *Suspend)  systemctl suspend ;;
  *Reboot)   systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
esac
