{ userSettings, config, ... }:

let 
  configPath = "${userSettings.flakeDir}/user/themes/current";
in
{
  xdg.configFile."rofi/themes/theme-launcher.rasi".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/rofi/theme-launcher.rasi";
  xdg.configFile."hypr/theme.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/hyprland/theme.lua";
  xdg.configFile."waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/style.css";
  xdg.configFile."waybar/layout.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/layout.jsonc";
  xdg.configFile."waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/config.jsonc";
  xdg.configFile."waybar/modules.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/modules.jsonc";
}
