#!/bin/sh
xrandr --output eDP-1 --mode 1920x1200 --pos 0x0 --output DP-3-1 --mode 1920x1080 --pos 3840x0 --output DP-3-3 --primary --mode 1920x1080 --pos 1920x0

setxkbmap -layout ch,de
g413-led -a 770000
nitrogen --restore
killall polybar && polybar &
