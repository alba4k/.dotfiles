#!/bin/sh
# alba4k - 2025

# eDP-1: i2c 11
#  DP-5, DP-6: i2c 16
#  DP-7, DP-9: i2c 17

percentage=$(ddcutil --bus 14 getvcp 10 --terse | awk '{print $4}')
if [[ $percentage -eq "on" ]] || [[ $percentage -eq "" ]]; then
    percentage=$(ddcutil --bus 12 getvcp 10 --terse | awk '{print $4}')
fi
if [[ $percentage -eq "on" ]] || [[ $percentage -eq "" ]]; then
    percentage=$(ddcutil --bus 16 getvcp 10 --terse | awk '{print $4}')
fi
if [[ $percentage -eq "on" ]] || [[ $percentage -eq "" ]]; then
    percentage=$(ddcutil --bus 17 getvcp 10 --terse | awk '{print $4}')
fi
if [[ $percentage -eq "on" ]] || [[ $percentage -eq "" ]]; then
    percentage=$(ddcutil --bus 19 getvcp 10 --terse | awk '{print $4}')
fi
if [[ $percentage -eq "on" ]] || [[ $percentage -eq "" ]]; then
    percentage=$(ddcutil --bus 20 getvcp 10 --terse | awk '{print $4}')
fi

echo '{"percentage": '$percentage'}'
