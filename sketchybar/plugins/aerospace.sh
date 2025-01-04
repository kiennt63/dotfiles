#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

source $HOME/dotfiles/sketchybar/plugins/palette.sh

# echo $INFO >>~/test.log

icon_strip=""
# while IFS= read -r app; do
#     icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
# done < <(echo "$INFO" | grep "^$1 " | cut -d' ' -f2-)

# while IFS= read -r app; do
#     icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
# done < <(echo "$INFO" | grep "^$1 " | cut -d' ' -f2-)
has_app=0
while IFS= read -r app; do
    has_app=1
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app") "
done < <(echo "$INFO" | jq -r ".[] | select(.workspace == \"$1\") | .[\"app-name\"]")

# workspace_info=$(echo "$INFO" | grep "^$1 " | cut -d' ' -f2-)
# if [ -n "$workspace_info" ]; then
#     local apps=($workspace_info)
#     for app in "${apps[@]}"; do
#         icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
#     done
# fi

if [[ $has_app = 1 ]]; then
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set $NAME background.drawing=on \
            background.color=${PALETTE5} \
            label="$icon_strip" \
            label.padding_right=15
    else
        sketchybar --set $NAME background.drawing=off \
            label="$icon_strip" \
            label.padding_right=15
    fi
else
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set $NAME background.drawing=on \
            background.color=${PALETTE5} \
            label.padding_right=0 \
            label="$icon_strip"
    else
        sketchybar --set $NAME background.drawing=off \
            label.padding_right=0 \
            label="$icon_strip"
    fi
fi
