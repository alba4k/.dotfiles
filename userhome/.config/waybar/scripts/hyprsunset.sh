#!/bin/sh

if test -f /tmp/hyprsunset; then
  hyprctl hyprsunset identity
  rm /tmp/hyprsunset
else
    hyprctl hyprsunset temperature 4000
    touch /tmp/hyprsunset
fi
