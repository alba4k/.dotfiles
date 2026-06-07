#!/bin/sh
# alba4k - 2026

class="connected"

# This file is updated in ~/.config/hypr/hyprland/monitors.lua and ~/.config/hypr/scripts/ddcutil.sh
if [ ! -s "/tmp/ddcutil" ]; then
    percentage=""
    class="disconnected"
else
    percentage=$(ddcutil --bus $(head -n 1 /tmp/ddcutil) getvcp 10 --terse | awk '{print $4}')
fi

echo '{"percentage": '$percentage', "class": "'$class'"}'
