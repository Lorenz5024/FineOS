-- =====================================================
-- Inports
-- =====================================================

require("animations")
require("startup")
require("keybinds")
require("windowrules")
require("layerrules")
require("gestures")
require("workspacerules")
require("hardware")
require("theme")

-- =====================================================
-- Monitors
-- =====================================================


hl.monitor({
  output = "HDMI-A-1",
  disabled = true,
})

-- =====================================================
-- Main Configuration
-- =====================================================

hl.config({
    general = {
        layout = "dwindle",
    },

    cursor = {
        inactive_timeout = 5,
        no_hardware_cursors = true,
    },

    master = {
        new_on_top = false,
    },

    dwindle = {
        force_split = 2,
        preserve_split = true,
    },

    misc = {
        animate_manual_resizes = true,
        disable_splash_rendering = true,
        disable_hyprland_logo = true,
        initial_workspace_tracking = 0,
    },

    input = {
        kb_layout = "us,de",
        kb_options = "grp:alt_space_toggle",

        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.25,
        },
    },

    gestures = {
        workspace_swipe_distance = 400,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_cancel_ratio = 0.5,
        workspace_swipe_use_r = true,
    },

})






