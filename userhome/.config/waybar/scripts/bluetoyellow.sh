#!/bin/sh

class="disconnected"

if (ddcutil --bus 14 getvcp 10 --brief >/dev/null 2>&1) || (ddcutil --bus 12 getvcp 10 --brief >/dev/null 2>&1) || (ddcutil --bus 16 getvcp 10 --brief >/dev/null 2>&1) || (ddcutil --bus 17 getvcp 10 --brief >/dev/null 2>&1) || (ddcutil --bus 19 getvcp 10 --brief >/dev/null 2>&1) || (ddcutil --bus 20 getvcp 10 --brief >/dev/null 2>&1); then
    class="connected"
fi

echo '{"text": " ", "class": "'$class'" }'
