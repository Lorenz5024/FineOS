{ ... }:

{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      copy_on_select = true;

      ui.pane_frames.rounded_corners = true;
    };
  };
}
