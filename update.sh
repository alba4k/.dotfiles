#!/bin/bash

#   FILES IN ~/.config
mkdir -p ~/.dotfiles/.config

cp -r ~/.config/i3/ ~/.dotfiles/.config/
cp -r ~/.config/nitrogen/ ~/.dotfiles/.config/
cp -r ~/.config/sway/ ~/.dotfiles/.config/
cp -r ~/.config/fish/ ~/.dotfiles/.config/
cp -r ~/.config/kitty/ ~/.dotfiles/.config/
cp -r ~/.config/neofetch/ ~/.dotfiles/.config/
cp -r ~/.config/nvim/ ~/.dotfiles/.config/
cp -r ~/.config/rofi/ ~/.dotfiles/.config/
cp -r ~/.config/polybar/ ~/.dotfiles/.config/
cp -r ~/.config/cava ~/.dotfiles/.config
cp -r ~/.config/picom.conf ~/.dotfiles/.config/
cp -r ~/.config/spicetify ~/.dotfiles/.config/
cp -r ~/.config/flameshot ~/.dotfiles/.config/
cp ~/.config/flameshotrc ~/.dotfiles/.config/
cp ~/.config/dunstrc ~/.dotfiles/.config/
cp ~/.config/libinput-gestures.conf ~/.dotfiles/.config/
cp ~/.config/albafetch.conf ~/.dotfiles/.config/

cp -r ~/.config/hypr ~/.dotfiles/.config

cp ~/.config/uptime-record ~/.dotfiles/.config/

rm ~/.dotfiles/.config/fish/fishd.tmp.*

#   FILES IN ~
cp -r ~/.screenlayout/ ~/.dotfiles/

mkdir -p ~/.dotfiles/wallpapers
cp -r ~/Immagini/wallpapers ~/.dotfiles/

# FILES IN /usr (custom scripts)
mkdir -p ~/.dotfiles/usr/bin
cp ~/.local/bin/autostart.sh ~/.dotfiles/.local/bin/autostart.sh
cp ~/.local/bin/buds ~/.dotfiles/.local/bin/buds
cp ~/.local/bin/rebuds ~/.dotfiles/.local/bin/rebuds
cp ~/.local/bin/performance ~/.dotfiles/.local/bin/performance
cp ~/.local/bin/powersave ~/.dotfiles/.local/bin/powersave
cp -r ~/.local/share/fonts ~/.dotfiles/.local/share/

git add .
git commit -m "committed automatically from update.sh" -q
git push -q

echo "Everything is now up to date! :D"
