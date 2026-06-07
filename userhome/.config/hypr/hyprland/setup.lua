--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Variables
--
-- ##############################################
-- ###                 SETUP                  ###
-- ##############################################

-- Hyprland settings
hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 5,
        col = {
            active_border = {colors = {C_PRIMARY, C_PRIMARY_DARK}, angle = 45},
            inactive_border =  C_INACTIVE
        },

        resize_on_border = true,
        layout = "dwindle",

        allow_tearing = false, -- Ty Intel, https://wiki.hyprland.org/Configuring/Tearing/#apps-that-should-tear-freeze

        snap = {
            enabled = true,
            respect_gaps = false
        }
    },

    decoration = {
        rounding = 12,
        rounding_power = 2,

        active_opacity = 1,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1,

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            ignore_opacity = true,
            xray = false,
        },

        shadow = {
            enabled = false,
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = false,

        disable_watchdog_warning = true,

        disable_autoreload = false, -- hyprctl reload to manually reload

        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,

        mouse_move_enables_dpms = true,
        key_press_enables_dpms = false,

        initial_workspace_tracking = 0,
        focus_on_activate = false,

        enable_swallow = true,
        swallow_regex = "(kitty|Alacritty)",

        vrr = true,

        middle_click_paste = false,

        allow_session_lock_restore = true,

        enable_anr_dialog = false,
        anr_missed_pings = 2,
    },

    render = {
        cm_auto_hdr = 2,
        direct_scanout = 2,
        expand_undersized_textures = false,
        new_render_scheduling = true,
    },

    quirks = {
        -- prefer_hdr = 1
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
        enforce_permissions = true,
    }
})
