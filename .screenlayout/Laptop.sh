#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --off --output DP-3-1 --off --output DP-1-2 --off --output DP-3-3 --off

setxkbmap -layout ch,de
nitrogen --restore
killall polybar && polybar &
