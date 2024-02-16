#!/bin/sh

echo ">> Switching monitor layout to '3MCasa'..."

hyprctl keyword monitor eDP-1,1920x1200@60,0x0,1
#hyprctl keyword monitor DP-7,1920x1080@72,1920x0,1
#hyprctl keyword monitor DP-5,1920x1080@72,3840x0,1
hyprctl keyword monitor "DP-7, modeline 210.25 1920 2056 2256 2592 1080 1083 1088 1128 -hsync +vsync, 1920x0, 1"
hyprctl keyword monitor "DP-7, modeline 210.25 1920 2056 2256 2592 1080 1083 1088 1128 -hsync +vsync, 3840x0, 1"

echo ">> SUCCESS"

