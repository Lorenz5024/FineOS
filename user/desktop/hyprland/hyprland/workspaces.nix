{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      # extra gaps on special workspaces
      "s[true], gapsout:128, animation:specialWorkspace"

      # no border when single window 
      "w[1]s[false], border:false"

      # no border, rounding and gaps when maximized
      "f[1]s[false], border:false, rounding:false, gapsout:0"

      # keep special workspaces alive always
      "music, persistent:true"
      "terminal, on-created-empty:kitty"
      "notes, persistent:true"
      "vault, persistent:true"
      "files, persistent:true"
    ];
  };
}
