--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Binds/
--
-- ##############################################
-- ###                KEYBINDS                ###
-- ##############################################

-- Actions on lid switch (cause logind only sometimes works)
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl monitors | grep ' DP' || systemctl suspend-then-hibernate"), {locked = true})

-- I have a custom macro for it on my laptop so why not use it :)
-- https://wiki.archlinux.org/title/Dell_XPS_13_Plus_(9320)--Function_Keys
hl.bind("SUPER + P", hl.dsp.exec_raw("systemctl suspend-then-hibernate"))

-- Opening a terminal
hl.bind("SUPER + return", hl.dsp.exec_raw("kitty --title Kitty"))
hl.bind("SUPER + T", hl.dsp.exec_raw("kitty --title Kitty"))

-- Just QOL lol
hl.bind("SUPER + B", hl.dsp.exec_raw("buds"))

-- Session Management
hl.bind("SUPER + backspace", hl.dsp.exec_cmd("pidof wlogout && pkill wlogout || wlogout"))
hl.bind("SUPER + L", hl.dsp.exec_raw("loginctl lock-session"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + SHIFT + R", function()
        hl.dsp.exec_raw("hyprctl reload")()
        hl.notification.create({text = "Configurazione ricaricata!", duration = 2000, icon = 1, color = "rgb(b3ffcc)", font_size = 17})
end)

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl set +4800"), {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl set 4800-"), {locked = true, ignore_mods = true, repeating = true})

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_raw("playerctl play-pause"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioPause", hl.dsp.exec_raw("playerctl play-pause"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioNext", hl.dsp.exec_raw("playerctl next"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_raw("playerctl previous"), {locked = true, ignore_mods = true})

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +10% && pactl set-sink-mute @DEFAULT_SINK@ 0 && paplay --volume 65536 ~/.config/hypr/assets/click.ogg"),
        {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -10% && pactl set-sink-mute @DEFAULT_SINK@ 0 && paplay --volume 65536 ~/.config/hypr/assets/click.ogg"),
        {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_raw("pactl set-sink-mute @DEFAULT_SINK@ toggle && paplay --volume 65536 ~/.config/hypr/assets/click.ogg"), {locked = true, ignore_mods = true})

-- Rofi
hl.bind("SUPER + D", hl.dsp.exec_raw("rofi -show drun"))
hl.bind("SUPER + C", hl.dsp.exec_raw("rofi -show calc"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_raw("rofi -show run"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_raw("cliphist wipe"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("~/.config/rofi/clipboard.sh | rofi -dmenu -display-columns 2 -p ' Appunti' | cliphist decode | wl-copy && hyprctl dispatch 'hl.dsp.send_shortcut({mods = \"CTRL\", key = \"V\"})'"))
hl.bind("SUPER + period", hl.dsp.exec_cmd("rofimoji | tr -d '\n' | wl-copy && hyprctl dispatch 'hl.dsp.send_shortcut({mods = \"CTRL\", key = \"V\"})'"))

-- Half grim half flameshot baucase flameshot sometimes breaks
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("pidof slurp || ~/.config/hypr/scripts/screenshot.sh"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("flameshot gui 2>&1 | grep aborted || hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast --cursor copy output && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast --cursor copy screen && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast --cursor copy screen && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("SUPER + Print", hl.dsp.exec_raw("flameshot launcher"))

-- Moving workspaces around
hl.bind("SUPER + X", hl.dsp.exec_raw("/home/alba4k/.config/hypr/scripts/movetomonitor.sh"))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("hyprctl monitors | grep eDP-1 && hyprctl keyword monitor eDP-1,disabled || hyprctl keyword monitor eDP-1,1920x1200@60,0x0,1"))

-- Global Keybinds
hl.bind("SUPER + F10", hl.dsp.pass({window = "class:^(com\\.obsproject\\.Studio)$"}))

-- Random
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_raw("hyprpicker -rnaql"))
