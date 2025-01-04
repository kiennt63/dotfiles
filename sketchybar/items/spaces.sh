#!/bin/sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid space_windows_change \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        padding_left=0 \
        padding_right=0 \
        icon=$sid \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.padding_left=0 \
        label.padding_right=0 \
        background.color=${PALETTE5} \
        background.drawing=off \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

sketchybar --add bracket spaces '/space\..*/' background.height=30
