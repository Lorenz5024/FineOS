{  hostSettings, ... }:

let
  module-border-radius = "8px";
  module-border = ''
    border: 2px solid @module-border; 
    border-radius: ${module-border-radius}; 
    ${module-margin}; 
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
      "hyprland/workspaces#numbers"
      "hyprland/window"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "network#speed"
      "tray"
      "hyprland/language"
      "idle_inhibitor"
      "pulseaudio"
      "${if hostSettings.isLaptop then "battery" else ""}"
    ];
  };

  programs.waybar.style = /*css*/ ''

    @define-color main                    #000000;
    @define-color text                    #FFFFFF;
    @define-color module-border           #FFFFFF;
    @define-color workspaces-background   #FFFFFF;
    @define-color workspaces-active       #FFFFFF;
    @define-color workspaces-empty        #FFFFFF;
    @define-color workspaces-visible      #FFFFFF;
    @define-color window-text             #FFFFFF;
    @define-color language                #FFFFFF;
    @define-color pulseaudio              #FFFFFF;
    @define-color clock                   #FFFFFF;
    @define-color idle_inhibitor          #FFFFFF;
    @define-color battery                 #FFFFFF;
    @define-color hover                   #FFFFFF;
    @define-color trayindicator           #FFFFFF;

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
      border-radius: ${module-border-radius}; 
      padding-left: 8px;
      padding-right: 8px;
      ${module-margin}
    }

    #custom-power {
      padding-left: 4px;
      padding-right: 4px;
      color: @text;
    }

    /* Hyprland */

    /*
    #workspaces {
      background: @workspaces-background;

      ${module-border};
    }
    */

    #workspaces button {
      padding-left: 0.5em;
      padding-right: 0.5em;
      padding-top: 0px;
      padding-bottom: 0px;
      border-radius: 0px;
    }      

    #workspaces button.empty {
      color: @workspaces-empty;
    }

    #workspaces button.visible {
      color: @workspaces-visible;
    }

    #workspaces button.active {
      color: @workspaces-active;
      border-bottom: 2px solid @module-border;
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
