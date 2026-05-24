--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Plugins/Using-Plugins
--
-- ##############################################
-- ###                PLUGINS                 ###
-- ##############################################

-- Loading them may help lol
hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprpm reload")
end)

-- I normally use:
--   - Hyprexpo
--      https://github.com/hyprwm/hyprland-plugins/tree/main/hyprexpo
--   - Hyprspace
--      https://github.com/KZDKM/Hyprspace

-- hl.bind("SUPER + W", hl.plugin.overview.toggle())

local enabled = {
    ["dynamic-cursors"] = false,
    ["hymission"] = false,
    ["Hypr-DarkWindow"] = false
}

for _, plugin in ipairs(hl.get_loaded_plugins()) do
    if enabled[plugin.name] ~= nil then
        enabled[plugin.name] = true
    end
end

-- https://github.com/VirtCode/hypr-dynamic-cursors
if enabled["dynamic-cursors"] then
    hl.config({
        plugin = {
            dynamic_cursors = {
                mode = "stretch", -- "none" to disable

                shake = {
                    threshold = 5.0,
                    base = 3.0,
                    speed = 2.0,
                    timeout = 1000,
                    effects = false,
                    ipc = false
                },

                hyprcursor = {
                    enabled = true,
                    nearest = 0
                },

                stretch = {
                    limit = 3000,
                    activation = "linear",
                    window = 100
                }
            }
        }
    })
end

-- https://github.com/gfhdhytghd/hymission
if enabled["hymission"] then
    hl.plugin.hymission.gesture({
        fingers = 3,
        direction = "vertical",
        action = "toggle",
        --args = "forceall",
        args = "onlycurrentworkspace",
    })
    hl.plugin.hymission.gesture({
        fingers = 3,
        direction = "vertical",
        action = "toggle",
        recommand = true,
    })

    hl.config({
        plugin = {
            hymission = {
                layout_engine = "apple",
                niri_mode = 0,
                switch_release_key = "Super_L",
                workspace_strip_anchor = "left",
                show_focus_indicator = 1,

                workspace_strip_thickness = 300,
                workspace_strip_gap = 12
            },
        },
    })
end

-- https://github.com/micha4w/Hypr-DarkWindow
if enabled["Hypr-DarkWindow"] then
    hl.bind("SUPER + I", hl.plugin.darkwindow.dsp_shade({shader = "invert"}))

    hl.window_rule({
        match = {
            class = "rquickshare"
        },
        ["darkwindow:shade"] = "invert"
    })

    hl.config({
        plugin = {
            darkwindow = {
                load_shaders = "invert"
            }
        }
    })
end

hl.config({
    --[[
    plugin = {
        hyprexpo = {
            columns = 3,
            gap_size = 0,
            bg_col = C_BACKGROUND,
            workspace_method = "first 1",

            enable_gesture = true,
            -- gesture_distance = 100,
            -- gesture_positive = false,
        },

        overview = {
            panelHeight = 200,
            workspaceMargin = 15,
            onBottom = true,
            panelBorderWidth = 0,
            workspaceBorderSize = 3,
            dragAlpha = 0.7,
            panelBorderColor = C_PRIMARY,
            workspaceActiveBorder = C_PRIMARY,
            disableGestures = false,

            autoScroll = false,
            exitOnClick = false,
            switchOnDrop = true,
            exitOnSwitch = false,

            affectStrut = true,
            overrideGaps = false,
            showNewWorkspace = true,
            showEmptyWorkspace = false,
            showSpecialWorkspace = false,

            hideBackgroundLayers = false,
            hideTopLayers = false,
            hideOverlayLayers = false,
        }
    }
    ]]
})
