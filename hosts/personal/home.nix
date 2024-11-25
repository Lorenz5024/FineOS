{ userSettings, ... }:

{
  imports = [ 
    ./common-home.nix
    ./packages.nix 
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@144, 0x0, 1, vrr, 1, bitdepth, 10"
      #"HDMI-A-1, 3840x2160@60, -642x-2160, 1, bitdepth, 10, vrr, 2"
      "HDMI-A-1, disable"
      ", disable"
    ];

    workspace = [
      "1, monitor:DP-1"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
    ];

    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "NVD_BACKEND,direct"
    ];

    bind = [
      "$mod_ALT, 1, exec, ${userSettings.flakeDir}/hosts/personal/scripts/monitor-layout-1.sh"
      "$mod_ALT, 2, exec, ${userSettings.flakeDir}/hosts/personal/scripts/monitor-layout-2.sh"
    ];
  };
}
