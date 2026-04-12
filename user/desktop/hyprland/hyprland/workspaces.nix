{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      # extra gaps on special workspaces
      "s[true], gapsout:128, animation:specialWorkspace"

      # no border when single window 
      "w[1]s[false], border:false"
    ];
  };
}
