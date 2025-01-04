#!/usr/bin/env bash

source $HOME/dotfiles/sketchybar/plugins/palette.sh

if [[ $SENDER = "space_windows_change" ]]; then
    WIN_STATUS=$(aerospace list-windows --all --json --format "%{app-name} %{workspace}")

    has_app=0
    while IFS= read -r app; do
        has_app=1
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app") "
    done < <(echo "$WIN_STATUS" | jq -r ".[] | select(.workspace == \"$1\") | .[\"app-name\"]")

    if [[ $has_app = 1 ]]; then
        sketchybar --set $NAME \
            label="$icon_strip" \
            label.padding_right=15
    else
        sketchybar --set $NAME \
            label.padding_right=0 \
            label="$icon_strip"
    fi
elif [[ $SENDER = "aerospace_workspace_change" ]]; then
    if [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
        sketchybar --set $NAME background.drawing=on
    else
        sketchybar --set $NAME background.drawing=off
    fi
fi
