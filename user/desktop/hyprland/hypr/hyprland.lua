-- Converted from your Home Manager Hyprland configuration
-- Requires Hyprland 0.55+
-- https://wiki.hypr.land/Configuring/Start/

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
            },

            text_color = "0xffcdd6f4",
        },

        col = {
            border_active = "0xff89b4fa",
        },
    },
})

-- =====================================================
-- Animations
-- =====================================================

hl.animation.bezier("overshot", 0.05, 0.9, 0.1, 1.03)

hl.animation.add("global", {
    enabled = true,
    speed = 4,
    curve = "default",
})

hl.animation.add("windows", {
    enabled = true,
    speed = 4,
    curve = "overshot",
    style = "slide",
})

hl.animation.add("windowsMove", {
    enabled = true,
    speed = 4,
    curve = "default",
})

hl.animation.add("specialWorkspace", {
    enabled = true,
    speed = 8,
    curve = "default",
    style = "fade",
})

-- =====================================================
-- Gestures
-- =====================================================

hl.gesture.add({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- =====================================================
-- Exec Once
-- =====================================================

hl.exec_once("waybar")
hl.exec_once("swaync")
hl.exec_once("hyprpaper")
hl.exec_once("thunar --daemon")
hl.exec_once("nm-applet")
hl.exec_once("blueman-applet")
hl.exec_once("wl-paste --type text --watch cliphist store")
hl.exec_once("wl-paste --type image --watch cliphist store")

-- =====================================================
-- Keybinds
-- =====================================================

local binds = {
    -- Compositor commands
    { mods = mod .. "_CTRL_ALT", key = "F4", action = "exec", args = "pkill Hyprland" },
    { mods = mod, key = "Q", action = "killactive" },
    { mods = mod, key = "F", action = "fullscreen", args = "0" },
    { mods = mod, key = "M", action = "fullscreen", args = "1" },
    { mods = mod .. "_CTRL", key = "F", action = "togglefloating" },
    { mods = mod, key = "G", action = "togglegroup" },

    -- Power
    { mods = mod, key = "P", action = "exec", args = "wlogout" },

    -- Restart programs
    { mods = mod .. "_CTRL_ALT", key = "B", action = "exec", args = "pkill waybar || waybar" },
    { mods = mod .. "_CTRL_ALT", key = "P", action = "exec", args = "pkill hyprpaper; hyprpaper" },

    -- Launchers
    { mods = mod, key = "RETURN", action = "exec", args = terminal },
    { mods = mod, key = "T", action = "exec", args = fileManager },
    { mods = mod, key = "Y", action = "exec", args = terminal .. " --class yazi -e yazi" },
    { mods = mod, key = "M", action = "exec", args = musicPlayer },
    { mods = mod, key = "B", action = "exec", args = browser },
    { mods = mod, key = "S", action = "exec", args = "pavucontrol" },

    -- Rofi
    { mods = mod, key = "SPACE", action = "exec", args = "pkill rofi || rofi -show drun" },
    { mods = mod, key = "R", action = "exec", args = "fine-radio" },
    { mods = mod, key = "V", action = "exec", args = "pkill rofi || cliphist list | rofi -dmenu -window-title Clipboard | cliphist decode | wl-copy" },
    { mods = mod, key = "W", action = "exec", args = "fine-wallpaper" },

    -- Clipboard
    { mods = mod .. "_CTRL_ALT", key = "V", action = "exec", args = "cliphist wipe" },

    -- Screenshot
    { mods = mod .. "_SHIFT", key = "S", action = "exec", args = "fine-screenshot" },

    -- Scratchpads
    { mods = mod .. "_ALT", key = "RETURN", action = "exec", args = "hyprctl dispatch togglespecialworkspace terminal" },
    { mods = mod .. "_ALT", key = "N", action = "exec", args = "hyprctl dispatch togglespecialworkspace notes" },
    { mods = mod .. "_ALT", key = "B", action = "exec", args = "hyprctl dispatch togglespecialworkspace vault" },
    { mods = mod .. "_ALT", key = "M", action = "exec", args = "hyprctl dispatch togglespecialworkspace music" },
    { mods = mod .. "_ALT", key = "F", action = "exec", args = "hyprctl dispatch togglespecialworkspace files" },

    -- Focus
    { mods = mod, key = "H", action = "movefocus", args = "l" },
    { mods = mod, key = "J", action = "movefocus", args = "d" },
    { mods = mod, key = "K", action = "movefocus", args = "u" },
    { mods = mod, key = "L", action = "movefocus", args = "r" },

    -- Move windows
    { mods = mod .. "_SHIFT", key = "H", action = "movewindow", args = "l" },
    { mods = mod .. "_SHIFT", key = "J", action = "movewindow", args = "d" },
    { mods = mod .. "_SHIFT", key = "K", action = "movewindow", args = "u" },
    { mods = mod .. "_SHIFT", key = "L", action = "movewindow", args = "r" },

    -- Groups
    { mods = mod, key = "TAB", action = "changegroupactive", args = "f" },
    { mods = mod .. "_SHIFT", key = "TAB", action = "changegroupactive", args = "b" },

    { mods = mod .. "_CTRL_ALT_SHIFT", key = "H", action = "movegroupwindow", args = "b" },
    { mods = mod .. "_CTRL_ALT_SHIFT", key = "L", action = "movegroupwindow", args = "f" },

    -- Layout
    { mods = mod, key = "O", action = "layoutmsg", args = "togglesplit" },

    -- Media
    { mods = "", key = "xf86audiomute", action = "exec", args = "amixer set Master toggle" },
    { mods = "", key = "xf86AudioPlayPause", action = "exec", args = "playerctl play-pause" },
    { mods = "", key = "xf86AudioPlay", action = "exec", args = "playerctl play-pause" },
    { mods = "", key = "xf86AudioPause", action = "exec", args = "playerctl play-pause" },
    { mods = "", key = "xf86AudioNext", action = "exec", args = "playerctl next" },
    { mods = "", key = "xf86AudioPrev", action = "exec", args = "playerctl previous" },

    -- Workspace switching
    { mods = mod, key = "1", action = "workspace", args = "1" },
    { mods = mod, key = "2", action = "workspace", args = "2" },
    { mods = mod, key = "3", action = "workspace", args = "3" },
    { mods = mod, key = "4", action = "workspace", args = "4" },
    { mods = mod, key = "5", action = "workspace", args = "5" },
    { mods = mod, key = "6", action = "workspace", args = "6" },
    { mods = mod, key = "7", action = "workspace", args = "7" },
    { mods = mod, key = "8", action = "workspace", args = "8" },
    { mods = mod, key = "9", action = "workspace", args = "9" },
    { mods = mod, key = "0", action = "workspace", args = "10" },

    { mods = mod, key = "right", action = "workspace", args = "+1" },
    { mods = mod, key = "left", action = "workspace", args = "-1" },
}

for _, bind in ipairs(binds) do
    hl.bind(bind)
end

-- =====================================================
-- Mouse binds
-- =====================================================

hl.bindm({
    mods = mod,
    key = "mouse:272",
    action = "movewindow",
})

hl.bindm({
    mods = mod,
    key = "mouse:273",
    action = "resizewindow",
})

-- =====================================================
-- Repeat binds
-- =====================================================

local repeatBinds = {
    { mods = "", key = "xf86audioraisevolume", action = "exec", args = "swayosd-client --output-volume raise" },
    { mods = "", key = "xf86audiolowervolume", action = "exec", args = "swayosd-client --output-volume lower" },

    { mods = "", key = "xf86MonBrightnessDown", action = "exec", args = "swayosd-client --brightness lower" },
    { mods = "", key = "xf86MonBrightnessUp", action = "exec", args = "swayosd-client --brightness raise" },

    { mods = mod .. "_CTRL", key = "H", action = "resizeactive", args = "-30 0" },
    { mods = mod .. "_CTRL", key = "L", action = "resizeactive", args = "30 0" },
    { mods = mod .. "_CTRL", key = "K", action = "resizeactive", args = "0 -30" },
    { mods = mod .. "_CTRL", key = "J", action = "resizeactive", args = "0 30" },

    { mods = mod .. "_ALT_SHIFT", key = "H", action = "movetoworkspace", args = "m-1" },
    { mods = mod .. "_ALT_SHIFT", key = "L", action = "movetoworkspace", args = "m+1" },
}

for _, bind in ipairs(repeatBinds) do
    hl.binde(bind)
end

-- =====================================================
-- Layer Rules
-- =====================================================

hl.layerrule({
    rule = "blur",
    value = true,
    match = "namespace logout_dialog",
})

hl.layerrule({
    rule = "animation",
    value = "slide",
    match = "namespace rofi",
})

hl.layerrule({
    rule = "blur",
    value = true,
    match = "namespace rofi",
})

-- =====================================================
-- Window Rules
-- =====================================================

local windowrules = {
    "tag +chat, match:class com.discordapp.Discord",
    "tag +music, match:class feishin",
    "tag +music, match:class spotify",
    "tag +gamelauncher, match:class steam",
    "tag +gamelauncher, match:class heroic",
    "tag +game, match:class steam_app_\\d+$",
    "tag +utility, match:class org.gnome.World.Iota",
    "tag +utility, match:class org.speedcrunch.",
    "tag +utility, match:class com.nextcloud.desktopclient.nextcloud",
    "tag +utility, match:class org.pulseaudio.pavucontrol",
    "tag +browser, match:class vivaldi-stable",

    "workspace 2, match:tag browser",
    "workspace 4 silent, match:tag chat",
    "workspace 5, match:tag gamelauncher",
    "workspace 6, match:tag game",

    "float on, match:tag utility",

    "float on, match:class com.nextcloud.desktopclient.nextcloud",
    "float on, match:class wlogout",
    "float on, match:class yazi-scratchpad",
    "float on, match:class .blueman-manager-wrapped",
    "float on, match:class discor",

    "opacity 1 override 0.95 override, match:class kitty",

    "workspace special:terminal, match:class kitty-scratchpad",
    "workspace special:music, match:class spotify",
    "workspace special:vault, match:class Proton Pass",

    "size 800 600, match:class org.pulseaudio.pavucontrol",

    "tag +game, match:class Slay the Spire 2",
}

for _, rule in ipairs(windowrules) do
    hl.windowrule(rule)
end

-- =====================================================
-- Workspace Rules
-- =====================================================

hl.workspace.rule("s[true], gapsout:128, animation:specialWorkspace")
hl.workspace.rule("f[1]s[false], border:false, rounding:false, gapsout:0")
