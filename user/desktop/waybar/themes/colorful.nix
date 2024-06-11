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

    @define-color background        ${color0};
    @define-color alternate         ${color2};
    @define-color border            ${color13};
    @define-color active-workspace  ${color9};
    @define-color hover-workspace   ${color2};
    @define-color idle-inhibitor    ${color14};
    @define-color volume            ${color11};
    @define-color backlight         ${color15};
    @define-color battery           ${color12};
    @define-color power             ${color8};
    @define-color clock             ${color6};
    @define-color text              ${color5};

    * {
	border: none;
	font-family: "JetBrainsMono Nerd Font";
	font-size: 14px;
	font-weight: bold;
	border-radius: 7px;
      } 

    window#waybar {
      background: @background;
      color: @text;
      border-radius: 0px;
      border-bottom: 2px solid @border;
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
      background: @alternate;
      color: @clock;
      padding-left: 8px;
      padding-right: 8px;
    }

    #laptop {
      background: @alternate;
    }

    #backlight {
      background: @alternate;
      color: @backlight;
      padding-left: 8px;
      padding-right: 8px;
    }

    #battery {
      background: @alternate;
      color: @battery;
      padding-left: 8px;
      padding-right: 8px;
    }

    #pulseaudio {
      background: @alternate;
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      background: @alternate;
      color: @volume;
    }

    #tray {
      padding-left: 8px;
      padding-right: 8px;
      padding-top: 4px;
      padding-bottom: 4px;
      background: @alternate;
    }

    #custom-power {
      background: transparent;
      padding-left: 4px;
      padding-right: 4px;
      color: @power;
    }

    #workspaces {
      font-size: 30px;
      background-color: @alternate;
    }

    #workspaces button {
      color: @active-workspace;
    }

    #workspaces button.empty {
      color: @text;
    }

    #workspaces button.active {
      color: @background;
      background: @active-workspace;
    } 

    #workspaces button:hover {
      background: @border;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.2s; 
    }

    #workspaces button.active:hover {
      border-radius: 30px;
      background: @active-workspace;
    }


    #idle_inhibitor {
      color: @idle-inhibitor;
      background-color: @alternate;
      font-size: 20px;
      padding-left: 8px;
      padding-right: 5px;
    }
  '';
}
