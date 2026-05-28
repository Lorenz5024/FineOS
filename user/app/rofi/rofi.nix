{ config, userSettings, ... }:

{
  imports = [
    ./themes/theme-wallpaperpicker.nix

    ./radio/fine-radio.nix
    ./hyprland_wallpaper/hyprland-wallpaper.nix
  ];

  # home.file = {
  #   ".config/rofi/config.rasi".source = ./config.rasi;
  # };

  xdg.configFile."rofi/config.rasi".source = config.lib.file.mkOutOfStoreSymlink "${userSettings.flakeDir}/user/app/rofi/config.rasi";
}
