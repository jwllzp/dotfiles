#!/bin/bash

WIDTH_PCNT=66

info_o=$(hyprctl activewindow | grep -E "at:|size:")
height=$(echo "$info_o" | grep "size:" | cut -d' ' -f2 | cut -d',' -f2)
x_o=$(echo "$info_o" | grep "at:" | cut -d' ' -f2 | cut -d',' -f1)
y_o=$(echo "$info_o" | grep "at:" | cut -d' ' -f2 | cut -d',' -f2)

hyprctl dispatch togglefloating

is_floating=$(hyprctl activewindow | grep "floating:" | grep -o "[0-9]")

if [ "$is_floating" = "1" ]; then
    
    hyprctl dispatch resizeactive exact ${WIDTH_PCNT}% $height
	hyprctl dispatch centerwindow

	info_f=$(hyprctl activewindow | grep -E "at:|size:")
	x_f=$(echo "$info_f" | grep "at:" | cut -d' ' -f2 | cut -d',' -f1)
	y_f=$(echo "$info_f" | grep "at:" | cut -d' ' -f2 | cut -d',' -f2)

	hyprctl dispatch moveactive exact $x_f $y_o
fi
