#!/bin/bash

ddcutil detect 2>/dev/null | awk '
    /I2C bus:/ {
        match($0, /\/dev\/i2c-([0-9]+)/, arr)
        current_bus = arr[1]
    }
    
    /VCP version:/ {
        if (current_bus != "") {
            print current_bus
            current_bus = ""
        }
    }
' >> /tmp/ddcutil_$$

mv /tmp/ddcutil_$$ /tmp/ddcutil

