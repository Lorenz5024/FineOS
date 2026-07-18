-- =====================================================
-- Keybinds
-- =====================================================

-- Replace these with your actual applications or environment variables.
-- Since these previously came from Nix variables, they now need concrete values.
local terminal = "kitty"
local editor = "nvim"
local fileManager = "thunar"
local musicPlayer = "spotify"
local browser = "vivaldi"

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
hl.bind("SUPER + P", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/scripts/powermenu.sh"))

-- Restart programs
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd("pkill waybar || waybar"))
-- hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd("pkill ashell; ashell"))
hl.bind("SUPER + CTRL + ALT + P", hl.dsp.exec_cmd("pkill hyprpaper; hyprpaper"))

-- Launchers
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + T", hl.dsp.exec_cmd(fileManager))
-- hl.bind("SUPER + Y", hl.dsp.exec_cmd(terminal .. " --class yazi -e yazi"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + S", hl.dsp.exec_cmd("pavucontrol"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker -a"))


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

-- Scratchpads general
hl.bind("SUPER + ALT + RETURN", hl.dsp.workspace.toggle_special("terminal"))
hl.bind("SUPER + ALT + N", hl.dsp.workspace.toggle_special("notes"))
hl.bind("SUPER + ALT + M", hl.dsp.workspace.toggle_special("music"))
hl.bind("SUPER + ALT + F", hl.dsp.workspace.toggle_special("files"))

-- kind of scratchpads, for specific programs
hl.bind("SUPER + Z", hl.dsp.workspace.toggle_special("zathura"))

-- If yazi is minimized -> get yazi 
-- If yazi is not minimized -> minimiz it 
-- Else start yazi
hl.bind("SUPER + Y", function ()
    if hl.get_workspace("special:yazi") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    elseif hl.get_window("class:yazi") then
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_window("class:yazi") }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:yazi", window = hl.get_window("class:yazi"), follow = false }))
    else 
	hl.dispatch(hl.dsp.exec_cmd(terminal .. " --class yazi -e yazi"))
    end
end)


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

-- Move windows between workspaces 
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.move({ workspace = "-1" }))

-- Volume and Brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))

-- Cycle audio sources
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd("fine-cycle-audio"))

-- Media
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

-- Window mouse actions
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- monitor brightness 
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

