#!/bin/bash

if [ $(whoami) = "root" ]; then
    HOME="/home/alba4k" XDG_CONFIG_HOME="/home/alba4k/.config" uptime-record -b &

    #echo 3s > /sys/devices/platform/dell-laptop/leds/dell::kbd_backlight/stop_timeout
    # /home/alba4k/.local/bin/performance
    # /home/alba4k/.local/bin/powersave
else
    echo "Please run this screept as root, possibly trough systemd."
    exit 1
fi
