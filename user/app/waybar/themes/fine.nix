{  hostSettings, ... }:

{

  # wayland.windowManager.hyprland.settings = {
  #   layerrule = [
  #     "blur on, match:namespace waybar"
  #   ];
  # };

  programs.waybar.settings.mainBar = {
    modules-left = [
      # "custom/icon"
      "hyprland/workspaces#numbers"
      # "hyprland/window"
      "custom/fine_radio"
      "mpris"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      # "group/hiddennetwork"
      # "temperature"
      # "cpu"
      # "memory"
      "tray"
      "hyprland/language"
      "idle_inhibitor"
      "pulseaudio"
      "${if hostSettings.isLaptop then "battery" else ""}"
    ];
  };

}
