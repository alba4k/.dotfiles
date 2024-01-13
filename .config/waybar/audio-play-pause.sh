#!/bin/sh
# alba4k - 2022

out=$(playerctl status 2>&1)
status="  "
tooltip=$(playerctl metadata --format "[{{playerName}}] {{title}} - {{artist}}")

if [ "$out" = "Playing" ]; then
    status="  "
elif [ "$out" = "Paused" ] || [ "$out" = "Stopped" ]; then
    status="  "
fi

echo '{"text": "'$status'", "tooltip": "'$tooltip'"}'
