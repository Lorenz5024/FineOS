{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      # wlogout
      "blur on, match:namespace logout_dialog"

      # rofi
      "animation slide, match:namespace rofi"
      "blur on, match:namespace rofi"
    ];
  };
}
