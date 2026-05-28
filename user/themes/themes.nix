{ userSettings, config, ... }:

let 
  configPath = "${userSettings.flakeDir}/user/themes/current";
in
{
  xdg.configFile."rofi/themes/theme-launcher.rasi".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/rofi/theme-launcher.rasi";
  xdg.configFile."hypr/theme.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/hyprland/theme.lua";
}
