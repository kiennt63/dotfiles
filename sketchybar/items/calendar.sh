#!/bin/sh

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          label="$(date +'%a %d %b %I:%M %p')"
