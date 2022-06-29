#!/bin/bash
# alba4k - 2022

out=$(playerctl status 2> /dev/stdout)

if [ "$out" = "No players found" ]; then
    echo "    "
    exit
elif [ "$out" = "Playing" ]; then
    echo "    "
    exit
elif [ "$out" = "Paused" ] || [ "$out" = "Stopped" ]; then
    echo "    "
    exit
else
    echo "$out"
    exit
fi

