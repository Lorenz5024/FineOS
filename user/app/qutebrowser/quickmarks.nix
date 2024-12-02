{ userSettings, ... }:

{
  programs.qutebrowser.quickmarks = {
    nixpkgs = "https://search.nixos.org/packages?channel=unstable";
    homemanager-options = "https://home-manager-options.extranix.com/?query=&release=master";

    hyprland = "https://wiki.hyprland.org/";
    waybar = "https://github.com/Alexays/Waybar/wiki";
    nixvim = "https://nix-community.github.io/nixvim/";
    stylix = "https://danth.github.io/stylix/";
    nerdfonts_icons = "https://www.nerdfonts.com/cheat-sheet";

    nextcloud = if userSettings.useNextcloud then userSettings.nextcloudURL else "https://nextcloud.com";
    mail = "https://mail.proton.me/u/1/inbox";

    youtube = "https://www.youtube.com/feed/subscriptions";

    # University
    tuwel = "https://tuwel.tuwien.ac.at/my/";
    tiss = "https://tiss.tuwien.ac.at/education/favorites.xhtml?dswid=3748&dsrid=739";


  };
}
