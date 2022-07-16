#!/bin/bash

# check if pacman exists
ls /usr/bin/pacman >/dev/null 2>/dev/null || (echo "pacman is n ot on the system"; return 69)

# running as root?
user=$(whoami)
if [ "$user" != "root" ]
    echo "run this script with elevated privileges"
    return 420
fi

pacman -Syu

pacman -S --noconfirm --needed i3-gaps polybar i3lock telegram-desktop discord \
                               code neovim vim-plug firefox pavucontrol chromium
                      
