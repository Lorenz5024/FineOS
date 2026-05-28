{ userSettings, config, ... }:

let 
  configPath = "${userSettings.flakeDir}/user/themes/current";
in
{
  xdg.configFile."rofi/themes/theme-launcher.rasi".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/rofi/theme-launcher.rasi";
}
