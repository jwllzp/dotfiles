#!/usr/bin/env bash
# Windows+P style cycle: both -> external only -> laptop only -> both.

LAPTOP="eDP-1"
SCALE=2

enable()  { hyprctl eval "hl.monitor({ output = \"$1\", mode = \"preferred\", position = \"auto\", scale = $SCALE, disabled = false })" >/dev/null; }
disable() { hyprctl eval "hl.monitor({ output = \"$1\", disabled = true })" >/dev/null; }

# Every connected output, including disabled ones.
mapfile -t EXTERNALS < <(hyprctl monitors all -j | jq -r ".[] | select(.name != \"$LAPTOP\") | .name")
[ ${#EXTERNALS[@]} -eq 0 ] && { notify-send "Monitors" "No external monitor connected"; enable "$LAPTOP"; exit 0; }

laptop_on=$(hyprctl monitors all -j | jq -r ".[] | select(.name == \"$LAPTOP\") | .disabled | not")
ext_on=$(hyprctl monitors all -j | jq -r "[.[] | select(.name != \"$LAPTOP\" and (.disabled | not))] | length > 0")

if [ "$laptop_on" = true ] && [ "$ext_on" = true ]; then
    # both -> external only
    disable "$LAPTOP"
    msg="External only"
elif [ "$ext_on" = true ]; then
    # external only -> laptop only
    enable "$LAPTOP"
    for m in "${EXTERNALS[@]}"; do disable "$m"; done
    msg="Laptop only"
else
    # laptop only -> both
    for m in "${EXTERNALS[@]}"; do enable "$m"; done
    msg="Both monitors"
fi

notify-send -t 1500 "Monitors" "$msg"
