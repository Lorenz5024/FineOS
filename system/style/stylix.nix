{ pkgs, userSettings, ... }:

let 
  themePath = "./../../themes/"+userSettings.theme+".yaml";
in
{
  stylix = {
    autoEnable = true;
    image = ./../../themes/wallpaper;
    base16Scheme = ./. + themePath;
    polarity = userSettings.themePolarity;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };
  };
}
