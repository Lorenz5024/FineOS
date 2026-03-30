{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # wlogout
      "blur on, logout_dialog"

      # rofi
      "animation slide, rofi"
      "blur on, rofi"
    ];
  };
}
