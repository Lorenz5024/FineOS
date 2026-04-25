{ ... }:

{
  imports = [ ./style.nix ];

  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
        text = "Shutdown (s)";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
        text = "Reboot (r)";
        keybind = "r";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate (h)";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout (e)";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend (u)";
        keybind = "u";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock (l)";
        keybind = "l";
      }
    ];

  };
}
