#!/bin/sh

KEYBOARD=/dev/input/by-path/platform-i8042-serio-0-event-kbd
EVENT="type 17 (EV_LED), code 1 (LED_CAPSL), value 1"
EVENT2="type 17 (EV_LED), code 1 (LED_CAPSL), value 0"

evtest "$KEYBOARD" | \
while read line
do
    if [[ "$line" == *"$EVENT" ]]; then
        notify-send -r 2593 -t 1000 -a Sistema -i input-keyboard -u low "󰘲 Caps Lock" "Inserito"
    elif [[ "$line" == *"$EVENT2" ]]; then
        notify-send -r 2593 -t 1000 -a Sistema -i input-keyboard -u low "󰘲 Caps Lock" "Disinserito"
    fi
done
