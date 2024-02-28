#!/bin/sh

echo ">> Switching monitor layout to '2MCasa'..."

#hyprctl keyword monitor DP-5,1920x1080@72,0x0,1
#hyprctl keyword monitor DP-7,1920x1080@72,1920x0,1
hyprctl keyword monitor "DP-5, modeline 210.25 1920 2056 2256 2592 1080 1083 1088 1128 -hsync +vsync, 0x0, 1"
hyprctl keyword monitor "DP-7, modeline 210.25 1920 2056 2256 2592 1080 1083 1088 1128 -hsync +vsync, 1920x0, 1"


hyprctl keyword monitor eDP-1,disabled

echo ">> SUCCESS"

