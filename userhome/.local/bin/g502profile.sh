#!/bin/bash

mouse=$(ratbagctl list | grep Logitech | cut -d : -f 1)

if [ "$1" = "load" ]; then
    ratbagctl $mouse profile active set 1 || echo "Couldn't find the mouse!"
elif [ "$1" = "unload" ]; then
    ratbagctl $mouse profile active set 0 || echo "Couldn't find the mouse!"
fi

