{ hostSettings, ... }:

{
  imports = [ 
    ./../common-home.nix
    ./packages.nix 
  ] ++ map (e: ./. + "/../../user/desktop/${e}/desktop.nix") hostSettings.desktops;

  # Set up monitors for hyprland
  xdg.configFile."hypr/hardware.lua".text = ''
    hl.monitor({
      output = "eDP-1",
      mode = "2256x1504",
      scale = 1.333333,
    })
  '';
}
