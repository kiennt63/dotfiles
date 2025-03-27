#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/colors.css $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT # defer

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
