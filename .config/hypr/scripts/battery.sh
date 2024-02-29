#!/bin/sh

upower=$(upower -i $(upower -e | grep BAT))

bat=$(grep percentage <<< $upower | awk "{print \$2}" | sed -e "s/%//")

if ! grep "discharging" <<< $upower; then
    echo -n "󱐋"
fi

if ((bat >= 90)); then
    echo -n " "
elif ((bat >= 70)); then
    echo -n " "
elif ((bat >= 50)); then
    echo -n " "
elif ((bat >= 30)); then
    echo -n " "
elif ((bat >= 10)); then
    echo -n " "
fi

echo " $bat%"

