#!/bin/sh

MONITORS=$(hyprctl monitors)

if echo $MONITORS | grep DP-5 && echo $MONITORS | grep DP-7; then
    ~/.screenlayout/W-2MCasa.sh
else
    ~/.screenlayout/W-Laptop.sh
fi
