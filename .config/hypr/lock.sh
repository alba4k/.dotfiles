#!/bin/sh

if [ "$1" = "delay" ]; then
    # time for rofi fade-out before taking the screenshot
    sleep 0.45
fi

img=/tmp/swaylock.png

# grim is slightly faster lol
# grimblast save output $img
grim -o DP-7 $img || grim -o eDP-1 $img

#convert $img -scale 5% -scale 2000% $img
#convert $img -blur 0x30 $img
time convert $img -scale 10% -blur 0x3 -resize 1000% $img

# requires swaylock-effects
swaylock --image $img\
    --clock\
    --fade-in 1\
    --indicator-radius 120\
    --indicator\
    --show-failed-attempts\
    --daemonize\

