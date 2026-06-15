#!/bin/bash

cycle() {
  case "$(powerprofilesctl get)" in
    performance) powerprofilesctl set balanced ;;
    balanced)    powerprofilesctl set power-saver ;;
    power-saver) powerprofilesctl set performance ;;
  esac
}

icon() {
  case "$(powerprofilesctl get)" in
    performance) echo '{"text": "󰓅", "tooltip": "Performance"}' ;;
    balanced)    echo '{"text": "󰈐", "tooltip": "Balanced"}' ;;
    power-saver) echo '{"text": "󰌪", "tooltip": "Power Saver"}' ;;
  esac
}

case "$1" in
  cycle) cycle ;;
  *)     icon ;;
esac
