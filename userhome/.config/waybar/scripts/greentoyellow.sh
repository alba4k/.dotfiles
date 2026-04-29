#!/bin/sh

class="disconnected"

if (hyprctl monitors | grep eDP-1 >/dev/null) || (ddcutil --bus 14 getvcp 10 --brief >/dev/null) || (ddcutil --bus 12 getvcp 10 --brief >/dev/null) || (ddcutil --bus 16 getvcp 10 --brief >/dev/null) || (ddcutil --bus 17 getvcp 10 --brief >/dev/null) || (ddcutil --bus 19 getvcp 10 --brief >/dev/null) || (ddcutil --bus 20 getvcp 10 --brief >/dev/null); then
    class="connected"
fi

echo '{"text": " ", "class": "'$class'" }'
