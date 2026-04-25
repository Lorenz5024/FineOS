{ config, ... }:
    #@define-color workspaces-active       #${config.lib.stylix.colors.base0E};

{
  wayland.windowManager.hyprland.settings.group = {
    groupbar = {
      enabled = true;
      font_size = 16;
    };

    "col.border_active" = "0x66${config.lib.stylix.colors.base0D}";
  };
}
