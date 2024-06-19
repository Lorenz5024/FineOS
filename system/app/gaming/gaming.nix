{ pkgs, userSettings, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    protonup
    mangohud
    heroic
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/${userSettings.username}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;
}

