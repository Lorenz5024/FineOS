{  pkgs, ... }:

{
  stylix = {
    targets = {
      waybar.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
      zathura.enable = false;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };
  };
}
