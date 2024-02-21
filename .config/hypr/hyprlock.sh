#!/bin/sh

if [ "$1" = "delay" ]; then
    # time for rofi/wlogout fade-out before taking the screenshot
    sleep 0.45
fi

img=/tmp/hyprlock

# grim is slightly faster lol
# grimblast --cursor save output $img
grim -c -o DP-5 $img-DP-5.png &
grim -c -o DP-6 $img-DP-6.png &
grim -c -o DP-7 $img-DP-7.png &
grim -c -o DP-9 $img-DP-9.png &
grim -c -o eDP-1 $img-eDP-1.png &

wait

# convert $img -scale 5% -scale 2000% $img
# convert $img -blur 0x30 $img
convert $img-DP-5.png -scale 10% -blur 0x3 -resize 1000% $img-DP-5.png &
convert $img-DP-6.png -scale 10% -blur 0x3 -resize 1000% $img-DP-6.png &
convert $img-DP-7.png -scale 10% -blur 0x3 -resize 1000% $img-DP-7.png &
convert $img-DP-9.png -scale 10% -blur 0x3 -resize 1000% $img-DP-9.png &
convert $img-eDP-1.png -scale 10% -blur 0x3 -resize 1000% $img-eDP-1.png &

wait

hyprlock

