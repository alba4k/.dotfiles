#!/bin/python
import subprocess
import os

monitors = subprocess.run(["xrandr"], stdout=subprocess.PIPE).stdout.decode("utf-8")

homedir = os.getenv("HOME")

if("DP-1-3 connected" in monitors and "DP-1-1 connected" in monitors):
    subprocess.run([homedir + "/.screenlayout/2MCasa.sh"])
elif("eDP-1 connected" in monitors and "DP-1-3 disconnected" in monitors and "DP-1-1 disconnected" in monitors):
    subprocess.run([homedir + "/.screenlayout/Laptop.sh"])

