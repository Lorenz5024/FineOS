{ pkgs, userSettings, hostSettings, ... }:

let 
  desktop = hostSettings.desktop;
in
{
  # Login manager 
  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = 1;
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${if desktop == "hyprland" then "Hyprland" else if desktop == "kde" then "startplasma-wayland" else ""}";
        user = "${userSettings.username}";
      };
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${if desktop == "hyprland" then "Hyprland" else if desktop == "kde" then "startplasma-wayland" else ""}";
        user = "${userSettings.username}";
      };
    };
  };
}
