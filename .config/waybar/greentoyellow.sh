#!/bin/sh

text=" "
class="disconnected"

if hyprctl monitors | grep eDP-1 >/dev/null; then
    text=""
    class="connected"
fi

echo '{"text": "'$text'", "class": "'$class'" }'
