{ ags, pkgs, ... }:

{
  imports = [ ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ./config;
    
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
