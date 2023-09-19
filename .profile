#
# ~/.profile
#

export PATH="$PATH:/home/alba4k/.local/bin"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME="Catppuccin-purple"

# FireFox stuff
export MOZ_ENABLE_WAYLAND=1 MOZ_USE_XINPUT2=1

export LIBVA_DRIVER_NAME="iHD"

# export GTK_USE_PORTAL=0

# export XCURSOR_SIZE=16

export MAKEFLAGS="-j14 -s -march x86-64-v3 -O3"

export MANPAGER="bat -pl man"

export XDG_CONFIG_HOME="/home/alba4k/.config"
export XDG_CACHE_HOME="/home/alba4k/.cache"
export XDG_DATA_HOME="/home/alba4k/.local/share"
