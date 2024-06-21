{ userSettings, ... }:

{
  imports = [ 
    ./../personal/common-home.nix
    ./packages.nix 
  ];

  # Set up monitors for hyprland
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # dekstop setup
      # "DP-4, 2560x1440@75, 0x0, 1"
      # "DP-2, 2560x1440@60, 2560x0, 1" 
      # "eDP-1, 2256x1504, 5120x0, 1.333333"

      # just laptop
      "eDP-1, 2256x1504, 0x0, 1.333333"
      ", disable"
    ];
  };
}
