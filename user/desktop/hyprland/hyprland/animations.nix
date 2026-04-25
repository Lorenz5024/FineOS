{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    bezier = [
      "overshot, 0.05, 0.9, 0.1, 1.03"
    ];
    animation = [
      # format: NAME, ON/OFF, SPEED, CURVE, STYLE
      "global, 1, 4, default"

      "windows, 1, 4, overshot, slide"
      "windowsMove, 1, 4, default"

      "specialWorkspace, 1, 8, default, fade"
    ];
  };
}
