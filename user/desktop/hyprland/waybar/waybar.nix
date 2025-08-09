{ userSettings, ... }:

{

  imports = [ (./.. + "/themes" + ( "/" + userSettings.waybarStyle) + "/waybar.nix") ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        include = "${userSettings.flakeDir}/user/desktop/hyprland/waybar/modules";
        layer = "top";
        position = "top";
        spacing = 0;
	reload_style_on_change = true;

      };

    };

  };

}
