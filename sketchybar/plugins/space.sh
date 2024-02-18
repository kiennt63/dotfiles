#!/bin/sh

source $HOME/dotfiles/sketchybar/plugins/palette.sh

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=${PALETTE1} \
                         label.color=${PALETTE0} \
                         icon.color=${PALETTE0}
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=${PALETTE1} \
                         icon.color=${PALETTE1}
fi
