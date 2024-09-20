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

      "files.autoSave" = "on";
      
    };

    extensions = with pkgs.vscode-extensions; [
      redhat.java
      vscodevim.vim
      arrterian.nix-env-selector
      rust-lang.rust-analyzer
      bbenoist.nix
      cweijan.vscode-database-client2

      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
