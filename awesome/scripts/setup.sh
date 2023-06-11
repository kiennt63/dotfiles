#!/bin/bash

# setup dual monitor
num_monitor=$(xrandr | grep " connected " | awk '{ print$1 }' | wc -l)

if [[ $num_monitor -ge 2 ]]; then
    xrandr --output DP-2 --mode 1920x1080 --rate 239.76
    xrandr --output DP-3 --mode 3840x2160 --rate 60 --right-of DP-2
    xrdb $HOME/dotfiles/reso/Xresources_4K
else
    xrandr --output DP-2 --mode 1920x1080 --rate 239.76
    xrdb $HOME/dotfiles/reso/Xresources_1080p
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
