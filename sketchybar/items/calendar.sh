#!/bin/sh

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          padding_right=0 \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
