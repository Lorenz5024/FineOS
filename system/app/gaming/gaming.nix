{ pkgs, userSettings, ... }:

{
  hardware.graphics = {
    enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    protonup-ng
    mangohud
    heroic
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/${userSettings.username}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;
}

