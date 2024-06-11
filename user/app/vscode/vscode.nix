{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    userSettings = {
      "haskell.manageHLS" = "GHCup";
      #"workbench.colorTheme" = "Catppuccin Mocha";
      #"workbench.iconTheme" = "catppuccin-mocha";
      "redhat.telemetry.enabled" = false;
      "java.home" = "/run/current-system/sw/lib/openjdk";
      
    };

    extensions = with pkgs.vscode-extensions; [
      redhat.java
      vscodevim.vim
      arrterian.nix-env-selector

      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
