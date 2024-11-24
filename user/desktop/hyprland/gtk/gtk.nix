{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme.name = "Tela";
    iconTheme.package = pkgs.tela-icon-theme;
  };

}
