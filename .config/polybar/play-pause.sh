#!/bin/bash

out=$(playerctl status 2> /dev/stdout)

if [ "$out" = "No players found" ]; then
    echo ""
    exit
elif [ "$out" = "Playing" ]; then
    echo ""
    exit
elif [ "$out" = "Paused" ]; then
    echo ""
    exit
fi

