#!/bin/sh

MON="eDP-1"
MON_IS_ON=$(hyprctl monitors -j | jq 'any(.[]; .name == "eDP-1")')

if [ "$MON_IS_ON" = "true" ]; then
	hyprctl keyword monitor "$MON,disable"
else
	hyprctl keyword monitor "$MON, 1920x1200@60.00, auto-down, 1"
fi

