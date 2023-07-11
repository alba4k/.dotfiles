#!/bin/sh
img=/tmp/swaylock.png

if [ "$1" = "from-rofi" ]; then
    # time for rofi fade-out before taking the screenshot
    sleep 0.4
fi

grim -c $img
#convert $img -scale 5% -scale 2000% $img
convert $img -blur 0x20 $img

# requires swaylock-effects
swaylock --image $img\
    --clock\
    --fade-in 1\
    --indicator-radius 120\
    --indicator\
    --show-failed-attempts\
    --daemonize\
    --screenshots
    # --ignore-empty-password\ # not using this because of fprintd

