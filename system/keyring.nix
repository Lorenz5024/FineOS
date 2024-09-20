{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gnome-keyring ];

  services.gnome.gnome-keyring.enable = true;
}
