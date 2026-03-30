{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # tags  (doesn't work in current version. hyprctl version doesn't work either, so i have no idea what's wrong, considering I have the flake version installed, which should be the newest one unless I am mistaken)
      "tag +chat, match:class discord"
      "tag +music, match:class feishin"
      "tag +music, match:class spotify"
      "tag +gaming, match:class steam"
      "tag +gaming, match:class heroic"
      "tag +utility, match:class org.gnome.World.Iota"
      "tag +utility, match:class org.speedcrunc"
      "tag +utility, match:class pavucontro"
      "tag +utility, match:class com.nextcloud.desktopclient.nextcloud"
      "tag +utility, match:class org.pulseaudio.pavucontrol"

      # open on specific workspaces
      "workspace 4 silent, tag:chat"
      "workspace 6 silent, tag:gaming"

      # floating windows
      "float, tag:utility"

      "float, match:class com.nextcloud.desktopclient.nextcloud"
      "float, match:class wlogout"
      "float, match:class yazi-scratchpad"
      "float, match:class .blueman-manager-wrapped"
      "float, match:class discor"

      # transparency/opacity
      "opacity 1 override 0.95 override, class:^(kitty)$"

      # special workspaces
      "workspace special:terminal, class kitty-scratchpad"
      "workspace special:notes, class obsidian"
      "workspace special:music, class spotify"
      "workspace special:vault, class Proton Pass"
      "workspace special:sound, class org.pulseaudio.pavucontrol"
    ];
  };
}
