{ ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"        
    "swaync"        
    "hyprpaper"
    "thunar --daemon"
    "nm-applet"
    "blueman-applet"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];
}
