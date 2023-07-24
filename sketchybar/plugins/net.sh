#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

# sketchybar --set $NAME label=$LABEL
if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected"
else
  sketchybar --set $NAME label="$SSID"
fi