{ ... }:

{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      copy_on_select = true;
      show_startup_tips = false;

      ui.pane_frames.rounded_corners = true;
    };
  };
}
