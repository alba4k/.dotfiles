--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Autostart
--
-- ##############################################
-- ###               AUTOSTART                ###
-- ##############################################

hl.on("hyprland.start", function ()
    for _, cmd in ipairs({
        -- Background
        "bitwarden",
        "blueman-applet",
        "hypr-network-manager --daemon",
        "hyprctl devices | grep logitech && solaar -w hide -b solaar",
        "hypridle --quiet",
        "hyprlock -c ~/.config/hypr/hyprlock/hyprlogin.conf -q || hyprctl dispatch exit", -- Login Manager
        "hyprpaper",
        "hyprsunset",
        "kdeconnect-indicator",
        "lxpolkit",
        "swaync",
        "waybar",
        -- Scripts
        "~/.config/hypr/scripts/ac_detect.sh",
        "~/.config/hypr/scripts/capslock.sh",
        "~/.config/hypr/scripts/volbright.sh --brightness --keyboard --volume",
        -- Clipboard
        "cliphist wipe",
        "wl-clip-persist -c both",
        "wl-paste --watch cliphist store"
    }) do
        hl.exec_cmd(cmd)
    end
end)

-- Reload other configs
--[[
hl.exec_cmd("swaync-client -R")
hl.exec_cmd("swaync-client -rs")

hl.exec_cmd("killall -SIGUSR2 waybar")
]]

