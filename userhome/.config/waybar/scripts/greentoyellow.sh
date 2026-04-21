#!/bin/sh

class="disconnected"

if (hyprctl monitors | grep eDP-1 >/dev/null) || (ddcutil --bus 14 getvcp 10 --brief >/dev/null) || (ddcutil --bus 12 getvcp 10 --brief >/dev/null) || (ddcutil --bus 13 getvcp 10 --brief >/dev/null) || (ddcutil --bus 15 getvcp 10 --brief >/dev/null); then
    class="connected"
fi

echo '{"text": " ", "class": "'$class'" }'
