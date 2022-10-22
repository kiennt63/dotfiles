#!/bin/sh
for id in $(xinput --list | \
    sed -n '/Logitech G304.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
	xinput --set-prop $id "libinput Accel Profile Enabled" 0, 1
done
