#!/bin/sh

# Initially inspired by https://github.com/exoess

# Getting some information about the current window
# windowinfo=$(hyprctl activewindow) removes the newlines and won't work with grep
hyprctl activewindow > /tmp/windowinfo
windowinfo=/tmp/windowinfo

# Run slurp to get position and size
if ! slurp=$(slurp); then
    exit
fi

# Parse the output
pos_x=$(echo $slurp | cut -d " " -f 1 | cut -d , -f 1)
pos_y=$(echo $slurp | cut -d " " -f 1 | cut -d , -f 2)
size_x=$(echo $slurp | cut -d " " -f 2 | cut -d x -f 1)
size_y=$(echo $slurp | cut -d " " -f 2 | cut -d x -f 2)

# Keep the aspect ratio intact for PiP
if grep "title: Picture-in-Picture" $windowinfo; then
    old_size=$(grep "size: " $windowinfo | cut -d " " -f 2)
    old_size_x=$(echo $old_size | cut -d , -f 1)
    old_size_y=$(echo $old_size | cut -d , -f 2)

    size_x=$(((old_size_x * size_y + old_size_y / 2) / old_size_y))
    echo $old_size_x $old_size_y $size_x $size_y
fi

# Resize and move the (now) floating window
grep "fullscreen: 1" $windowinfo && hyprctl dispatch fullscreen
grep "floating: 0" $windowinfo && hyprctl dispatch togglefloating
hyprctl dispatch moveactive exact $pos_x $pos_y
hyprctl dispatch resizeactive exact $size_x $size_y

