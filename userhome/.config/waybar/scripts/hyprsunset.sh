#!/bin/sh

if test -f /tmp/hyprsunset; then
  hyprctl hyprsunset reset temperature
  rm /tmp/hyprsunset
else
    hyprctl hyprsunset temperature 4000
    touch /tmp/hyprsunset
fi
