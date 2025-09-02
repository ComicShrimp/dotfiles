#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
            icon.color=0xff24273a \
            background.color=0xfff5a97f \
            click_script="aerospace workspace $1"
else
    sketchybar --set $NAME \
        icon.color=0xffffffff \
        background.color=0xee1c1c1e \
        click_script="aerospace workspace $1"
fi
