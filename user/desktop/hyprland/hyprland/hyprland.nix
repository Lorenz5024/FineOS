{ userSettings, config, pkgs, ... }:

let 
  configPath = "${userSettings.flakeDir}/user/desktop/hyprland/hyprland/hypr";
in
{
  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.packages = [ pkgs.hyprshutdown ];

  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/hyprland.lua";
  xdg.configFile."hypr/animations.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/animations.lua";
  xdg.configFile."hypr/startup.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/startup.lua";
  xdg.configFile."hypr/keybinds.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/keybinds.lua";
  xdg.configFile."hypr/windowrules.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/windowrules.lua";
  xdg.configFile."hypr/layerrules.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/layerrules.lua";
  xdg.configFile."hypr/gestures.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/gestures.lua";
  xdg.configFile."hypr/workspacerules.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/workspacerules.lua";

}
