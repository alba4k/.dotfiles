#!/bin/sh

class="disconnected"

if hyprctl monitors | grep eDP-1 >/dev/null; then
    class="connected"
fi

echo '{"text": " ", "class": "'$class'" }'
