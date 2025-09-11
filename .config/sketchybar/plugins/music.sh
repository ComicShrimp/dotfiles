#!/usr/bin/env bash
# Check if Music app is running
APP_STATE=$(pgrep -x Music)
if [[ ! $APP_STATE ]]; then
    sketchybar -m --set music drawing=off
    exit 0
fi

PLAYER_STATE=$(osascript -e "tell application \"Music\" to get player state as text")
if [[ $PLAYER_STATE == "stopped" ]]; then
    sketchybar -m --set music drawing=off
    exit 0
fi

# Get track info
title=$(osascript -e 'tell application "Music" to get name of current track')
artist=$(osascript -e 'tell application "Music" to get artist of current track')

sketchybar -m --set music \
  label="$artist - $title" \
  drawing=on

