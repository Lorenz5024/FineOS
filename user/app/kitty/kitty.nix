{  ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      # background_opacity = "0.85";
      cursor_trail = 1;
      cursor_trail_start_threshold = 1;
      window_padding_width = 4;
    };

    shellIntegration.enableZshIntegration = true;
  };

}
