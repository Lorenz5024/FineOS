{ ... }:

{
  imports = [
    ./themes/theme-main.nix
    ./themes/theme-wallpaperpicker.nix

    ./scripts/rofi-beats.nix
    ./scripts/rofi-wallpaper.nix
  ];

  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
  };
}
