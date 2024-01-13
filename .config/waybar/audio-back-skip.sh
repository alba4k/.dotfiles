#!/bin/sh
# alba4k - 2022

tooltip=$(playerctl metadata --format "[{{playerName}}] {{title}} - {{artist}}")

echo '{"tooltip": "'$tooltip'"}'
