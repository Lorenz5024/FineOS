{ ... }:

{
  imports = [
    ./themes/theme-main.nix
    ./themes/theme-wallpaperpicker.nix
  ];

  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
  };
}
