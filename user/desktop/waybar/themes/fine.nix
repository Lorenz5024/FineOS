{ config, systemSettings, ... }:

let
  module-border = ''
    border: 2px solid @module-border; 
    border-radius: 8px; 
    margin: 0.3em; 
    '';
  module-hover = ''
    border-radius: 8px;
    background: @hover;
    '';
  module-margin = ''
    margin: 0.3em;
    '';
  module-padding-lr = ''
    padding-left: 0.3em;
    padding-right: 0.3em;
    '';
in
{

  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, waybar"
    ];
  };

  programs.waybar.settings.mainBar = {
    modules-left = [
      "custom/icon"
      "hyprland/workspaces#icons"
      "hyprland/window"
    ];

    modules-right = [
      "group/hiddentray"
      "hyprland/language"
      "idle_inhibitor"
      "pulseaudio"
      "${if systemSettings.isLaptop then "group/laptop" else ""}"
      "clock"
    ];
  };

  programs.waybar.style = /*css*/ ''

    @define-color main                    #${config.lib.stylix.colors.base00};
    @define-color text                    #${config.lib.stylix.colors.base06};
    @define-color module-border           #${config.lib.stylix.colors.base04};
    @define-color workspaces-background   #${config.lib.stylix.colors.base02};
    @define-color workspaces-active       #${config.lib.stylix.colors.base0B};
    @define-color workspaces-empty        #${config.lib.stylix.colors.base04};
    @define-color workspaces-visible      #${config.lib.stylix.colors.base0D};
    @define-color window-text             #${config.lib.stylix.colors.base09};
    @define-color language                #${config.lib.stylix.colors.base0A};
    @define-color pulseaudio              #${config.lib.stylix.colors.base0B};
    @define-color clock                   #${config.lib.stylix.colors.base0F};
    @define-color idle_inhibitor          #${config.lib.stylix.colors.base0E};
    @define-color battery                 #${config.lib.stylix.colors.base0C};
    @define-color hover                   #${config.lib.stylix.colors.base03};
    @define-color trayindicator           #${config.lib.stylix.colors.base07};

    * {
	font-family: "JetBrainsMono Nerd Font";
	font-size: 14px;
	font-weight: bold;
      } 

    window#waybar {
      background: rgba(30, 30, 46, 0.7);
    }

    #custom-icon {
      font-size: 22px;
      color: #89b4fa;
      padding: 0.3em;
    }

    #custom-trayindicator {
      ${module-margin}
      color: @trayindicator;
      padding-left: 0.5em;
      padding-right: 0.5em;
    }

    #custom-trayindicator:hover {
      ${module-hover}
    }

    #group-hardware {
      ${module-border}
    }

    #temperature,
    #network,
    #cpu,
    #memory,
    #disk {
      padding-left: 4px;
      padding-right: 4px;
    }

    #clock {
      color: @clock;
      padding-left: 8px;
      padding-right: 8px;
      ${module-margin}
    }

    #clock:hover {
      ${module-margin}
      ${module-hover}
    }

    #backlight {
      ${module-margin}
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #battery {
      ${module-margin}
      color: @battery;
      padding-left: 8px;
      padding-right: 8px;
    }

    #pulseaudio {
      ${module-margin}
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      color: @pulseaudio;
    }

    #pulseaudio:hover {
      ${module-margin}
      ${module-hover}
    }

    #tray {
      background: @workspaces-background;
      ${module-border}
      padding-left: 8px;
      padding-right: 8px;
    }

    #custom-power {
      padding-left: 4px;
      padding-right: 4px;
      color: @text;
    }

    /* Hyprland */

    #workspaces {
      background: @workspaces-background;

      ${module-border};
    }

    #workspaces button {
      padding: 0em;
    }      

    #workspaces button.empty {
      color: @workspaces-empty;
    }

    #workspaces button.visible {
      color: @workspaces-visible;
    }

    #workspaces button.active {
      color: @workspaces-active;
    } 

    #window {
      color: @window-text;
      padding-left: 1em;
      padding-right: 1em;
    }

    #language {
      ${module-margin}
      color: @language;
      padding: 0em 0.5em 0em 0.5em;
    }

    #idle_inhibitor {
      ${module-margin}
      color: @idle_inhibitor;
      padding-left: 8px;
      padding-right: 8px;
    }

    #idle_inhibitor:hover {
      ${module-margin}
      ${module-hover}
    }
  '';
}
