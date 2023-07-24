#!/usr/bin/env sh
RUNNING=$(osascript -e 'if application "Music" is running then return 0')
if [ "$RUNNING" == "" ]; then
  RUNNING=1
fi
PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""
if [ "$(osascript -e 'if application "Music" is running then tell application "Music" to get player state')" == "playing" ]; then
  PLAYING=0
  TRACK=$(osascript -e 'tell application "Music" to get name of current track')
  ARTIST=$(osascript -e 'tell application "Music" to get artist of current track')
  ALBUM=$(osascript -e 'tell application "Music" to get album of current track')
fi
if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
  if [ "$ARTIST" == "" ]; then
    sketchybar --set $NAME label="$TRACK - $ALBUM" --set '/music.*/' drawing=on
  else
    sketchybar --set $NAME label="$TRACK - $ARTIST" --set '/music.*/' drawing=on
  fi
else
  sketchybar --set '/music.*/' drawing=off
fi
