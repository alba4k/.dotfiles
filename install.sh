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

# Not even close to being complete, but still better than nothing
paru -Syu --noconfirm --needed i3wm polybar i3lock telegram-desktop discord \
                               code neovim vim-plug firefox pavucontrol chromium \
                               blueman bluez bluez-utils clipit kdeconnect dunst \
                               libinput-gestures nitrogen lxsession playerctl \
                               flameshot emote neofetch albafetch-git \
                               i3-battery-popup firefox qt5ct lxappearance \
                               network-manager-applet galaxybudsclient-bin \
                               polymc-qt5-bin github-cli hyprland waybar \
                               swaylock-effects swayidle wl-clip-persist
                      
