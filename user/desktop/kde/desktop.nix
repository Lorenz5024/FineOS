{ ... }:

{
  programs.plasma = {
    enable = true;

    hotkeys.commands = {
      "launch-kitty" = {
        name = "Launch Kitty";
        key = "Meta+Return";
        command = "kitty";
      };
    };

    shortcuts.kwin = {
      "Expose" = "Meta+,";

      "Switch Window Down" = "Meta+J";
      "Switch Window Left" = "Meta+H";
      "Switch Window Right" = "Meta+L";
      "Switch Window Up" = "Meta+K";

      "Switch to Desktop 1" = "Meta+1";
      "Switch to Desktop 2" = "Meta+2";
      "Switch to Desktop 3" = "Meta+3";
      "Switch to Desktop 4" = "Meta+4";
      "Switch to Desktop 5" = "Meta+5";

      "Kill Window" = "Meta+Q";
    };

    panels = [
      {
        location = "bottom";
        widgets = [
          {
            pager = {};
          }
          {
            panelSpacer = {
              expanding = true;
            };
          }
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          {
            iconTasks = {
              launchers = [
                "applications:vivaldi-stable.desktop"
              ];
            };
          }
          {
            panelSpacer = {
              expanding = true;
            };
          }
          {
            systemTray = { };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
        ];
      }

    ];

  };
}
