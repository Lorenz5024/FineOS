{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gnome.gnome-keyring ];

  services.gnome.gnome-keyring.enable = true;
}
