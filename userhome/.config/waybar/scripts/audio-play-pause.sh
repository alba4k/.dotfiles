#!/bin/sh
# alba4k - 2022

out=$(playerctl -p "spotify" status 2>&1 || playerctl status 2>&1)
status="  "
tooltip=$(playerctl -p "spotify,*" metadata --format "[{{playerName}}] {{title}} - {{artist}}" || playerctl metadata --format "[{{playerName}}] {{title}} - {{artist}}")

if echo "$out" | grep "Playing" >/dev/null; then
    status="  "
elif echo "$out" | grep "Paused" >/dev/null; then
    status="  "
fi

echo '{"text": "'$status'", "tooltip": "'$tooltip'"}'
