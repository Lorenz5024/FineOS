{ ... }:

{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;

    # loader = {
    #   systemd-boot = { 
    #     enable = true;
    #     configurationLimit = 16;
    #   };
    #   efi.canTouchEfiVariables = true;
    # };

    loader = {
      timeout = 20;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
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

    plymouth.enable = true;   
  };
}
