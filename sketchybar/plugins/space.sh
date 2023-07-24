status=$(yabai -m query --spaces --space "$SID" | jq '.windows | length')

if [[ $status == 0 ]]; then
    ICON=""
else
    ICON=""
fi

sketchybar --set $NAME icon=$ICON icon.highlight=$SELECTED
