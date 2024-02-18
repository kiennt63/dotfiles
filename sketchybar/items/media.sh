#!/bin/sh

sketchybar --add item media e \
           --set media label.color=${PALETTE1} \
                       label.max_chars=50 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=${PALETTE1}   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
