{ config, ... }:

{
  programs.zathura = {
    enable = true;

    extraConfig = ''
      set font "JetBrainsMono Nerd Font 13"

      set statusbar-fg "#${config.lib.stylix.colors.base05}"
      set statusbar-bg "#${config.lib.stylix.colors.base06}"
    '';
  };
}
