{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = "false";

      preload = [ "~/.dotfiles/themes/wallpaper" ];

      wallpaper = [ " , ~/.dotfiles/themes/wallpaper" ];
    };
  };
}

