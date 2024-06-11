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

    * {
	border-radius: 100%;
	font-family: "JetBrainsMono Nerd Font";
	font-size: 14px;
	font-weight: bold;
	border-radius: 7px;
        color: @text;
      } 

    window#waybar {
      background: transparent;
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
      background: @main;
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #backlight {
      background: @main;
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #battery {
      background: @main;
      color: @text;
      padding-left: 8px;
      padding-right: 8px;
    }

    #pulseaudio {
      background: @main;
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      color: @text;
    }

    #tray {
      background: @main;
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
    }

    #custom-power {
      background: @main;
      padding-left: 4px;
      padding-right: 4px;
      color: @text;
    }

    #workspaces {
      background: @main;
      padding-left: 8px;
      padding-right: 8px;
    }

    #workspaces button {
      color: @text;
      background: @alternate;
      padding-left: 4px;
      padding-right: 4px;
      padding-top: 0px;
      padding-bottom: 0px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.2s; 
    }

    #workspaces button:hover {
      border-radius: 30px;
      background: @red;
    }

    #workspaces button.persistent {
      border-radius: 30px;
    }

    #workspaces button.active {
      color: @workspaces;
      border-radius: 100%;
    } 

    #idle_inhibitor {
      background: @main;
      color: @text;
      font-size: 20px;
      padding-left: 8px;
      padding-right: 5px;
    }
  '';
}
