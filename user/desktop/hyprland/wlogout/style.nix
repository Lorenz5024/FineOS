{ userSettings, ... }:

{
  programs.wlogout.style = ''
    * {
      background-image: none;
      transition: 20ms;
    }

    window {
      background-color: rgba(12, 12, 12, 0.1);
    }

    button {
      color: #FFFFFF;
      font-size: 20px;

      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;

      border-style: solid;
      background-color: rgba(12, 12, 12, 0.3);
      border: 3px solid #FFFFFF;

      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    button:focus,
    button:active,
    button:hover {
      color: @mauve;
            background-color: rgba(12, 12, 12, 0.5);
            border: 3px solid @mauve;
    }

    /* 
    ----------------------------------------------------- 
    Buttons
    ----------------------------------------------------- 
    */

    #lock {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/lock.png"));
    }

    #logout {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/logout.png"));
    }

    #suspend {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/suspend.png"));
    }

    #hibernate {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/hibernate.png"));
    }

    #shutdown {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/shutdown.png"));
    }

    #reboot {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("${userSettings.flakeDir}/user/desktop/wlogout/icons/reboot.png"));
    }


    /* Catppuccin colors */ 
    @define-color base   #1e1e2e;
    @define-color mantle #181825;
    @define-color crust  #11111b;

    @define-color text     #cdd6f4;
    @define-color subtext0 #a6adc8;
    @define-color subtext1 #bac2de;

    @define-color surface0 #313244;
    @define-color surface1 #45475a;
    @define-color surface2 #585b70;

    @define-color overlay0 #6c7086;
    @define-color overlay1 #7f849c;
    @define-color overlay2 #9399b2;

    @define-color blue      #89b4fa;
    @define-color lavender  #b4befe;
    @define-color sapphire  #74c7ec;
    @define-color sky       #89dceb;
    @define-color teal      #94e2d5;
    @define-color green     #a6e3a1;
    @define-color yellow    #f9e2af;
    @define-color peach     #fab387;
    @define-color maroon    #eba0ac;
    @define-color red       #f38ba8;
    @define-color mauve     #cba6f7;
    @define-color pink      #f5c2e7;
    @define-color flamingo  #f2cdcd;
    @define-color rosewater #f5e0dc;

  '';
}
