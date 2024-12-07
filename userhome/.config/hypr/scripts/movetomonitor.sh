#!/bin/sh

# DP-5 and DP-7 show up as DP-6 and DP-9 after hibernating

if hyprctl activeworkspace | grep "DP-7\|DP-9"; then
    hyprctl dispatch movecurrentworkspacetomonitor DP-5
    hyprctl dispatch movecurrentworkspacetomonitor DP-6
else
    hyprctl dispatch movecurrentworkspacetomonitor DP-7
    hyprctl dispatch movecurrentworkspacetomonitor DP-9
fi
    
