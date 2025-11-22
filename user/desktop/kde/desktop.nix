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
      #
      # "switch-desktop-1" = {
      #   name = "Switch to desktop 1";
      #   key = "Meta+1";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 1";
      # };
      #
      # "switch-desktop-2" = {
      #   name = "Switch to desktop 2";
      #   key = "Meta+2";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 2";
      # };
      #
      # "switch-desktop-3" = {
      #   name = "Switch to desktop 3";
      #   key = "Meta+3";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 3";
      # };
      #
      # "switch-desktop-4" = {
      #   name = "Switch to desktop 4";
      #   key = "Meta+4";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 4";
      # };
      #
      # "switch-desktop-5" = {
      #   name = "Switch to desktop 5";
      #   key = "Meta+5";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 5";
      # };

    };

    shortcuts.kwin = {
      "Expose" = "Meta+,";
      "Switch Window Down" = "Meta+J";
      "Switch Window Left" = "Meta+H";
      "Switch Window Right" = "Meta+L";
      "Switch Window Up" = "Meta+K";
      "Switch to Desktop 1" = "Meta+1";
      "Switch to Desktop 2" = "Meta+2";
    };

  };
}
