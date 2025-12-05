#!/bin/bash
# usage: volume.sh +5% or 5%-
wpctl set-volume --limit 1.0 @DEFAULT_SINK@ "$1"
VAL=$(wpctl get-volume @DEFAULT_SINK@ | awk '{printf "%.0f\n", $2*100}')
notify-send "Volume" "$VAL%"

