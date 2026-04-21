#!/bin/sh
# alba4k - 2025

percentage=$(ddcutil --bus 14 getvcp 10 --terse | awk '{print $4}')
if echo $percentage | grep "on" >/dev/null; then
    percentage=$(ddcutil --bus 12 getvcp 10 --terse | awk '{print $4}')
fi
if echo $percentage | grep "on" >/dev/null; then
    percentage=$(ddcutil --bus 13 getvcp 10 --terse | awk '{print $4}')
fi
if echo $percentage | grep "on" >/dev/null; then
    percentage=$(ddcutil --bus 15 getvcp 10 --terse | awk '{print $4}')
fi

echo '{"percentage": '$percentage'}'
