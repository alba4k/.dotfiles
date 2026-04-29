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
--   - Hypr-DarkWindow
--      https://github.com/micha4w/Hypr-DarkWindow

-- Open Hyprexpo using a keybing
-- hl.bind("SUPER + W", hl.dsp.overview.toggle())
-- hl.bind("SUPER + I", hl.dsp.darkwindow.shadeactive("invert"))

hl.config({
    plugin = {
        --[[
        hyprexpo = {
            columns = 3,
            gap_size = 0,
            bg_col = "rgb(1e1e2e)",
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
            panelBorderColor = "rgb(8957b0)",
            workspaceActiveBorder = "rgb(8957b0)",
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
        ]]
    }
})
