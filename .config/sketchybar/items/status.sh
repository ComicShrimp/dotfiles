#!/bin/sh

attr_cpu_percent=(
	label.font="$FONT_LABEL:Heavy:12"
	label=CPU%
	label.color="$LABEL_COLOR"
	icon="$CPU"
	icon.color="$BLUE"
	update_freq=3
	script="$PLUGIN_DIR/status/cpu.sh"
)


attr_memory=(
  label.font="$FONT_LABEL:Heavy:12"
	label.color="$TEXT"
	icon="$MEMORY"
	icon.font="$FONT_LABEL:Bold:16.0"
	icon.color="$GREEN"
	update_freq=3
	script="$PLUGIN_DIR/status/memory.sh"
)


attr_disk=(
	label.font="$FONT_LABEL:Heavy:12"
	label.color="$TEXT"
	icon="$DISK"
	icon.font="$FONT_LABEL:Bold:16"
	icon.color="$MAROON"
	update_freq=60
	script="$PLUGIN_DIR/status/disk.sh"
)


attr_network_down=(
	icon="$NETWORK_DOWN"
	icon.font="$FONT_LABEL:Bold:13.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	label="0.00Mbps"
	label.font="$FONT_LABEL:Heavy:10"
	label.color="$TEXT"
)

attr_network_up=(
	icon="$NETWORK_UP"
	icon.font="$FONT_LABEL:Bold:13.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	label="0.00Mbps"
	label.font="$FONT_LABEL:Heavy:10"
	label.color="$TEXT"
	update_freq=2
	script="$PLUGIN_DIR/status/network.sh"
)



attr_system_status=(
	icon.font="$FONT_LABEL:Regular:16.0"
	icon.padding_right=10
	background.corner_radius=7
	background.padding_right=10
  label.drawing=off
	label.padding_right=10
	icon.color="$TEXT"
  updates=on
  script="$PLUGIN_DIR/status.sh"
)

sketchybar	-m	--add         item    cpu.stats       right 					                      \
										--set                 cpu.stats       "${attr_cpu_percent[@]}"              \
																																																\
																																																\
										--add         item    memory          right 		                            \
										--set                 memory          "${attr_memory[@]}"                   \
																																																\
										--add         item    disk            right 		                            \
										--set                 disk            "${attr_disk[@]}"                     \
																																																\
										--add         item    network.down    right 						                    \
										--set                 network.down    "${attr_network_down[@]}" 	          \
																																																\
										--add         item    network.up      right 							                  \
										--set                 network.up      "${attr_network_up[@]}"
