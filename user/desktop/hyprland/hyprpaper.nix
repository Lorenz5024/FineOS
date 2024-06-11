{ userSettings, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = "false";

      preload = [ "${userSettings.flakeDir}/themes/wallpaper" ];

      wallpaper = [ " , ${userSettings.flakeDir}/themes/wallpaper" ];
    };
  };
}

