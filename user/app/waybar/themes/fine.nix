{  config, hostSettings, ... }:

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
    color: @main;
    '';
  module-margin = ''
    margin: 0.3em;
    '';
  module-padding-lr = ''
    padding-left: 1em;
    padding-right: 1em;
    '';

  color0 = "rgb(${config.lib.stylix.colors.base00})";
  color1 = "rgb(${config.lib.stylix.colors.base01})";
  color2 = "rgb(${config.lib.stylix.colors.base02})";
  color3 = "rgb(${config.lib.stylix.colors.base03})";
  color4 = "rgb(${config.lib.stylix.colors.base04})";
  color5 = "rgb(${config.lib.stylix.colors.base05})";
  color6 = "rgb(${config.lib.stylix.colors.base06})";
  color7 = "rgb(${config.lib.stylix.colors.base07})";
  color8 = "rgb(${config.lib.stylix.colors.base08})";
  color9 = "rgb(${config.lib.stylix.colors.base09})";
  color10 = "rgb(${config.lib.stylix.colors.base0A})";
  color11 = "rgb(${config.lib.stylix.colors.base0B})";
  color12 = "rgb(${config.lib.stylix.colors.base0C})";
  color13 = "rgb(${config.lib.stylix.colors.base0D})";
  color14 = "rgb(${config.lib.stylix.colors.base0E})";
  color15 = "rgb(${config.lib.stylix.colors.base0F})";
in
{

  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur on, match:namespace waybar"
    ];
  };

  programs.waybar.settings.mainBar = {
    modules-left = [
      # "custom/icon"
      "hyprland/workspaces#numbers"
      # "hyprland/window"
      "custom/fine_radio"
      "mpris"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      # "group/hiddennetwork"
      # "temperature"
      # "cpu"
      # "memory"
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
    @define-color workspaces-active       #FF0000;
    @define-color workspaces-empty        #${color5};
    @define-color workspaces-visible      #0000FF;
    @define-color window-text             #FFFFFF;
    @define-color language                #FFFFFF;
    @define-color pulseaudio              #FFFFFF;
    @define-color clock                   #FFFFFF;
    @define-color idle_inhibitor          #FFFFFF;
    @define-color battery                 #FFFFFF;
    @define-color hover                   #FFFFFF;
    @define-color groupindicator          #FFFFFF;

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

    #custom-groupindicator {
      ${module-margin}
      color: @groupindicator;
      padding-left: 0.5em;
      padding-right: 0.5em;
    }

    #custom-groupindicator:hover {
      ${module-hover}
    }

    #custom-fine_radio {
      ${module-margin}
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

    #cpu {
      min-width: 50px;
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

    #mpris {
      ${module-margin}
    }
  '';
}
