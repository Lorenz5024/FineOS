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
      };
    };
  };
}
