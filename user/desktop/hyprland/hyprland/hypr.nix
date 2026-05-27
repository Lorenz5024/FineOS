{ config, userSettings, ... }:

{
  # wayland.windowManager.hyprland.enable = true;
  # wayland.windowManager.hyprland.configType = "lua";

  # xdg.configFile."hypr/hyprland.lua".source = ./../hypr/hyprland.lua;
  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${userSettings.flakeDir}/user/desktop/hyprland/hypr/hyprland.lua";
}

