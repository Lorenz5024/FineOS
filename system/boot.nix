{ ... }:

{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;

    loader = {
      timeout = 10;
      efi.canTouchEfiVariables = true;

      # systemd-boot = { 
      #   enable = true;
      #   configurationLimit = 16;
      # };
      
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        extraConfig = ''
            GRUB_DEFAULT=saved
            GRUB_SAVEDEFAULT=true
          '';
      };

    };


    kernelParams = [ 
      "quiet" 
      "splash"
      "rd.systemd.show_status=false" 
      "udev.log_level=3"
    ];	

    # plymouth.enable = true;   
  };
}
