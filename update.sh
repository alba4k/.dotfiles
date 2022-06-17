#!/bin/bash

#   FILES IN ~/.config
mkdir -p ~/.dotfiles/.config

cp -r ~/.config/i3/ ~/.dotfiles/.config/
cp -r ~/.config/sway/ ~/.dotfiles/.config/
cp -r ~/.config/fish/ ~/.dotfiles/.config/
cp -r ~/.config/kitty/ ~/.dotfiles/.config/
cp -r ~/.config/neofetch/ ~/.dotfiles/.config/
cp -r ~/.config/nvim/ ~/.dotfiles/.config/
cp -r ~/.config/rofi/ ~/.dotfiles/.config/
cp -r ~/.config/polybar/ ~/.dotfiles/.config/
cp -r ~/.config/cava ~/.dotfiles/.config
cp -r ~/.config/picom.conf ~/.dotfiles/.config/
cp ~/.config/dunstrc ~/.dotfiles/.config/
cp ~/.config/flameshotrc ~/.dotfiles/.config/
cp ~/.config/libinput-gestures.conf ~/.dotfiles/.config

cp -r ~/.config/hypr ~/.dotfiles/.config

cp ~/.config/uptime-record ~/.dotfiles/.config/

rm ~/.dotfiles/.config/fish/fishd.tmp.*

#   FILES IN ~
cp -r ~/.screenlayout/ ~/.dotfiles/

mkdir -p ~/.dotfiles/wallpapers
cp -r ~/Immagini/wallpapers ~/.dotfiles//wallpapers

# FILES IN /usr (custom scripts)
mkdir -p ~/.dotfiles/usr/bin
mkdir -p ~/.dotfiles/usr/share/fish/functions
cp /usr/bin/autostart.sh ~/.dotfiles/usr/bin/autostart.sh
cp /usr/bin/buds ~/.dotfiles/usr/bin/buds
cp /usr/bin/rebuds ~/.dotfiles/usr/bin/rebuds
cp /usr/bin/performance ~/.dotfiles/usr/bin/performance
cp /usr/bin/powersave ~/.dotfiles/usr/bin/powersave
cp /usr/share/fish/functions/cd.fish ~/.dotfiles/usr/share/fish/functions/

git add .
git commit -m "committed automatically from update.sh" -q
git push -q

echo "Everything is now up to date! :D"
