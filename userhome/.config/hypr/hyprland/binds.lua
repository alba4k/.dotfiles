--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Binds/
--
-- ##############################################
-- ###                KEYBINDS                ###
-- ##############################################

-- I have a custom macro for it on my laptop so why not use it :)
-- https://wiki.archlinux.org/title/Dell_XPS_13_Plus_(9320)--Function_Keys
hl.bind("SUPER + P", hl.dsp.exec_raw("systemctl suspend-then-hibernate"), {locked = true})

-- Opening a terminal
hl.bind("SUPER + return", hl.dsp.exec_raw("kitty --title Kitty"))
hl.bind("SUPER + T", hl.dsp.exec_raw("kitty --title Kitty"))

-- Just QOL lol
hl.bind("SUPER + B", hl.dsp.exec_raw("buds"))

-- Session Management
hl.bind("SUPER + backspace", hl.dsp.exec_cmd("pidof -q wlogout && pkill wlogout || wlogout"))
hl.bind("SUPER + L", hl.dsp.exec_raw("loginctl lock-session"), {locked = true})
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + SHIFT + R", function()
        hl.exec_cmd("hyprctl reload config-only")
        hl.notification.create({text = "Configurazione ricaricata!", timeout = 2000, icon = 1, color = C_BLUE, font_size = 17})
end)

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl set +4800 & sleep 0.01; ~/.config/hypr/scripts/notify.sh brightness"), {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_raw("brightnessctl set 4800- & sleep 0.01; ~/.config/hypr/scripts/notify.sh brightness"), {locked = true, ignore_mods = true, repeating = true})

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_raw("playerctl play-pause"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioPause", hl.dsp.exec_raw("playerctl play-pause"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioNext", hl.dsp.exec_raw("playerctl next"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_raw("playerctl previous"), {locked = true, ignore_mods = true})

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 10%+ & wpctl set-mute @DEFAULT_SINK@ 0 & pw-play --volume 65536 /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga & ~/.config/hypr/scripts/notify.sh volume"),
        {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 10%- & wpctl set-mute @DEFAULT_SINK@ 0 & pw-play --volume 65536 /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga & ~/.config/hypr/scripts/notify.sh volume"),
        {locked = true, ignore_mods = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_raw("wpctl set-mute @DEFAULT_SINK@ toggle & pw-play --volume 65536 /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga; ~/.config/hypr/scripts/notify.sh volume"), {locked = true, ignore_mods = true})
hl.bind("XF86AudioMicMute", hl.dsp.exec_raw("wpctl set-mute @DEFAULT_SOURCE@ toggle"), {locked = true, ignore_mods = true})

-- Rofi
--hl.bind("SUPER + D", hl.dsp.exec_raw("rofi -show drun"))
hl.bind("SUPER + D", hl.dsp.exec_raw("vicinae toggle"))
--hl.bind("SUPER + C", hl.dsp.exec_raw("rofi -show calc"))
--hl.bind("SUPER + SHIFT + D", hl.dsp.exec_raw("rofi -show run"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_raw("vicinae vicinae://launch/system/run"))
--hl.bind("SUPER + V", hl.dsp.exec_cmd("~/.config/rofi/clipboard.sh | rofi -dmenu -display-columns 2 -p ' Appunti' | cliphist decode | wl-copy && hyprctl dispatch 'hl.dsp.send_shortcut({mods = \"CTRL\", key = \"V\"})'"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
--hl.bind("SUPER + period", hl.dsp.exec_cmd("rofimoji | tr -d '\n' | wl-copy && hyprctl dispatch 'hl.dsp.send_shortcut({mods = \"CTRL\", key = \"V\"})'"))
hl.bind("SUPER + period", hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"))

-- Half grim half flameshot baucase flameshot sometimes breaks
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("pidof -q slurp || ~/.config/hypr/scripts/screenshot.sh"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("flameshot gui 2>&1 | grep q aborted || hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast --cursor copy output && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"), {locked = true})
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast --cursor copy screen && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast --cursor copy screen && hyprctl notify 5 3000 0 'fontsize:17 Immagine copiata negli appunti!'"))
hl.bind("SUPER + Print", hl.dsp.exec_raw("flameshot launcher"))

-- Cursor zoom
hl.bind("SUPER + Z", function() hl.config({cursor = {zoom_factor = 1}}) end)
hl.bind("SUPER + mouse_up", function() hl.config({cursor = {zoom_factor = hl.get_config("cursor.zoom_factor") * 0.8}}) end)
hl.bind("SUPER + mouse_down", function() hl.config({cursor = {zoom_factor = hl.get_config("cursor.zoom_factor") * 1.25}}) end)

-- Move active workspace to other monitor
hl.bind("SUPER + X", hl.dsp.workspace.move({monitor = "+1"}))

-- Caps Lock notification
local caps_enabeld = false
hl.bind("Caps_Lock", function()
        caps_enabeld = not caps_enabeld
        hl.exec_cmd("notify-send -t 1000 -a Sistema -i input-keyboard -u low -h boolean:transient:true -h string:synchronous:CAPS '󰘲  Caps Lock' " .. (caps_enabeld and "Inserito" or "Disinserito"))
end)

-- Global Keybinds
hl.bind("SUPER + R", hl.dsp.pass({window = "class:^(com\\.obsproject\\.Studio)$"}))

-- Random
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_raw("hyprpicker -rnaql"))
