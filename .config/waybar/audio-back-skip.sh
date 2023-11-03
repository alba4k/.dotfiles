#!/bin/sh
# alba4k - 2022

tooltip=$(playerctl metadata --format "{{title}} - {{artist}}")

echo '{"tooltip": "'$tooltip'"}'
