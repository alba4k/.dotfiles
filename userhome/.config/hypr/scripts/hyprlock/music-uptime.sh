#!/bin/sh
# alba4k - 2023

playerctl=$(playerctl -a status 2>/dev/null)
if grep "Playing" <<< "$playerctl" >/dev/null; then
    playerctl -p "spotify,*" metadata --format "󰎆  {{title}} - {{artist}}" 2>/dev/null ||
    playerctl metadata --format "󰎆  {{title}} - {{artist}}"
else
    echo -n "󱎫  "
    uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users?.*//; s/days/giorni/; s/day/giorno/; s/min/min./; s/([[:digit:]]+):0?([[:digit:]]+)/\1 ore, \2 min./;'
fi

