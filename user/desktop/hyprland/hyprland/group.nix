{ config, ... }:
    #@define-color workspaces-active       #${config.lib.stylix.colors.base0E};

{
  wayland.windowManager.hyprland.settings.group = {
    groupbar = {
      enabled = true;
      font_size = 16;

      "col.active" = "0xff${config.lib.stylix.colors.base0D}";
      "col.inactive" = "0xff${config.lib.stylix.colors.base02}";
      "text_color" = "0xff${config.lib.stylix.colors.base05}";
    };

    "col.border_active" = "0xff${config.lib.stylix.colors.base0D}";
  };
}
