#!/bin/sh

upower=$(upower -i $(upower -e | grep BAT))

bat=$(grep percentage <<< $upower | awk "{print \$2}" | sed -e "s/%//")

if ! grep "discharging" <<< $upower >/dev/null; then
    echo -n "󱐋"
fi

if ((bat >= 90)); then
    echo -n " "
elif ((bat >= 70)); then
    echo -n " "
elif ((bat >= 35)); then
    echo -n " "
elif ((bat >= 20)); then
    echo -n " "
else
    echo -n " "
fi

echo " $bat%"

