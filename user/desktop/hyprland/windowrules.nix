{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # floating windows
      "float, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "float, class:^(Bitwarden)$"
      "float, class:^(wlogout)$"
      "float, class:^(org.gnome.Calendar)$"
      "float, class:^(feishin)$"
      "float, class:^(pavucontrol)$"
      "float, class:^(yazi-scratchpad)$"
      "float, class:^(org.speedcrunch)$"
      "float, class:^(.blueman-manager-wrapped)$"

      # centered windows 
      "center, class:^(pavucontrol)$"
      "center, class:^(yazi)$"
      "center, class:^(.blueman-manager-wrapped)$"

      # sizes
      "size 50% 50%, class:^(yazi)$"

      # transparency/opacity
      "opacity 1 override 0.85 override, class:^(kitty)$"
      "opacity 1 override 0.85 override, class:^(kitty-scratchpad)$"
    ];
  };
}
