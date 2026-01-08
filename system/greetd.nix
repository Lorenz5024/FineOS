{ pkgs, userSettings, hostSettings, ... }:

let 
  desktop = builtins.head hostSettings.desktops;
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
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${if desktop == "hyprland" then "Hyprland" else if desktop == "kde" then "startplasma-wayland" else if desktop == "cosmic" then "cosmic-session" else ""}";
      };
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${if desktop == "hyprland" then "Hyprland" else if desktop == "kde" then "startplasma-wayland" else if desktop == "cosmic" then "cosmic-session" else ""}";
        user = "${userSettings.username}";
      };
    };
  };
}
