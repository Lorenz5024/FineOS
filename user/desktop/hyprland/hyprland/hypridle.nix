{ ... }:

{
  services.hypridle = {
    enable = true;

    settings = {

      general = {
          lock_cmd = "pidof hyprlock || hyprlock";        # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "hyprlock";	          # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })' && brightnessctl -r";   # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 300;                                                                                # 5 min
          on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";                      # screen off when timeout has passed
          on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })' && brightnessctl -r";    # screen on when activity is detected after timeout has fired.
        }
        # {
        #   timeout = 600;
        #   on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
        # }
        # {
        #   timeout = 1800;                                # 30min
        #   on-timeout = "systemctl suspend";                # suspend pc
        # }
      ];
    };
  };
}
