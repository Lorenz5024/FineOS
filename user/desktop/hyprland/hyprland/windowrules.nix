{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # tags  (doesn't work in current version. hyprctl version doesn't work either, so i have no idea what's wrong, considering I have the flake version installed, which should be the newest one unless I am mistaken)
      "tag +chat, class:^(discord)$"
      "tag +music, class:^(feishin)$"
      "tag +music, class:^(spotify)$"
      "tag +gaming, class:^(steam)$"
      "tag +gaming, class:^(heroic)$"
      "tag +utility, class:^(org.gnome.World.Iotas)"
      "tag +utility, class:^(org.speedcrunch)"
      "tag +utility, class:^(pavucontrol)"
      "tag +utility, class:^(Bitwarden)"
      "tag +utility, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "tag +utility, class:^( org.pulseaudio.pavucontrol)$"

      # open on specific workspaces
      "workspace 4 silent, tag:chat"
      "workspace 6 silent, tag:gaming"

      # floating windows
      "float, tag:utility"
      "float, tag:music"

      "float, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "float, class:^(wlogout)$"
      "float, class:^(yazi-scratchpad)$"
      "float, class:^(.blueman-manager-wrapped)$"
      "float, class:^(discord)"

      # centered windows 
      "center, class:^(yazi)$"
      "center, class:^(.blueman-manager-wrapped)$"

      # sizes
      "size 50% 50%, class:^(yazi)$"

      # transparency/opacity
      "opacity 1 override 0.85 override, class:^(kitty)$"

      # special workspaces
      "workspace special:terminal, kitty-scratchpad"

    ];
  };
}
