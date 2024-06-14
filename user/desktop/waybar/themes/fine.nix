{ config, ... }:

let
  color0 = "#${config.lib.stylix.colors.base00}";
  color1 = "#${config.lib.stylix.colors.base01}";
  color2 = "#${config.lib.stylix.colors.base02}";
  color3 = "#${config.lib.stylix.colors.base03}";
  color4 = "#${config.lib.stylix.colors.base04}";
  color5 = "#${config.lib.stylix.colors.base05}";
  color6 = "#${config.lib.stylix.colors.base06}";
  color7 = "#${config.lib.stylix.colors.base07}";
  color8 = "#${config.lib.stylix.colors.base08}";
  color9 = "#${config.lib.stylix.colors.base09}";
  color10 = "#${config.lib.stylix.colors.base0A}";
  color11 = "#${config.lib.stylix.colors.base0B}";
  color12 = "#${config.lib.stylix.colors.base0C}";
  color13 = "#${config.lib.stylix.colors.base0D}";
  color14 = "#${config.lib.stylix.colors.base0E}";
  color15 = "#${config.lib.stylix.colors.base0F}";
in
{

  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, waybar"
    ];
  };

  programs.waybar.settings.mainBar = {
    modules-left = [
      "clock"
      "tray"
    ];

    modules-center = [
      "hyprland/workspaces#numbers"
    ];

    modules-right = [
      "group/system"
      "idle_inhibitor"
      "pulseaudio"
      "group/laptop"
      "custom/power"
    ];
  };

  programs.waybar.style = ''

    @define-color main              ${color13};
    @define-color text              ${color6};

    @define-color alternate         ${color2};
    @define-color border            ${color13};
    @define-color workspaces        ${color9};
    @define-color idle-inhibitor    ${color14};
    @define-color volume            ${color11};
    @define-color backlight         ${color15};
    @define-color battery           ${color12};
    @define-color power             ${color8};
    @define-color background        #${config.lib.stylix.colors.base00};

    * {
	font-family: "JetBrainsMono Nerd Font";
	font-size: 14px;
	font-weight: bold;
        color: @text;
      } 

    window#waybar {
      background: @background;
    }

    .modules-left, .modules-center, .modules-right {
      color: @text;
      padding: 6px 6px 8px 6px;
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
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
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
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      color: @text;
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

    #workspaces {
      color: @workspaces;
      font-size: 30px;
    }


    #workspaces button.empty {
      color: @text;
    }

    #workspaces button.active {
      color: @background;
      background: @workspaces
    } 

    #workspaces button:hover {
      background: @border;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.2s; 
    }

    #workspaces button.active:hover {
    }

    #idle_inhibitor {
      background: @background;
      color: @text;
      font-size: 20px;
      padding-left: 8px;
      padding-right: 5px;
    }
  '';
}
