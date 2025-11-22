{ ... }:

{
  programs.plasma = {
    enable = true;

    hotkeys.commands."launch-kitty" = {
      name = "Launch Kitty";
      key = "Meta+Return";
      command = "kitty";
    };
  };
}
