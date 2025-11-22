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

      # "switch-desktop-1" = {
      #   name = "Switch to desktop 1";
      #   key = "Meta+1";
      #   command = "qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop 1";
      # };
    };

    shortcuts = {
      kwin = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
      };
    };
  };
}
