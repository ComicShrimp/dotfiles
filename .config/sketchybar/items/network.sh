#!/bin/sh

attr_network=(
  icon=$WIFI_CONNECTED
  icon.color=$YELLOW
  icon.padding_left=6
  icon.padding_right=6
  icon.font="SF Pro:SemiBold:14.0"
  label.font="SF Pro:Semibold:13.0"
  label.width=0
  update_freq=30
  script="$PLUGIN_DIR/network.sh"
)

attr_net_bat=(
  background.color=$NETS_RIGHT
  background.border_color=$NETS_BORDER
)

sketchybar    -m    --add         item      network     right                                 \
                    --set                   network     "${attr_network[@]}"                  \
                    --subscribe             network     wifi_change                           \
                                                        mouse.clicked                         \
                                                                                              \
                    --add         net_bat     network                                         \
                                                        net_spr                               \
                                                        battery                               \
                    --set                   net_bat     "${attr_net_bat[@]}" 