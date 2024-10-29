#!/bin/sh

state=$(cat /sys/class/leds/input2::capslock/brightness)

if [[ "$state" == "1" ]]; then
    echo "󰘲 "
fi
