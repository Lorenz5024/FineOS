{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # wlogout
      "blur on, match:namespace logout_dialog"

      # rofi
      "animation slide, rofi"
      "blur on, match:namespace rofi"
    ];
  };
}
