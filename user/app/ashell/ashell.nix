{ config, pkgs, userSettings, ... }:

let 
  configPath = "${userSettings.flakeDir}/user/app/ashell";
in
{
  home.packages = [ pkgs.ashell ];

  xdg.configFile."ashell/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config.toml";
}
