#!/bin/sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.drawing=off \
        icon=$sid \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.padding_left=0 \
        label.padding_right=0 \
        click_script="sketchybar --reload" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
