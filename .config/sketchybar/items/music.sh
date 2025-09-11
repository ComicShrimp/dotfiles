sketchybar -m --add event song_update com.apple.iTunes.playerInfo

sketchybar -m --add item music q \
            --set music script="$PLUGIN_DIR/music.sh" \
            label.padding_right=10 \
            drawing=off \
            --subscribe music song_update

