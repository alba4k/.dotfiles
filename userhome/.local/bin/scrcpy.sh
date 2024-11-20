#!/bin/sh

adb connect 192.168.68.69:55555

(scrcpy && killall vlc) &

# sndcpy for audio
#sndcpy

# PipeWire forwarding could also be used for audio, but is laggier
bluetoothctl power on
bluetoothctl connect C8:BD:69:6C:A2:6E
