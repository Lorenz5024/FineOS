{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      # keyboard layout, secondary layout
      kb_layout = "us,de";
      kb_options = "grp:alt_space_toggle";  # use this keybind to switch layouts

      # mouse
      accel_profile = "flat";

      # touchpad
      touchpad = {
	natural_scroll = true;
	scroll_factor = 0.25;
      };

    };

    # touchpad gestures
    gestures = {
      workspace_swipe_distance = 400;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_use_r = true;
    };

    gesture = [
      "3, horizontal, workspace"
    ];
  };
}
