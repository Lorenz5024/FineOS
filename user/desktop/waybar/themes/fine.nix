{ config, systemSettings, ... }:

let
  module-border = ''
    border: 2px solid @module-border; 
    border-radius: 8px; 
    margin: 0.3em; '';
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

    modules-center = [
      "mpris"
    ];

    modules-right = [
      "tray"
      "idle_inhibitor"
      "${if systemSettings.isLaptop then "group/laptop" else ""}"
      "pulseaudio"
      "hyprland/language"
      "clock"
    ];
  };

  programs.waybar.style = ''

    @define-color main                    #${config.lib.stylix.colors.base00};
    @define-color text                    #${config.lib.stylix.colors.base06};
    @define-color module-border           #${config.lib.stylix.colors.base04};
    @define-color workspaces-background   #${config.lib.stylix.colors.base02};
    @define-color workspaces-active       #${config.lib.stylix.colors.base0B};
    @define-color workspaces-empty        #${config.lib.stylix.colors.base04};
    @define-color workspaces-visible      #${config.lib.stylix.colors.base0D};
    @define-color window-text             #${config.lib.stylix.colors.base09};
    @define-color language                #${config.lib.stylix.colors.base0A};
    @define-color volume                  #${config.lib.stylix.colors.base0B};
    @define-color clock                   #${config.lib.stylix.colors.base0E};



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

      ${module-border}
    }

    #backlight {
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #battery {
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #pulseaudio {
      ${module-border}

      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      color: @volume;
    }

    #tray {
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
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
      color: @language;
      ${module-border};

      padding: 0em 0.5em 0em 0.5em;
    }

    #idle_inhibitor {
      ${module-border}
      color: @text;
      font-size: 20px;
      padding-left: 8px;
      padding-right: 5px;
    }

    #laptop {
      ${module-border}
    }
  '';
}
