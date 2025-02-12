#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
    VOLUME="$INFO"

    case "$VOLUME" in
    [6-9][0-9] | 100)
        ICON="􀊩"
        ;;
    [3-5][0-9])
        ICON="􀊥"
        ;;
    [1-9] | [1-2][0-9])
        ICON="􀊡"
        ;;
    *) ICON="􀊣" ;;
    esac

    sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
elif [ "$SENDER" = "mouse.scrolled" ]; then
    delta=$(echo $INFO | grep -o '"delta": [0-9-]*' | awk '{print $2}')
    if (( delta > 0 )); then
        osascript -e "set volume output volume ((output volume of (get volume settings)) + 5)"
    elif (( delta < 0 )); then
        osascript -e "set volume output volume ((output volume of (get volume settings)) - 5)"
    fi

elif [ "$SENDER" = "mouse.clicked" ]; then
    osascript -e "set volume output muted not (output muted of (get volume settings))"
fi
