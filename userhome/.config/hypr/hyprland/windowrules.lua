--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hyprland.org
--
-- ##############################################
-- ###               WINDOWRULES              ###
-- ##############################################

-- Inhibit idle when there's a fullscreen window
hl.window_rule({match = {class = ".*"}, idle_inhibit = "fullscreen"})

-- Random apps that I want to float
for _, app in ipairs({
    "onedriver-launcher", "org.kde.kdeconnect.handler",
    --[["org.prismlauncher.PrismLauncher",]] "xdg-desktop-portal-gtk",
    "[Ww]aydroid.*"
}) do
    hl.window_rule({match = {class = app}, float = true})
end
hl.window_rule({match = {class = "thunar.*", title = "Avanzamento delle operazione sui file"}, float = true})
hl.window_rule({match = {class = "thunar.*", title = "Rinomina di .*"}, float = true})

-- Privacy
hl.window_rule({match = {class = "Bitwarden"}, no_screen_share = true})

-- Games
for _, app in ipairs({"hollow_knight.x86_64", "hexceed", "steam_app_.*", "Minecraft.*"}) do
    hl.window_rule({match = {class = app}, tile = true})
end
hl.window_rule({match = {title = "Minecraft Dungeons"}, immediate = true}) -- Fixes mouse not working on part of the window

-- Flameshot
hl.window_rule({
    match = {
        class = "flameshot",
        title = "flameshot"
    },

    border_size = 0,
    float = true,
    fullscreen_state = "2 0",
    max_size = "3840 1440",
    min_size = "3840 1440",
    move = "0 0",
    pin = true,
    rounding = 0,
    size = "3840 1440",
    stay_focused = true,
    suppress_event = "fullscreen"
})
hl.window_rule({match = {class = "flameshot", title = "Upload image"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Configuration"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Capture Launcher"}, float = true})
hl.window_rule({match = {class = "flameshot", title = "Save screenshot"}, float = true})

-- KDE Connect
hl.window_rule({
    match = {
        class = "org.kdeconnect.daemon"
    },

    border_size = 0,
    float = true,
    no_blur = true,
    rounding = 0,
    size = "100% 100%",
    suppress_event = "fullscreen"
})
hl.window_rule({match = {class = "org.kde.kdeconnect.daemon", title = "Ricezione file .*"}, float = true})

-- Firefox stuff
hl.window_rule({
    match = {
        class = "firefox",
        title = "Picture-in-Picture"
    },

    float = true,
    keep_aspect_ratio = true
})

-- Various authentication stuff
hl.window_rule({match = {class = "lxpolkit"}, stay_focused = true, pin = true})
hl.window_rule({match = {class = "lxpolkit", title = "Autenticazione"}, center = true, size = "548 314"})
hl.window_rule({match = {class = "lxpolkit", title = "(Informazione)|(Errore)"}, center = true})

-- Bugged telegram media viewer
hl.window_rule({
    match = {
        class = "org.telegram.desktop",
        title = "Visualizzatore multimediale"
    },

    float = true,
    fullscreen = true
})

-- IntelliJ popups
hl.window_rule({match = {class = "jetbrains-idea-ce", title = "^win(.*)"}, no_initial_focus = true})

-- LAYERRULES --

for _, app in ipairs({
    "rofi", "layout_dialog", "(waybar)|(laptop)|(ultrawide)|(regular)",
    "swaync.*", "selection", "hypr-network-manager", "vicinae"
}) do
    hl.layer_rule({match = {class = app}, blur = true, ignore_alpha = 0.2, blur_popups = true})
end
