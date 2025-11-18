{ hostSettings, ... }:

{
  imports = [ 
    ./common-home.nix
    ./packages.nix 

    ./../../user/desktop/${hostSettings.desktop}/desktop.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitorv2 = [
      {
        output = "DP-1";
        mode = "3440x1440@144";
        position = "0x0";
        scale = 1;
        vrr = 3;
        addreserved = "0, 0, 440, 440";
        sdr_min_luminance = 0.005;

        cm = "hdr";
        sdrbrightness = 1.3;
        sdrsaturation = 1;
      }

      {
        output = "HDMI-A-1";
        disabled = true;
      }
    ];

    render = {
      cm_fs_passthrough = 0;
      cm_auto_hdr = 2;
    };

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
      # use for ultrawide monitors: switch between using full screen and only 16:9
      "$mod_ALT, down, exec, hyprctl keyword monitor \"DP-1, addreserved, 0, 0, 440, 440\""
      "$mod_ALT, up, exec, hyprctl keyword monitor \"DP-1, addreserved, 0, 0, 0, 0\""
      "$mod_CTRL_ALT, H, exec, hyprctl keyword monitor \"DP-1, 3440x1440@144.00, 0x0, 1, vrr, 3, cm, hdr, sdrbrightness, 1.3, sdrsaturation, 1\""
      "$mod_CTRL_ALT, S, exec, hyprctl keyword monitor \"DP-1, 3440x1440@144.00, 0x0, 1, vrr, 3,\""
    ];
  };
}
