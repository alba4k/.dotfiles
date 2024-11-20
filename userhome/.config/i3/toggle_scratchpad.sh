#!/bin/bash

if i3-msg scratchpad show; then # there is something in the scratchpad
    exit
fi # there is nothing in the scratchpad

i3-msg floating enable # idk why this is needed
sleep 0.05
i3-msg move scratchpad

