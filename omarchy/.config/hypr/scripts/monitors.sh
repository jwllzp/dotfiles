#!/usr/bin/env bash

LAPTOP="eDP-1"
LAPTOP_ENABLED=$(
    hyprctl monitors -j |
        jq -e ".[] | select(.name == \"$LAPTOP\")" >/dev/null &&
        echo 1 || echo 0
)

if [ "$LAPTOP_ENABLED" -eq 1 ]; then
    hyprctl keyword monitor "$LAPTOP,disable"
else
    hyprctl keyword monitor "$LAPTOP,preferred,auto,2"
fi
