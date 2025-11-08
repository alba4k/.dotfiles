#!/bin/sh

# Initially inspired by https://github.com/exoess

# Getting some information about the current window
# windowinfo=$(hyprctl activewindow) removes the newlines and won't work with grep
hyprctl activewindow > /tmp/windowinfo
windowinfo=/tmp/windowinfo
blur_size=$(hyprctl getoption decoration:blur:size | grep int | awk "{print \$2}")
blur_passes=$(hyprctl getoption decoration:blur:passes | grep int | awk "{print \$2}")

# Freeze the screen
(hyprpicker -rz; killall slurp) &

sleep 0.03

(sleep 0.05 && hyprctl keyword decoration:blur:size 2) &
(sleep 0.05 && hyprctl keyword decoration:blur:passes 2) &

size=$(slurp -b "#1e1e2ea0" -c "#8957b0ff" &)

slurp_pid=$!
slurp_return=$?

hyprctl keyword decoration:blur:size "$blur_size"
hyprctl keyword decoration:blur:passes "$blur_passes"

wait $slurp_pid

killall -9 hyprpicker

# Parse the output
pos_x=$(echo $size | cut -d " " -f 1 | cut -d , -f 1)
pos_y=$(echo $size | cut -d " " -f 1 | cut -d , -f 2)
size_x=$(echo $size | cut -d " " -f 2 | cut -d x -f 1)
size_y=$(echo $size | cut -d " " -f 2 | cut -d x -f 2)

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

