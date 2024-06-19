{ ... }:

{
  imports = [ 
    ./common-home.nix
    ./packages.nix 
  ];

  # Set up monitors for hyprland
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 2560x1440@165, 2560x0, 1, vrr, 1"
      #"HDMI-A-1, 3840x2160@60, 0x0, 1"
      "DP-2, 2560x1440@75, 0x0, 1"
      ", preferred, auto, 1, mirror, DP-1"
    ];

    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "NVD_BACKEND,direct"
    ];
  };
}
