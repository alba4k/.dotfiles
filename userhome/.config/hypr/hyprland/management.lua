--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Layouts
--                https://wiki.hypr.land/Configuring/Binds
--                https://wiki.hypr.land/Configuring/Basics/Variables
--
-- ##############################################
-- ###     WINDOW AND WORKSPACE MANAGMENT     ###
-- ##############################################

hl.config({
    -- Dwindle layout options
    dwindle = {
        preserve_split = true,
        -- smart_split = true
    },

    binds = {
        allow_workspace_cycles = true,
        movefocus_cycles_fullscreen = false,
        workspace_back_and_forth = true,
        workspace_center_on = 1
    }
})

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + tab", hl.dsp.window.cycle_next())

hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({action = "toggle"}))

-- Moving windows with the mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Random
hl.bind("SUPER + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/resize.sh"))
hl.bind("SUPER + S", hl.dsp.window.toggle_swallow())

-- Moving window focus
for _, dir in ipairs({"left", "right", "up", "down"}) do
    hl.bind("SUPER + " .. dir, hl.dsp.focus({direction = dir}))
    hl.bind("SUPER + SHIFT + " .. dir, hl.dsp.window.move({direction = dir}))
end

-- Resizing windows
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({x = -50, y = 0}))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({x = 50, y = 0}))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({x = 0, y = 50}))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({x = 0, y = -50}))

-- Switching workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({workspace = i, follow = true}))
end

-- Windowrules
hl.window_rule({match = {class = "firefox"}, workspace = 2})
hl.window_rule({match = {class = "org.telegram.desktop"}, workspace = 3})
hl.window_rule({match = {class = "discord"}, workspace = 3})
hl.window_rule({match = {class = "vesktop"}, workspace = 3})
hl.window_rule({match = {class = "WhatsApp"}, workspace = 3})
hl.window_rule({match = {class = "code.*"}, workspace = 4})
hl.window_rule({match = {class = "Spotify"}, workspace = 5})
hl.window_rule({match = {class = "org.prismlauncher.PrismLauncher"}, workspace = 6})
hl.window_rule({match = {class = "steam"}, workspace = 6})
hl.window_rule({match = {class = "com.obsproject.Studio"}, workspace = 7})
