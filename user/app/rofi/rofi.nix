{ ... }:

{
  imports = [
    ./themes/theme-main.nix
    ./themes/theme-wallpaperpicker.nix

    ./scripts/fine-radio.nix
    ./scripts/fine-wallpaper.nix
  ];

  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
  };
}
