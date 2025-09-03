#!/bin/sh

source $CONFIG_DIR/colors.sh
source $CONFIG_DIR/icons.sh
source $CONFIG_DIR/settings.sh

attr_front_app=(
    background.color=$ITEM_BG
    label.drawing=yes
    icon="|"
    script="$PLUGIN_DIR/front_app.sh" 
    background.height=20
)

sketchybar  -m  --add       item        front_app               left                        \
                --set                   front_app               "${attr_front_app[@]}"      \
                                                                                            \
                --add        front_app                   \
                --subscribe front_app   front_app_switched
