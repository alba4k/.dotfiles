#!/bin/bash

icon=""
value=0
title=""

if [ "$1" = "volume" ]; then
    notif_icon="audio-speakers"
    title="Volume"
    
    wpctl="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

    value="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')"
    
    if echo $wpctl | grep -q MUTED; then
        icon=" "
    else
        echo "$mute" > /tmp/mute
        if ((value > 66)); then
            icon="󰕾 "
        elif ((value > 33)); then
            icon="󰖀 "
        else
            icon="󰕿 "
        fi
    fi
elif [ "$1" = "brightness" ]; then
    notif_icon="brightnesssettings"
    title="Luminosità"

    brightness="$(cat /sys/class/backlight/intel_backlight/brightness)"
    max="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
    value=$(((brightness + ((max / 100) / 2)) / (max / 100)))

    if ((value >= 75)); then
        icon="󰃠 "
    elif ((value >= 50)); then
       icon="󰃟 "
    elif ((value >= 25)); then
       icon="󰃝 "
    else
        icon="󰃞 "
    fi
elif [ "$1" == "ext_brightness" ]; then
    notif_icon="brightnesssettings"
    title="Luminosità esterna"
    value="$(ddcutil getvcp --bus 14 10 || ddcutil getvcp --bus 12 10 || ddcutil getvcp --bus 16 10 || ddcutil getvcp --bus 17 10 || ddcutil getvcp --bus 19 10 || ddcutil getvcp --bus 20 10)"
    
    if ((value >= 75)); then
        icon="󰃠 "
    elif ((value >= 50)); then
       icon="󰃟 "
    elif ((value >= 25)); then
       icon="󰃝 "
    else
        icon="󰃞 "
    fi
else
    exit 1
fi

if [ "$icon" = " " ]; then
    notify-send -t 1000 -a Sistema -i "$notif_icon" -u normal \
                -h boolean:transient:true -h int:value:$value \
                -h string:synchronous:kbvolbright \
                "$title" "${icon} (${value})%"
else
    notify-send -t 1000 -a Sistema -i "$notif_icon" -u normal \
                -h boolean:transient:true -h int:value:$value \
                -h string:synchronous:kbvolbright \
                "$title" "${icon} ${value}%"
fi
