{ userSettings, ... }:

{

  imports = [ (./. + "/themes" + ( "/" + userSettings.waybarStyle) + ".nix") ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        include = "${userSettings.flakeDir}/user/desktop/waybar/modules";
        layer = "top";
        position = "top";
        spacing = 0;
	reload_style_on_change = true;

      };

    };

  };

}
