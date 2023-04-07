#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
  ~/.local/bin/buds
else
  bluetoothctl power off
fi
