{ lib, userSettings, ... }:

{
  wayland.windowManager.hyprland.settings = 
  {

    "$mod"          = "SUPER";
    "$terminal"     = userSettings.terminal;
    "$editor"       = userSettings.editor;
    "$fileManager"  = userSettings.fileManager;
    "$musicPlayer"  = userSettings.musicPlayer;
    "$browser"      = userSettings.browser;
    "$rofiScripts"  = userSettings.flakeDir + "/user/app/rofi/scripts";
    "$scriptsDir"   = userSettings.flakeDir + "/user/desktop/hyprland/scripts";

    bind = [
      # Edit dotfiles
      "$mod_CTRL, SPACE, exec, $terminal -d ${userSettings.flakeDir} -e $editor"

      # Compositor commands
      "$mod_CTRL_ALT, F4, exec, pkill Hyprland"
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      "$mod_CTRL, F, togglefloating"
      "$mod, G, togglegroup"
      "$mod_CTRL, G, changegroupactive, f"

      # Move workspaces between monitors
      "$mod_SHIFT_CTRL, H, movecurrentworkspacetomonitor, l"
      "$mod_SHIFT_CTRL, J, movecurrentworkspacetomonitor, d"
      "$mod_SHIFT_CTRL, K, movecurrentworkspacetomonitor, u"
      "$mod_SHIFT_CTRL, L, movecurrentworkspacetomonitor, r"

      # power 
      "$mod, P, exec, wlogout"
      "$mod, I, exec, wlogout"

      # Restart programs
      "$mod_CTRL_ALT, B, exec, pkill waybar; waybar"		# waybar
      "$mod_CTRL_ALT, P, exec, pkill hyprpaper; hyprpaper" 	# hyprpaper

      # Launchers
      "$mod, RETURN, exec, $terminal"
      "$mod, T, exec, $fileManager"
      "$mod, Y, exec, $terminal --class yazi -e yazi "
      "$mod, M, exec, $musicPlayer"
      "$mod, B, exec, $browser"

      # rofi 
      "$mod, SPACE, exec, pkill rofi || rofi -show drun"	# App launcher
      "$mod, R, exec, fine-radio"	# Music
      "$mod, V, exec, pkill rofi || cliphist list | rofi -dmenu -window-title Clipboard | cliphist decode | wl-copy" # Text only clipboard
      "$mod, W, exec, fine-wallpaper"

      # clear clipboard 
      "$mod_CTRL_ALT, V, exec, cliphist wipe"

      # take screenshot
      "CTRL_ALT, S, exec, $scriptsDir/screenshot-region.sh"

      # scratchpads
      "$mod_ALT, RETURN, exec, pypr toggle term"
      "$mod_ALT, Y, exec, pypr toggle yazi"
      "$mod_ALT, S, exec, pypr toggle audio"
      "$mod_ALT, C, exec, pypr toggle calculator"
      "$mod_ALT, N, exec, pypr toggle notes"
      "$mod_ALT, T, exec, pypr toggle thunar"
      "$mod_ALT, B, exec, pypr toggle bitwarden"
      "$mod_ALT, M, exec, pypr toggle music"

      # Move focus 
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"

      # Move windows
      "$mod_SHIFT, H, movewindow, l"
      "$mod_SHIFT, J, movewindow, d"
      "$mod_SHIFT, K, movewindow, u"
      "$mod_SHIFT, L, movewindow, r"

      # Toggle split direction in dwindle layout
      "$mod, S, togglesplit"

      # Media control
      ", xf86audiomute, exec, amixer set Master toggle"
      ", xf86AudioPlayPause, exec, playerctl play-pause"
      ", xf86AudioPlay, exec, playerctl play-pause"
      ", xf86AudioPause, exec, playerctl play-pause"
      ", xf86AudioNext, exec, playerctl next"
      ", xf86AudioPrev, exec, playerctl previous"
      "CTRL, xf86AudioNext, exec, playerctl position 10+"
      "CTRL, xf86AudioPrev, exec, playerctl position 10-"

      # Switch workspaces with mod + [0-9]
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to a workspace with mod + SHIFT + [0-9]
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
    ];



    # ------------------------------
    # Mouse bindings
    # ------------------------------

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];



    # ------------------------------
    # Repeat when held
    # ------------------------------

    binde = [
      # Media control
      ", xf86audioraisevolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", xf86audiolowervolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"

      # Laptop brightness
      ", xf86MonBrightnessDown, exec, brightnessctl set 5%-"
      ", xf86MonBrightnessUp, exec, brightnessctl set +5%"

      # Resize windows
      "$mod_CTRL, H, resizeactive, -30 0"
      "$mod_CTRL, L, resizeactive, 30 0"
      "$mod_CTRL, K, resizeactive, 0 -30"
      "$mod_CTRL, J, resizeactive, 0 30"


      # Move windows between workspaces on current monitor
      "$mod_ALT_SHIFT, H, movetoworkspace, m-1"
      "$mod_ALT_SHIFT, L, movetoworkspace, m+1"
    ];

  };
}
