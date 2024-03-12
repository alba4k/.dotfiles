#!/bin/sh
# alba4k - 2022

tooltip=$(playerctl -p "spotify,*" metadata --format "[{{playerName}}] {{title}} - {{artist}}")

echo '{"tooltip": "'$tooltip'"}'
