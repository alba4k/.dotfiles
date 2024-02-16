#!/bin/sh

echo ">> Switching monitor layout to 'Laptop'..."

hyprctl keyword monitor eDP-1,1920x1200@60,0x0,1

hyprctl keyword monitor DP-5,disabled
hyprctl keyword monitor DP-7,disabled

echo ">> SUCCESS"

