#!/bin/sh

blur_size=$(hyprctl getoption decoration:blur:size | grep int | awk "{print \$2}")
blur_passes=$(hyprctl getoption decoration:blur:passes | grep int | awk "{print \$2}")

# Freeze the screen
(hyprpicker -rz; killall slurp) &

sleep 0.03

(sleep 0.05 && hyprctl keyword decoration:blur:size 3) &
(sleep 0.05 && hyprctl keyword decoration:blur:passes 2) &

size=$(slurp -b "#1e1e2eb0" -c "#8957b0ff")

if (( $? == 0 )) && [ "$size" != "" ]; then
    sleep 0.29 # needed to allow the slurp slide-out animation to finish
    grim -g "$size" - | wl-copy -t image/png
    hyprctl notify 5 3000 0 "fontsize:17 Immagine copiata negli appunti!"
fi

hyprctl keyword decoration:blur:size $blur_size
hyprctl keyword decoration:blur:passes $blur_passes

killall -9 hyprpicker

