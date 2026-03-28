{ pkgs, config, ... }:

{
  gtk = {
    enable = true;

    gtk4.theme = config.gtk.theme;

    iconTheme.name = "Tela";
    iconTheme.package = pkgs.tela-icon-theme;
  };

}
