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
hl.window_rule({match = {class = "onedriver-launcher"}, float = true})
hl.window_rule({match = {class = "org.kde.kdeconnect.handler"}, float = true})
hl.window_rule({match = {class = "org.prismlauncher.PrismLauncher"}, float = true})
hl.window_rule({match = {class = "xdg-desktop-portal-gtk"}, float = true})
hl.window_rule({match = {class = "thunar.*", title = "Avanzamento delle operazione sui file"}, float = true})
hl.window_rule({match = {class = "", title = "Rinomina di .*"}, float = true})
hl.window_rule({match = {class = "[Ww]aydroid.*"}, float = true})

-- Privacy
hl.window_rule({match = {class = "Bitwarden"}, no_screen_share = true})

-- Games
hl.window_rule({match = {class = "hollow_knight.x86_64"}, tile = true})
hl.window_rule({match = {class = "hexceed"}, tile = true})
hl.window_rule({match = {class = "steam_app_271590"}, tile = true}) -- GTA V
hl.window_rule({match = {class = "steam_app_312520"}, tile = true}) -- Rain World
hl.window_rule({match = {class = "steam_app_322170"}, tile = true}) -- Geometry Dash
hl.window_rule({match = {class = "steam_app_387290"}, tile = true}) -- Ori And The Blind Forest: Definitive Edition
hl.window_rule({match = {class = "steam_app_1172620"}, tile = true}) -- Sea of Thieves
hl.window_rule({match = {class = "steam_app_1671210"}, tile = true}) -- Deltarune
hl.window_rule({match = {class = "Minecraft.*"}, tile = true})

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

-- KDE Connect laser pointer
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

-- Rofi
hl.layer_rule({match = {namespace = "rofi"}, blur = true, ignore_alpha = 0, --[[dim_around = true]]})

-- Wlogout
hl.layer_rule({match = {namespace = "logout_dialog"}, blur = true, ignore_alpha = 0})

-- Waybar
hl.layer_rule({match = {namespace = "waybar"}, blur = true, ignore_alpha = 0.2, blur_popups = true})

-- Sway Notification Center
hl.layer_rule({match = {namespace = "swaync.*"}, blur = true, ignore_alpha = 0.2})

-- Slurp
hl.layer_rule({match = {namespace = "selection"}, blur = true, ignore_alpha = 0.2})

-- Hypr Network manager
hl.layer_rule({match = {namespace = "hypr-network-manager"}, blur = true, ignore_alpha = 0.2})

