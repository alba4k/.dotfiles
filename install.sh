#!/bin/bash

# check if pacman exists
ls /usr/bin/pacman >/dev/null 2>/dev/null || (echo "pacman is n ot on the system"; return 69)

# nvm I wanna use paru shut up
# running as root?
#user=$(whoami)
#if [ "$user" != "root" ]
#    echo "run this script with elevated privileges"
#    return 420
#fi

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin

paru -Syu --noconfirm --needed i3-gaps polybar i3lock telegram-desktop discord \
                               code neovim vim-plug firefox pavucontrol chromium \
                               blueman bluez bluez-utils clipit kdeconnect dunst \
                               libinput-gestures nitrogen lxsession playerctl \
                               flameshot emote neofetch albafetch-git \
                               i3-battery-popup
                      
