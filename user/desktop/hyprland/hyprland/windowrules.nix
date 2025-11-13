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
      "tag +utility, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "tag +utility, class:^(org.pulseaudio.pavucontrol)$"

      # open on specific workspaces
      "workspace 4 silent, tag:chat"
      "workspace 6 silent, tag:gaming"

      # floating windows
      "float, tag:utility"

      "float, class:^(com.nextcloud.desktopclient.nextcloud)$"
      "float, class:^(wlogout)$"
      "float, class:^(yazi-scratchpad)$"
      "float, class:^(.blueman-manager-wrapped)$"
      "float, class:^(discord)"

      # transparency/opacity
      "opacity 1 override 0.95 override, class:^(kitty)$"

      # special workspaces
      "workspace special:terminal, class:^(kitty-scratchpad)"
      "workspace special:notes, class:^(obsidian)"
      "workspace special:music, class:^(spotify)"
      "workspace special:vault, class:^(Proton Pass)"
      "workspace special:sound, class:^(org.pulseaudio.pavucontrol)"
    ];
  };
}
