#!/bin/bash

# setup dual monitor
num_monitor=$(xrandr | grep " connected " | awk '{ print$1 }' | wc -l)


xrandr --output eDP-1-1 --mode 1920x1080
if [[ $(xrandr | grep " connected " | awk '{ print$1 }' | wc -l) -ge 2 ]]; then
    external=$(xrandr --query | grep -A 1 " connected" | head -2 | tail -1 | awk '{ print$1 }')
    if [[ $external = "3840x2160" ]]; then
        xrdb $HOME/dotfiles/reso/Xresources_4K
        xrandr --output HDMI-0 --mode "$external" --rate 60 --right-of eDP-1-1
    else
        xrdb $HOME/dotfiles/reso/Xresources_1080p
        xrandr --output HDMI-0 --mode "$external" --rate 144 --right-of eDP-1-1
    fi
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

# redshift
redshift -O 4500 -v
