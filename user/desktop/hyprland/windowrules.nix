{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # tags  (doesn't work in current version. hyprctl version doesn't work either, so i have no idea what's wrong, considering I have the flake version installed, which should be the newest one unless I am mistaken)
      "tag +chat, class:^(discord)$"
      "tag +music, class:^(feishin)$"
      "tag +gaming, class:^(steam)$"
      "tag +gaming, class:^(heroic)$"
      "tag +utility, class:^(org.gnome.World.Iotas)"
      "tag +utility, class:^(org.speedcrunch)"

      # open on specific workspaces
      "workspace 3, class:^(obsidian)"
      "workspace 4 silent, tag:chat"
      "workspace 5, tag:music"
      "workspace 6 silent, tag:gaming"

      # floating windows
      "float, tag:utility"

      "float, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "float, class:^(Bitwarden)$"
      "float, class:^(wlogout)$"
      "float, class:^(org.gnome.Calendar)$"
      "float, class:^(feishin)$"
      "float, class:^(pavucontrol)$"
      "float, class:^(yazi-scratchpad)$"
      "float, class:^(org.speedcrunch)$"
      "float, class:^(.blueman-manager-wrapped)$"
      "float, class:^(discord)"

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
