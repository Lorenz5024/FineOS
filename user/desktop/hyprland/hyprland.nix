{ config, lib, ... }:

{
  imports = [
    ./keybinds.nix
    ./animations.nix
    ./windowrules.nix
    ./layerrules.nix
    ./input.nix

    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.file = {
    ".config/hypr/pyprland.toml".source = ./plugins/pyprland.toml;
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "dwindle";

      border_size = 2;
      gaps_in = 4;
      gaps_out = 8;

      "col.active_border" =  lib.mkForce "rgb(${config.lib.stylix.colors.base0E})";

      cursor_inactive_timeout = 5;
    };

    decoration = {
      rounding = 8;

      blur = {
        enabled = true;
        size = 6;
        passes = 3;

        ignore_opacity = true;
      };
    };

    master = {
      new_is_master = false;
      new_on_top = false;
    };

    dwindle = {
      force_split = 2;
      preserve_split = true;
    };

    misc = {
      animate_manual_resizes = true;
      disable_splash_rendering = true;
    };

    exec-once = [
      "waybar"
      "hyprpaper"
      "hypridle"
      "swaync"
      "thunar --daemon"
      "nm-applet"
      "blueman-applet"
      "pypr"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];
  };


}
