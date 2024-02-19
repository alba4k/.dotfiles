#!/bin/sh

if [ "$1" = "delay" ]; then
    # time for rofi fade-out before taking the screenshot
    sleep 0.45
fi

img=/tmp/hyprlock.png

# grim is slightly faster lol
grimblast --cursor save output $img
# time grim -c -o DP-7 $img || grim -c -o eDP-1 $img

# convert $img -scale 5% -scale 2000% $img
# convert $img -blur 0x30 $img
convert $img -scale 10% -blur 0x3 -resize 1000% $img

hyprlock

