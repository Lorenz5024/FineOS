{ config, userSettings, ... }:

let 
  themePath = "${userSettings.flakeDir}/user/themes/current/waybar";
in
{

  xdg.configFile."waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${themePath}/style.css";
  xdg.configFile."waybar/layout.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${themePath}/layout.jsonc";

  # imports = [ (./. + "/themes" + ( "/" + userSettings.waybarStyle) + ".nix") ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        include = "${userSettings.flakeDir}/user/app/waybar/modules.jsonc";
        # layer = "top";
        # position = "top";
        # spacing = 0;
	# reload_style_on_change = true;

      };

    };

  };

}
