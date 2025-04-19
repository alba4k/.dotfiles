#!/bin/sh

# Freeze the screen
(hyprpicker -rz; killall slurp) &

sleep 0.03

(sleep 0.05 && hyprctl keyword decoration:blur:size 2) &
(sleep 0.05 && hyprctl keyword decoration:blur:passes 1) &

size=$(slurp -b "#1e1e2eb0" -c "#8957b0ff" &)

slurp_pid=$!
slurp_return=$?

hyprctl keyword decoration:blur:size 5
hyprctl keyword decoration:blur:passes 3

wait $slurp_pid
echo HII

killall -9 hyprpicker

if (( $slurp_return != 0 )); then
    echo $slurp_return
    exit
elif [ "$size" != "" ]; then
    grim -g "$size" - | wl-copy -t image/png
    hyprctl notify 5 3000 0 "fontsize:17 Immagine copiata negli appunti!"
fi
