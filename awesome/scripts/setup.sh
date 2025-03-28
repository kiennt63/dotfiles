#!/bin/bash

# setup dual monitor
num_monitor=$(xrandr | grep " connected " | awk '{ print$1 }' | wc -l)

if [[ 1 -eq 1 ]]; then
    xrandr --output DP-0 --off --output DP-1 --off \
	   --output DP-3 --off --output DP-5 --off --output HDMI-0 --off \
	   --output DP-2 --primary --mode 3840x2160 --rate 60 --pos 2880x0 --rotate normal \
	   --output DP-4 --mode 1920x1080 --rate 239.76 --pos 0x270 --scale 1.5x1.5 --rotate normal
    xrdb -merge ~/dotfiles/.Xresources
else
    xrandr --output DP-4 --mode 1920x1080 --rate 239.76  
fi


# enable tap to click on touchpad
xinput --set-prop 'DELL09E2:00 04F3:30CB Touchpad' 'libinput Tapping Enabled' 1
# enable natural scrolling on touchpad
xinput --set-prop 'DELL09E2:00 04F3:30CB Touchpad' 'libinput Natural Scrolling Enabled' 1

# repeat rate and delay
xset r rate 250 35
xset s off -dpms

# map capslock to escape
# setxkbmap -option caps:escape

# disable mouse accel
for id in $(xinput --list | \
    sed -n '/Logitech G304.*/s/.*=\([0-9]\+\).*/\1/p')
do
    xinput --set-prop $id "libinput Accel Speed" 0.0
    xinput --set-prop $id "libinput Accel Profile Enabled" 0, 1
done

for id in $(xinput --list | sed -n '/Logitech USB Receiver.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
    xinput --set-prop $id "libinput Accel Speed" 0.3
    xinput --set-prop $id "libinput Accel Profile Enabled" 0, 1
done



# redshift
redshift -P -O 3500

# default audio in/out
pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1
pactl set-default-source alsa_input.usb-3142_fifine_Microphone-00.analog-stereo
