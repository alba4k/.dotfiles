#!/bin/bash

# This script is just a weird if-else chain, I know...

win_id=$(xdotool getactivewindow 2> /dev/null)

if [ "$win_id" == "" ]; then
    echo "Desktop"
    exit

else
    win_name=$(xprop -id $win_id WM_CLASS 2> /dev/null | awk "NF {print \$NF}")
    
    if [ "$win_name" = "\"" ]; then
        echo "Minecraft 1.8.9"
        exit
    elif [ "$win_name" = "\"GalaxyBudsClient\"" ]; then
        echo "Galaxy Buds Client"
        exit
    elif [ "$win_name" = "\"obs\"" ]; then
        echo "OBS Studio"
        exit
    elif [ "$win_name" = "\"whatsapp-nativefier-d40211\"" ]; then
        echo "WhatsApp"
        exit
    elif [ "$win_name" = "\"de-neemann-digital-gui-Main\"" ]; then
        echo "Digital"
        exit
    elif [ "$win_name" = "\"code-oss\"" ]; then
        echo "VSCode"
        exit
    elif [ "$win_name" = "\"TelegramDesktop\"" ]; then
        echo "Telegram Desktop"
        exit
    elif [ "$win_name" = "\"TeamViewer\"" ]; then
        echo "TeamViewer"
        exit
    elif [ "$win_name" = "\"Terraria.bin.x86_64\"" ]; then
        echo "Terraria"
        exit
    elif [ "$win_name" = "\"DesktopEditors\"" ]; then
        echo "OnlyOffice"
        exit
    elif [ "$win_name" = "\"io.github.janbar.noson\"" ]; then
        echo "Noson"
        exit
    elif [ "$win_name" = "Sim.x86_64\"" ]; then
        echo "Digital Logic Sim"
        exit
    elif [ "$win_name" = "\"net.querz.mcaselector.ui.Window\"" ]; then
        echo "MCA Selector"
        exit
    elif [ "$win_name" = "\"FFPWA-01GJ3B834NM276W5SRKV4RB51T\"" ]; then
        echo "YouTube"
        exit
    else
        echo $(echo $win_name | sed "s/\"//g; s/[-_]/ /g; s/.*/\\L&/; s/[a-z]*/\\u&/g")
        exit
    fi
fi
