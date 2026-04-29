--  HYPRLAND - alba4k
--
-- Documentation: https://wiki.hypr.land/Configuring/Basics/Variables/#input
--
-- ##############################################
-- ###                 INPUT                  ###
-- ##############################################

hl.config({
    input = {
        kb_layout = "ch",
        kb_variant = "de",
        -- kb_options = "caps:escape"

        numlock_by_default = true,

        accel_profile = "adaptive",

        follow_mouse = 1,

        natural_scroll = false,

        sensitivity = -0.1,

        touchpad = {
            disable_while_typing = false,
            drag_lock = 0,
            natural_scroll = true,
            tap_to_click = true
        }
    },
    cursor = {
        inactive_timeout = 5,
        sync_gsettings_theme = true,
        warp_on_change_workspace = 1,
        zoom_factor = 1.0
    }
})
