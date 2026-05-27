-- Converted from your Home Manager Hyprland configuration
-- Requires Hyprland 0.55+
-- https://wiki.hypr.land/Configuring/Start/

-- =====================================================
-- Variables
-- =====================================================

-- Replace these with your actual applications or environment variables.
-- Since these previously came from Nix variables, they now need concrete values.
local terminal = "kitty"
local editor = "nvim"
local fileManager = "thunar"
local musicPlayer = "spotify"
local browser = "vivaldi"

-- Update these paths to match your setup
-- local rofiScripts = os.getenv("HOME") .. "/.config/rofi/scripts"
-- local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"

-- =====================================================
-- Monitors
-- =====================================================

hl.monitor({
  output = "DP-1",
  mode = "3440x1440@144",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "HDMI-1-A",
  disabled = true,
})

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

hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.03} } } )

hl.animation({ 
  leaf = "global",
  enabled = true,
  speed = 4,
  bezier = "default",
})

hl.animation({ 
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "overshot",
  style = "slide",
})

hl.animation({ 
  leaf = "windowsMove",
  enabled = true,
  speed = 4,
  bezier = "default",
})

hl.animation({ 
  leaf = "specialWorkspace",
  enabled = true,
  speed = 8,
  bezier = "default",
  style = "fade",
})

-- =====================================================
-- Gestures
-- =====================================================

-- hl.gesture.add({
--     fingers = 3,
--     direction = "horizontal",
--     action = "workspace",
-- })

-- =====================================================
-- Exec Once
-- =====================================================

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("thunar --daemon")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


-- =====================================================
-- Keybinds
-- =====================================================

-- Compositor commands
hl.bind("SUPER + CTRL + ALT + F4", hl.dsp.exec_cmd("pkill Hyprland"))

-- Window management
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind("SUPER + CTRL + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + G", hl.dsp.group.toggle())

-- Power
hl.bind("SUPER + P", hl.dsp.exec_cmd("wlogout"))

-- Restart programs
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind("SUPER + CTRL + ALT + P", hl.dsp.exec_cmd("pkill hyprpaper; hyprpaper"))

-- Launchers
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + T", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + Y", hl.dsp.exec_cmd(terminal .. " --class yazi -e yazi"))
-- hl.bind("SUPER + M", hl.dsp.exec_cmd(musicPlayer))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + S", hl.dsp.exec_cmd("pavucontrol"))

-- Rofi / tools
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("fine-radio"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(
    "pkill rofi || cliphist list | rofi -dmenu -window-title Clipboard | cliphist decode | wl-copy"
))
hl.bind("SUPER + W", hl.dsp.exec_cmd("fine-wallpaper"))

-- Clipboard
hl.bind("SUPER + CTRL + ALT + V", hl.dsp.exec_cmd("cliphist wipe"))

-- Screenshot
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("fine-screenshot"))

-- Scratchpads
hl.bind("SUPER + ALT + RETURN", hl.dsp.workspace.toggle_special("terminal"))
hl.bind("SUPER + ALT + N", hl.dsp.workspace.toggle_special("notes"))
hl.bind("SUPER + ALT + B", hl.dsp.workspace.toggle_special("vault"))
hl.bind("SUPER + ALT + M", hl.dsp.workspace.toggle_special("music"))
hl.bind("SUPER + ALT + F", hl.dsp.workspace.toggle_special("files"))

-- Focus (correct dispatcher: focus)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

-- Move windows
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Groups (correct API)
hl.bind("SUPER + TAB", hl.dsp.group.next({ window = "activewindow" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.prev({ window = "activewindow" }))

-- Layout
hl.bind("SUPER + O", hl.dsp.layout("togglesplit"))

-- Workspaces
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + RIGHT", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + LEFT", hl.dsp.focus({ workspace = "-1" }))



-- =====================================================
-- Volume and Brightness
-- =====================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))

-- =====================================================
-- Layer Rules
-- =====================================================

hl.layer_rule({
  match = { namespace = "logout_dialog" },
  blur = true,
})

hl.layer_rule({
  match = { namespace = "rofi" },
  animation = "slide",
  blur = true,
})



-- =====================================================
-- Window Rules
-- =====================================================

-- set tags
hl.window_rule({ match = { class = "discord" }, tag = "+chat" })
hl.window_rule({ match = { class = "Spotify" }, tag = "+music" })
hl.window_rule({ match = { class = "steam" }, tag = "+gamelauncher" })
hl.window_rule({ match = { class = "heroic" }, tag = "+gamelauncher" })
hl.window_rule({ match = { class = "steam_app_\\d+$" }, tag = "+game" })
hl.window_rule({ match = { class = "org.gnome.World.Iota" }, tag = "+utility" })
hl.window_rule({ match = { class = "org.speedcrunch." }, tag = "+utility" })
hl.window_rule({ match = { class = "com.nextcloud.desktopclient.nextcloud" }, tag = "+utility" })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, tag = "+utility" })
hl.window_rule({ match = { class = "vivaldi-stable" }, tag = "+browser" })
hl.window_rule({ match = { class = "kitty" }, tag = "+terminal" })

hl.window_rule({ name = "workspace-browser", 		match = { tag = "browser" }, workspace = "2", })
hl.window_rule({ name = "workspace-chat", 		match = { tag = "chat" }, workspace = "4 silent", })
hl.window_rule({ name = "workspace-gamelauncher", 	match = { tag = "gamelauncher" }, workspace = "5", })
hl.window_rule({ name = "workspace-game", 		match = { tag = "game" }, workspace = "6", })

hl.window_rule({ name = "float-utility", match = { tag = "utility" }, float = true, })

hl.window_rule({ name = "transparent-terminal", match = { tag = "terminal" }, opacity = "1 0.95", })

hl.window_rule({ name = "special-workspace-music", match = { tag = "music" }, workspace = "special:music", })


