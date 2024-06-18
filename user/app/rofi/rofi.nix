{ ... }:

{
  imports = [
    ./themes/theme-main.nix
  ];

  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
  };
}
