{ userSettings, lib, config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bezier = [
      "overshot, 0.05, 0.9, 0.1, 1.03"
    ];
    animation = [
      # format: NAME, ON/OFF, SPEED, CURVE, STYLE
      "global, 1, 4, default"

      "windows, 1, 4, overshot, slide"
      "windowsMove, 1, 4, default"

      "specialWorkspace, 1, 8, default, fade"
    ];
  };

  wayland.windowManager.hyprland.settings.group = {
    groupbar = {
      enabled = true;
      font_size = 16;

      "col.active" = "0xff${config.lib.stylix.colors.base0D}";
      "col.inactive" = "0xff${config.lib.stylix.colors.base02}";
      "text_color" = "0xff${config.lib.stylix.colors.base05}";
    };

    "col.border_active" = "0xff${config.lib.stylix.colors.base0D}";
  };
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "dwindle";

      border_size = 2;
      gaps_in = 4;
      gaps_out = 8;

      "col.active_border" =  lib.mkForce "rgb(${config.lib.stylix.colors.base0E})";

    };

    cursor = {
      inactive_timeout = 5;
      no_hardware_cursors = true;   # added to fix cursor stuttering. may be removed in future updates
    };

    decoration = {
      rounding = 8;

      blur = {
        enabled = true;
        size = 4;
        passes = 3;

        ignore_opacity = true;
      };
    };

    master = {
      new_on_top = false;
    };

    dwindle = {
      force_split = 2;      # 0 -> split follows mouse, 1 -> split to left, 2 -> split to right
      preserve_split = true;
    };

    misc = {
      animate_manual_resizes = true;
      disable_splash_rendering = true;
      disable_hyprland_logo = true;
      initial_workspace_tracking = 2;
    };

  };
  wayland.windowManager.hyprland.settings = {
    input = {
      # keyboard layout, secondary layout
      kb_layout = "us,de";
      kb_options = "grp:alt_space_toggle";  # use this keybind to switch layouts

      # mouse
      accel_profile = "flat";

      # touchpad
      touchpad = {
	natural_scroll = true;
	scroll_factor = 0.25;
      };

    };

    # touchpad gestures
    gestures = {
      workspace_swipe_distance = 400;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_use_r = true;
    };

    gesture = [
      "3, horizontal, workspace"
    ];
  };
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
      # Compositor commands
      "$mod_CTRL_ALT, F4, exec, pkill Hyprland"
      "$mod, Q, killactive"
      "$mod, F, fullscreen, 0"
      "$mod, M, fullscreen, 1"
      "$mod_CTRL, F, togglefloating"
      "$mod, G, togglegroup"

      # Move workspaces between monitors
      # "$mod_SHIFT_CTRL, H, movecurrentworkspacetomonitor, l"
      # "$mod_SHIFT_CTRL, J, movecurrentworkspacetomonitor, d"
      # "$mod_SHIFT_CTRL, K, movecurrentworkspacetomonitor, u"
      # "$mod_SHIFT_CTRL, L, movecurrentworkspacetomonitor, r"

      # power
      "$mod, P, exec, wlogout"

      # Restart programs
      "$mod_CTRL_ALT, B, exec, pkill waybar || waybar"		# waybar
      "$mod_CTRL_ALT, P, exec, pkill hyprpaper; hyprpaper" 	# hyprpaper

      # Launchers
      "$mod, RETURN, exec, $terminal"
      "$mod, T, exec, $fileManager"
      "$mod, Y, exec, $terminal --class yazi -e yazi "
      "$mod, M, exec, $musicPlayer"
      "$mod, B, exec, $browser"
      "$mod, S, exec, pavucontrol"

      # rofi
      "$mod, SPACE, exec, pkill rofi || rofi -show drun"	# App launcher
      "$mod, R, exec, fine-radio"	# Music
      "$mod, V, exec, pkill rofi || cliphist list | rofi -dmenu -window-title Clipboard | cliphist decode | wl-copy" # Text only clipboard
      "$mod, W, exec, fine-wallpaper"

      # clear clipboard
      "$mod_CTRL_ALT, V, exec, cliphist wipe"

      # take screenshot
      "$mod_SHIFT, S, exec, fine-screenshot"

      # scratchpads
      "$mod_ALT, RETURN, exec, hyprctl dispatch togglespecialworkspace terminal"
      "$mod_ALT, N, exec, hyprctl dispatch togglespecialworkspace notes"
      "$mod_ALT, B, exec, hyprctl dispatch togglespecialworkspace vault"
      "$mod_ALT, M, exec, hyprctl dispatch togglespecialworkspace music"
      "$mod_ALT, F, exec, hyprctl dispatch togglespecialworkspace files"

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

      # Change group active 
      "$mod, TAB, changegroupactive, f"
      "$mod_SHIFT, TAB, changegroupactive, b"

      # Move window in group
      "$mod_CTRL_ALT_SHIFT, H, movegroupwindow, b"
      "$mod_CTRL_ALT_SHIFT, L, movegroupwindow, f"

      # Toggle split direction in dwindle layout
      "$mod, O, layoutmsg, togglesplit"

      # Media control
      ", xf86audiomute, exec, amixer set Master toggle"
      ", xf86AudioPlayPause, exec, playerctl play-pause"
      ", xf86AudioPlay, exec, playerctl play-pause"
      ", xf86AudioPause, exec, playerctl play-pause"
      ", xf86AudioNext, exec, playerctl next"
      ", xf86AudioPrev, exec, playerctl previous"
      "CTRL, xf86AudioNext, exec, playerctl position 10+"
      "CTRL, xf86AudioPrev, exec, playerctl position 10-"
      "$mod_CTRL, V, exec, fine-cycle-audio"  # taken from windows, but I'm already used to it'

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

      "$mod, right, workspace, +1"
      "$mod, left, workspace, -1"

      # Move active window to a workspace 
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

      "$mod_CTRL_SHIFT, H, movetoworkspace, -1"
      "$mod_CTRL_SHIFT, L, movetoworkspace, +1"
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
      # swayosd
      ", xf86audioraisevolume, exec, swayosd-client --output-volume raise"
      ", xf86audiolowervolume, exec, swayosd-client --output-volume lower"
      # default
      # ", xf86audioraisevolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      # ", xf86audiolowervolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"

      # Laptop brightness
      ", xf86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ", xf86MonBrightnessUp, exec, swayosd-client --brightness raise"
      # ", xf86MonBrightnessDown, exec, brightnessctl set 5%-"
      # ", xf86MonBrightnessUp, exec, brightnessctl set +5%"

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
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # wlogout
      "blur on, match:namespace logout_dialog"

      # rofi
      "animation slide, match:namespace rofi"
      "blur on, match:namespace rofi"
    ];
  };
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"        
    "swaync"        
    "hyprpaper"
    "thunar --daemon"
    "nm-applet"
    "blueman-applet"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # tags  (doesn't work in current version. hyprctl version doesn't work either, so i have no idea what's wrong, considering I have the flake version installed, which should be the newest one unless I am mistaken)
      "tag +chat, match:class com.discordapp.Discord"
      "tag +music, match:class feishin"
      "tag +music, match:class spotify"
      "tag +gamelauncher, match:class steam"
      "tag +gamelauncher, match:class heroic"
      "tag +game, match:class steam_app_\\d+$"
      "tag +utility, match:class org.gnome.World.Iota"
      "tag +utility, match:class org.speedcrunch."
      "tag +utility, match:class com.nextcloud.desktopclient.nextcloud"
      "tag +utility, match:class org.pulseaudio.pavucontrol"
      "tag +browser, match:class vivaldi-stable"

      # open on specific workspaces
      "workspace 2, match:tag browser"
      "workspace 4 silent, match:tag chat"
      "workspace 5, match:tag gamelauncher"
      "workspace 6, match:tag game"

      # floating windows
      "float on, match:tag utility"

      "float on, match:class com.nextcloud.desktopclient.nextcloud"
      "float on, match:class wlogout"
      "float on, match:class yazi-scratchpad"
      "float on, match:class .blueman-manager-wrapped"
      "float on, match:class discor"

      # transparency/opacity
      "opacity 1 override 0.95 override, match:class kitty"

      # special workspaces
      "workspace special:terminal, match:class kitty-scratchpad"
      "workspace special:music, match:class spotify"
      "workspace special:vault, match:class Proton Pass"

      # sizes
      "size 800 600, match:class org.pulseaudio.pavucontrol"

      # games
      "tag +game, match:class Slay the Spire 2"
    ];
  };
  wayland.windowManager.hyprland.settings = {
    workspace = [
      # extra gaps on special workspaces
      "s[true], gapsout:128, animation:specialWorkspace"

      # no border when single window 
      # "w[1]s[false], border:false"

      # no border, rounding and gaps when maximized
      "f[1]s[false], border:false, rounding:false, gapsout:0"
    ];
  };
}
