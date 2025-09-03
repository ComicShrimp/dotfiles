#!/bin/sh

# Icon mapping for common applications
APP_NAME="$INFO"

case $APP_NAME in
    "Code")
        ICON="󰨞"
        ;;
    "Discord")
        ICON="󰙯"
        ;;
    "Google Chrome")
        ICON="󰊯"
        ;;
    "Safari")
        ICON="󰀹"
        ;;
    "Firefox")
        ICON="󰈹"
        ;;
    "Terminal")
        ICON="󰆍"
        ;;
    "Ghostty")
        ICON="󰆍"
        ;;
    "Finder")
        ICON="󰀶"
        ;;
    "Music")
        ICON="󰎆"
        ;;
    "Xcode")
        ICON="󰙳"
        ;;
    "Docker")
        ICON="󰡨"
        ;;
    "System Preferences")
        ICON="󰒓"
        ;;
    "System Settings")
        ICON="󰒓"
        ;;
    "Activity Monitor")
        ICON="󰖚"
        ;;
    *)
        # Default icon for unknown applications
        ICON="$APP_NAME"
        ;;
esac

sketchybar    -m    --set   "$NAME"     icon.padding_right=5 \
                    --set   "$NAME"    label="$INFO"
