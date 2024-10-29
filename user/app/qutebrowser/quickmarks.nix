{ userSettings, ... }:

{
  programs.qutebrowser.quickmarks = {
    nixpkgs = "https://search.nixos.org/packages";
    homemanager-options = "https://home-manager-options.extranix.com/?query=&release=master";

    hyprland = "https://wiki.hyprland.org/";
    waybar = "https://github.com/Alexays/Waybar/wiki";
    nixvim = "https://nix-community.github.io/nixvim/";
    stylix = "https://danth.github.io/stylix/";
    nerdfonts_icons = "https://www.nerdfonts.com/cheat-sheet";

    nextcloud = if userSettings.useNextcloud then userSettings.nextcloudURL else "https://nextcloud.com";
    mail = "https://mail.proton.me/u/1/inbox";

    youtube = "https://www.youtube.com/feed/subscriptions";


  };
}
