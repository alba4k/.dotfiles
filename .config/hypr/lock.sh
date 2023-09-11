#!/bin/sh

if [ "$1" = "from-rofi" ]; then
    # time for rofi fade-out before taking the screenshot
    sleep 0.4
fi

if [ "$1" = "from-idle" ]; then
    # Workaround for dpms off
    img=/tmp/swaylock-idle.png
else
    img=/tmp/swaylock.png
    grim -c $img
fi

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

