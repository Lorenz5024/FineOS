{ config, hostSettings, userSettings, ... }:

{
  imports = [ 
    ./../common-home.nix
    ./packages.nix 
  ] ++ map (e: ./. + "/../../user/desktop/${e}/desktop.nix") hostSettings.desktops;

  # set host specific hyprland config
  xdg.configFile."hypr/hardware.lua".source = config.lib.file.mkOutOfStoreSymlink "${userSettings.flakeDir}/user/desktop/hyprland/hyprland/hypr/hosts/desktop.lua";
}
