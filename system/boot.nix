{ ... }:

{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;

    loader = {
      timeout = 20;
      efi.canTouchEfiVariables = true;

      systemd-boot = { 
        enable = true;
        configurationLimit = 16;
      };
      
      grub = {
        enable = false;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
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
