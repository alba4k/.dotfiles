#!/bin/sh

if [ "$1" = "delay" ]; then
    # time for rofi/swaylock fade-out before taking the screenshot
    sleep 0.4
fi

if [ "$2" = "now" ]; then
    time=0
else
    time=0.7
fi


# img=/tmp/swaylock.png

# grim is slightly faster lol
# grimblast --cursor save output $img
# time grim -c -o DP-7 $img || grim -c -o eDP-1 $img

# convert $img -scale 5% -scale 2000% $img
# convert $img -blur 0x30 $img
# convert $img -scale 10% -blur 0x3 -resize 1000% $img

# requires swaylock-effects
swaylock\
    --screenshot\
    --effect-blur 13x13\
    --clock\
    --fade-in $time\
    --indicator-radius 150\
    --indicator\
    --show-failed-attempts\
    --daemonize
    #--image $img

