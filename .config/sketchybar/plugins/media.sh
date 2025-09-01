#!/bin/sh

DISPLAY_CONTROLS=$1

get_media_info() {
  if command -v nowplaying-cli >/dev/null 2>&1; then
    TITLE=$(nowplaying-cli get title 2>/dev/null || echo "")
    ARTIST=$(nowplaying-cli get artist 2>/dev/null || echo "")
    ALBUM=$(nowplaying-cli get album 2>/dev/null || echo "")
    STATE=$(nowplaying-cli get playbackRate 2>/dev/null || echo "0")
    DURATION=$(nowplaying-cli get duration 2>/dev/null || echo "0")
    POSITION=$(nowplaying-cli get elapsedTime 2>/dev/null || echo "0")
  else
    # Fallback to osascript for basic functionality
    TITLE=$(osascript -e 'tell application "System Events" to get name of first process whose background only is false' 2>/dev/null || echo "")
    ARTIST=""
    ALBUM=""
    STATE="0"
    DURATION="0"
    POSITION="0"
  fi
}

format_time() {
  local seconds=$1
  if [ "$seconds" = "" ] || [ "$seconds" = "0" ]; then
    echo "0:00"
  else
    printf "%d:%02d" $((seconds / 60)) $((seconds % 60))
  fi
}

update_media() {
  get_media_info
  
  if [ "$TITLE" = "" ]; then
    sketchybar --set media.anchor drawing=off
    return
  fi
  
  sketchybar --set media.anchor drawing=on
  
  # Update text info
  sketchybar --set media.title label="$TITLE"
  sketchybar --set media.artist label="$ARTIST"
  sketchybar --set media.album label="$ALBUM"
  
  # Update play/pause icon
  if [ "$STATE" = "1" ]; then
    PLAY_ICON="􀊆"  # Pause icon
  else
    PLAY_ICON="􀊄"  # Play icon
  fi
  
  if [ "$DISPLAY_CONTROLS" = "true" ]; then
    sketchybar --set media.play icon="$PLAY_ICON"
  fi
  
  # Update time and progress
  if [ "$DURATION" != "0" ] && [ "$POSITION" != "" ]; then
    PERCENTAGE=$(echo "scale=2; $POSITION * 100 / $DURATION" | bc 2>/dev/null || echo "0")
    sketchybar --set media.state slider.percentage="$PERCENTAGE" \
                                 icon="$(format_time $POSITION)" \
                                 label="$(format_time $DURATION)"
  fi
}

handle_click() {
  case "$NAME" in
    "media.play")
      if command -v nowplaying-cli >/dev/null 2>&1; then
        nowplaying-cli togglePlayPause
      else
        osascript -e 'tell application "System Events" to keystroke space'
      fi
      ;;
    "media.next")
      if command -v nowplaying-cli >/dev/null 2>&1; then
        nowplaying-cli next
      else
        osascript -e 'tell application "System Events" to key code 124 using {command down}'
      fi
      ;;
    "media.back")
      if command -v nowplaying-cli >/dev/null 2>&1; then
        nowplaying-cli previous
      else
        osascript -e 'tell application "System Events" to key code 123 using {command down}'
      fi
      ;;
  esac
  update_media
}

case "$SENDER" in
  "mouse.clicked") handle_click ;;
  *) update_media ;;
esac