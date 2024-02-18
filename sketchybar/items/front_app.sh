#!/bin/sh

sketchybar --add item front_app left \
           --set front_app       background.color=${PALETTE1} \
                                 icon.color=${PALETTE0} \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=${PALETTE0} \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
