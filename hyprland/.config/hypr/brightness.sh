#!/bin/bash
# usage: brightness.sh +10% or 10%-
brightnessctl set "$1"
VAL=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$((VAL * 100 / MAX))
notify-send "Brightness" "$PERCENT%"

