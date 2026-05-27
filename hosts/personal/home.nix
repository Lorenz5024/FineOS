{ hostSettings, ... }:

{
  imports = [ 
    ./../common-home.nix
    ./packages.nix 
  ] ++ map (e: ./. + "/../../user/desktop/${e}/desktop.nix") hostSettings.desktops;

  # set host specific hyprland config
  xdg.configFile."hypr/hardware.lua".text = ''
    hl.env("LIBVA_DRIVER_NAME", "nvidia")
    hl.env("XDG_SESSION_TYPE", "wayland")
    hl.env("GBM_BACKEND", "nvidia-drm")
    hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
    hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
    hl.env("NVD_BACKEND", "direct")

    hl.monitor({
      output = "DP-1",
      mode = "3440x1440@144",
      position = "0x0",
      scale = 1,
      reserved_area = {
        right = 440,
        left = 440,
      }
    })

    hl.monitor({
      output = "HDMI-A-1",
      disabled = true,
    })

    -- set reserved area
  '';

  #   bind = [
  #     # use for ultrawide monitors: switch between using full screen and only 16:9
  #     "$mod_ALT, down, exec, hyprctl keyword monitor \"DP-1, addreserved, 0, 0, 440, 440\""
  #     "$mod_ALT, up, exec, hyprctl keyword monitor \"DP-1, addreserved, 0, 0, 0, 0\""
  #     "$mod_SHIFT_CTRL_ALT, F1, exec, hyprctl keyword monitor \"DP-1, 3440x1440@144.00, 3840x0, 1, vrr, 3, bitdepth, 10\" && hyprctl keyword monitor \"HDMI-A-1, disable\""
  #     "$mod_SHIFT_CTRL_ALT, F2, exec, hyprctl keyword monitor \"DP-1, 3440x1440@144.00, 0x0, 1, bitdepth, 10, vrr, 3, cm, hdr, sdrbrightness, 1.3, sdrsaturation, 1\""
  #     "$mod_SHIFT_CTRL_ALT, F6, exec, hyprctl keyword monitor \"HDMI-A-1, 3840x2160@120.00, 3440x0, 1, vrr, 3\" && hyprctl keyword monitor \"DP-1, disable\""
  #     "$mod_SHIFT_CTRL_ALT, F7, exec, hyprctl keyword monitor \"HDMI-A-1, 3840x2160@120.00, 3440x0, 2, vrr, 3\" && hyprctl keyword monitor \"DP-1, disable\""
  #     #"HDMI-A-1, 3840x2160@60, -642x-2160, 1, bitdepth, 10, vrr, 2"
  #   ];
  # };
}
