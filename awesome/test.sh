#!/bin/bash

for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		"Full") status="full" ;;
		"Discharging") status="discharging" ;;
		"Charging") status="charging" ;;
		"Not charging") status="not-charging" ;;
		"Unknown") status="unknown" ;;
		*) exit 1 ;;
	esac
	icon=""
	capacity="$(cat "$battery/capacity" 2>&1)"
	if   [ "${status}" = "full" ]; then 
		icon="  "
	elif [ "${status}" = "charging" ]; then 
		icon=" "
	elif [ "$capacity" -ge 80 ]; then 
		icon="  "
	elif [ "$capacity" -ge 40 ]; then 
		icon="  "
	else									 
		icon="  "
	fi

	# Will make a warn variable if discharging and low
	[ "$status" = "" ] && [ "$capacity" -le 25 ] && warn=""
	# Prints the info
	printf "%s %s%%%s" "$icon" "$capacity" " $pwr"; unset warn
done && printf "\\n"