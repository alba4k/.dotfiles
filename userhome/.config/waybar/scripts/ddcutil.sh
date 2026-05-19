#!/bin/sh
# alba4k - 2026

class="connected"
percentage=$(ddcutil --bus 14 getvcp 10 --terse | awk '{print $4}')
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=$(ddcutil --bus 12 getvcp 10 --terse | awk '{print $4}')
fi
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=$(ddcutil --bus 16 getvcp 10 --terse | awk '{print $4}')
fi
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=$(ddcutil --bus 17 getvcp 10 --terse | awk '{print $4}')
fi
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=$(ddcutil --bus 19 getvcp 10 --terse | awk '{print $4}')
fi
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=$(ddcutil --bus 20 getvcp 10 --terse | awk '{print $4}')
fi
if [[ "$percentage" == "on" ]] || [[ -z "$percentage" ]]; then
    percentage=""
    class="disconnected"
fi

echo '{"percentage": '$percentage', "class": "'$class'"}'
