{ config, lib, pkgs, ... }:

{
  imports = [
    ./keybinds.nix
    ./animations.nix
    ./windowrules.nix
    ./layerrules.nix
    ./input.nix
    ./startup.nix
    ./workspaces.nix
    ./group.nix

    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

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

  home.packages = [ pkgs.hyprshutdown ];


}
