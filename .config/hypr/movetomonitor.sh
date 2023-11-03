#!/bin/sh

if hyprctl activeworkspace | grep DP-7; then
    hyprctl dispatch movecurrentworkspacetomonitor DP-5
else
    hyprctl dispatch movecurrentworkspacetomonitor DP-7
fi
    
