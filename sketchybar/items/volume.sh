#!/bin/sh

sketchybar --add item volume right \
    --subscribe volume volume_change \
    --subscribe volume mouse.scrolled \
    --subscribe volume mouse.clicked \
    --set volume script="$PLUGIN_DIR/volume.sh"
