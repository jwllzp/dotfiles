#!/bin/bash
LAPTOP="eDP-1"
MONS=$(hyprctl monitors -j | jq -r '.[].name')

# Detect current states
LAP_ON=$(echo "$MONS" | grep -q "$LAPTOP" && echo 1 || echo 0)

# Cycle logic
if [ "$LAP_ON" -eq 1 ]; then
	hyprctl keyword monitor "eDP-1,disable"
else
	hyprctl keyword monitor "eDP-1, 2880x1800@60, auto-down, 2"
fi
