{ pkgs, userSettings, ... }:

{
  # Login manager 
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${userSettings.username}";
      };
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${userSettings.username}";
      };
    };
  };
}
