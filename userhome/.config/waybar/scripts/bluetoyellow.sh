#!/bin/sh

class="disconnected"

# This file is updated in ~/.config/hypr/hyprland/monitors.lua and ~/.config/hypr/scripts/ddcutil.sh
if [ -s "/tmp/ddcutil" ]; then
    class="connected"
fi

echo '{"text": " ", "class": "'$class'" }'
