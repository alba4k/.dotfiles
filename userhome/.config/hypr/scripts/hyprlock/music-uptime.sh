#!/bin/sh
# alba4k - 2023

playerctl=$(playerctl -a status 2>/dev/null)
if echo "$playerctl" | grep Playing >/dev/null; then
    playerctl -p "spotify,*" metadata --format "󰎆  {{title}} - {{artist}}" 2>/dev/null | python -c "import html; print(html.escape(input()))" ||
        playerctl metadata --format "󰎆  {{title}} - {{artist}}" | python -c "import html; print(html.escape(input()))"
else
    echo -n "󱎫  "
    uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users?.*//; s/days/giorni/; s/day/giorno/; s/min/min./; s/([[:digit:]]+):0?([[:digit:]]+)/\1 ore, \2 min./;'
fi

