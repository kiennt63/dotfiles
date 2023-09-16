#!/bin/bash

# setup dual monitor
num_monitor=$(xrandr | grep " connected " | awk '{ print$1 }' | wc -l)

if [[ $num_monitor -ge 2 ]]; then
    xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --off \
	   --output DP-2 --primary --mode 3840x2160 --pos 3840x0 --rotate normal \
	   --output DP-3 --off --output HDMI-1 --off \
	   --output DP-4 --mode 1920x1080 --pos 0x0 --scale 2x2 --rotate normal \
	   --output DP-5 --off
else
    xrandr --output DP-2 --mode 1920x1080 --rate 239.76
fi


# enable tap to click on touchpad
xinput --set-prop 'DELL09E2:00 04F3:30CB Touchpad' 'libinput Tapping Enabled' 1
# enable natural scrolling on touchpad
xinput --set-prop 'DELL09E2:00 04F3:30CB Touchpad' 'libinput Natural Scrolling Enabled' 1

# repeat rate and delay
xset r rate 250 35
xset s off -dpms

# map capslock to escape
setxkbmap -option caps:escape

# disable mouse accel
for id in $(xinput --list | \
    sed -n '/Logitech G304.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
	xinput --set-prop $id "libinput Accel Profile Enabled" 0, 1
done

for id in $(xinput --list | sed -n '/Logitech USB Receiver.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
	xinput --set-prop $id "libinput Accel Profile Enabled" 0, 1
done



# redshift
redshift -P -O 3500

xrdb -merge ~/.Xresources
