-- =====================================================
-- Variables
-- =====================================================

local mod = "SUPER"

-- Replace these with your actual applications or environment variables.
-- Since these previously came from Nix variables, they now need concrete values.
local terminal = "kitty"
local editor = "nvim"
local fileManager = "thunar"
local musicPlayer = "spotify"
local browser = "vivaldi-stable"

-- Update these paths to match your setup
local rofiScripts = os.getenv("HOME") .. "/.config/rofi/scripts"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"

-- =====================================================
-- Main Configuration
-- =====================================================

hl.config({
    general = {
        layout = "dwindle",

        border_size = 2,
        gaps_in = 4,
        gaps_out = 8,

        -- Replace with your desired colors
        col = {
            active_border = "rgb(cba6f7)",
        },
    },

    cursor = {
        inactive_timeout = 5,
        no_hardware_cursors = true,
    },

    decoration = {
        rounding = 8,

        blur = {
            enabled = true,
            size = 4,
            passes = 3,
            ignore_opacity = true,
        },
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
        initial_workspace_tracking = 2,
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

    group = {
        groupbar = {
            enabled = true,
            font_size = 16,

            col = {
                active = "0xff89b4fa",
                inactive = "0xff313244",
})
