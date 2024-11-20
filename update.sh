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
cp -r ~/.config/spicetify ~/.dotfiles/.config/
cp -r ~/.config/flameshot ~/.dotfiles/.config/
cp -r ~/.config/autorandr ~/.dotfiles/.config/
cp -r ~/.config/albafetch ~/.dotfiles/.config/
cp -r ~/.config/swayidle ~/.dotfiles/.config/
cp -r ~/.config/waybar ~/.dotfiles/.config/
cp -r ~/.config/wlogout ~/.dotfiles/.config/
cp -r ~/.config/MandoHud ~/.dotfiles/.config/
cp -r ~/.config/kanshi ~/.dotfiles/.config/
cp -r ~/.config/dunst ~/.dotfiles/.config/
cp ~/.config/flameshotrc ~/.dotfiles/.config/
cp ~/.config/libinput-gestures.conf ~/.dotfiles/.config/
cp ~/.config/picom.conf ~/.dotfiles/.config/
cp ~/.config/chromium-flags.conf ~/.dotfiles/.config/
cp ~/.config/rofimoji.rc ~/.dotfiles/.config/

cp -r ~/.config/hypr ~/.dotfiles/.config

rm ~/.dotfiles/.config/fish/fishd.tmp.*

#   FILES IN ~
cp -r ~/.screenlayout/ ~/.dotfiles/
cp ~/.profile ~/.dotfiles/.profile

mkdir -p ~/.dotfiles/wallpapers
cp -r ~/Immagini/wallpapers ~/.dotfiles/

# FILES IN .local (custom scripts)
mkdir -p ~/.dotfiles/.local/bin
#cp ~/.local/bin/autostart.sh ~/.dotfiles/.local/bin/
cp ~/.local/bin/buds ~/.dotfiles/.local/bin/
cp ~/.local/bin/performance ~/.dotfiles/.local/bin/
cp ~/.local/bin/balanced ~/.dotfiles/.local/bin/
cp ~/.local/bin/powersave ~/.dotfiles/.local/bin/
cp ~/.local/bin/g502profile.sh ~/.dotfiles/.local/bin/
cp ~/.local/bin/i3-layouts ~/.dotfiles/.local/bin/
cp ~/.local/bin/i3l ~/.dotfiles/.local/bin/
cp ~/.local/bin/scrcpy.sh ~/.dotfiles/.local/bin/
cp ~/.local/bin/teamviewer_autostart.sh ~/.dotfiles/.local/bin/
cp ~/.local/bin/toggle_bluetooth.sh ~/.dotfiles/.local/bin/

cp -r ~/.local/share/fonts ~/.dotfiles/.local/share/
cp -r ~/.local/share/applications ~/.dotfiles/.local/share/

cp ~/.local/share/uptime-record ~/.dotfiles/.local/share/

git add .

if [ -z "$1" ]; then
    git commit -m "committed automatically from update.sh" -q
else
    git commit -m "$1" -q
fi

git push -q

echo "Everything is now up to date! :D"
