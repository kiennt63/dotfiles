#!/bin/sh

sketchybar --add item front_app left \
           --set front_app       background.color=${BG0} \
                                 padding_left=10 \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.padding_right=10 \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
