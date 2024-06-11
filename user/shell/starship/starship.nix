{ pkgs, ... }:

{

  imports = [  ]; # import presets from the presets directory

  home.packages = [
    pkgs.starship
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

  };
}
