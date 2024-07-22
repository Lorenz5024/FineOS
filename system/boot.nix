{ ... }:

{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;

    loader = {
      systemd-boot = { 
        enable = true;
        configurationLimit = 8;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [ 
      "quiet" 
      "splash"
      "rd.systemd.show_status=false" 
      "udev.log_level=3"
    ];	

    plymouth.enable = true;   
  };
}
