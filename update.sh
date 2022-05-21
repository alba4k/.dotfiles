#!/bin/bash

#   FILES IN ~/.config
mkdir -p ~/.dotfiles/.config

cp -r ~/.config/i3/ ~/.dotfiles/.config/
cp -r ~/.config/fish/ ~/.dotfiles/.config/
cp -r ~/.config/kitty/ ~/.dotfiles/.config/
cp -r ~/.config/neofetch/ ~/.dotfiles/.config/
cp -r ~/.config/nvim/ ~/.dotfiles/.config/
cp -r ~/.config/picom/ ~/.dotfiles/.config/
cp -r ~/.config/rofi/ ~/.dotfiles/.config/
cp -r ~/.config/polybar/ ~/.dotfiles/.config/
cp -r ~/.config/cava ~/.dotfiles/.config
cp ~/.config/dunstrc ~/.dotfiles/.config/
cp ~/.config/flameshotrc ~/.dotfiles/.config/
cp ~/.config/libinput-gestures.conf ~/.dotfiles/.config

cp ~/.config/uptime-record ~/.dotfiles/.config/

rm ~/.dotfiles/.config/fish/fishd.tmp.*

#   FILES IN ~
cp -r ~/.screenlayout/ ~/.dotfiles/
cp ~/.fehbg ~/.dotfiles/.fehbg

# FILES IN /usr/bin (custom scripts)
mkdir -p ~/.dotfiles/usr/bin
cp /usr/bin/autostart.sh ~/.dotfiles/usr/bin/autostart.sh
cp /usr/bin/buds ~/.dotfiles/usr/bin/buds
cp /usr/bin/rebuds ~/.dotfiles/usr/bin/rebuds
cp /usr/bin/performance ~/.dotfiles/usr/bin/performance
cp /usr/bin/powersave ~/.dotfiles/usr/bin/powersave


git add .
git commit -m "committed automatically from update.sh" -q
git push -q

echo "Everything is now up to date! :D"
