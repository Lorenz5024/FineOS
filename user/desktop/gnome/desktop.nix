{ pkgs, lib, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            gsconnect.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        scaling-factor = lib.hm.gvariant.mkUint32 2;
      };
    };
  };
}
