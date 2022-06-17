#!/bin/sh
xrandr --output DP-1-1 --mode 1920x1080 --pos 1920x0 --output DP-1-3 --primary --mode 1920x1080 --pos 0x0 --output eDP-1 --off

setxkbmap -layout ch,de
g413-led -a b00000
nitrogen --restore
