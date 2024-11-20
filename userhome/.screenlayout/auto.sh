#!/bin/sh

MONITORS=$(xrandr)

if echo $MONITORS | grep "DP-3-3 connected" && echo $MONITORS | grep "DP-3-1 connected"; then
    ~/.screenlayout/2MCasa.sh
elif echo $MONITORS | grep "eDP-1 connected" && echo $MONITORS | grep "DP-3-3 disconnected" && echo $MONITORS | grep "DP-3-1 disconnected"; then
    ~/.screenlayout/Laptop.sh
