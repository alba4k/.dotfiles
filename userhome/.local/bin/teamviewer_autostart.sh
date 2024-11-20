#!/bin/bash

if systemctl status teamviewerd | grep inactive; then
    systemctl start teamviewerd
fi

teamviewer
