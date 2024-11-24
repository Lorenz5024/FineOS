{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # wlogout
      "blur, logout_dialog"

      # rofi
      "animation slide, rofi"
      "blur, rofi"
    ];
  };
}
