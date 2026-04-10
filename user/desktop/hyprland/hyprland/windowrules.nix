{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # tags  (doesn't work in current version. hyprctl version doesn't work either, so i have no idea what's wrong, considering I have the flake version installed, which should be the newest one unless I am mistaken)
      "tag +chat, match:class com.discordapp.Discord"
      "tag +music, match:class feishin"
      "tag +music, match:class spotify"
      "tag +gamelauncher, match:class steam"
      "tag +gamelauncher, match:class heroic"
      "tag +game, match:class steam_app_\\d+$"
      "tag +utility, match:class org.gnome.World.Iota"
      "tag +utility, match:class org.speedcrunch."
      "tag +utility, match:class com.nextcloud.desktopclient.nextcloud"
      "tag +utility, match:class org.pulseaudio.pavucontrol"
      "tag +browser, match:class vivaldi-stable"

      # open on specific workspaces
      "workspace 2, match:tag browser"
      "workspace 4 silent, match:tag chat"
      "workspace 5 silent, match:tag gamelauncher"
      "workspace 6, match:tag game"

      # floating windows
      "float on, match:tag utility"

      "float on, match:class com.nextcloud.desktopclient.nextcloud"
      "float on, match:class wlogout"
      "float on, match:class yazi-scratchpad"
      "float on, match:class .blueman-manager-wrapped"
      "float on, match:class discor"

      # transparency/opacity
      "opacity 1 override 0.95 override, match:class kitty"

      # special workspaces
      "workspace special:terminal, match:class kitty-scratchpad"
      "workspace special:notes, match:class obsidian"
      "workspace special:music, match:class spotify"
      "workspace special:vault, match:class Proton Pass"
      "workspace special:sound, match:class org.pulseaudio.pavucontrol"
    ];
  };
}
