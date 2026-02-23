#!/bin/sh

hyprpicker -rz &
PID=$!

size=$(slurp)

if (( $? == 0 )) && [ "$size" != "" ]; then
    sleep 0.33 # needed to allow the slurp slide-out animation to finish
    grim -g "$size" - | wl-copy -t image/png
    hyprctl notify 5 3000 0 "fontsize:17 Immagine copiata negli appunti!"
fi

kill $PID

