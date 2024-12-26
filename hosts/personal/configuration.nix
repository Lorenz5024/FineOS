{ pkgs, config, hostSettings, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./common-configuration.nix

    ./../../system/desktop/${hostSettings.desktop}/desktop.nix

    ./../../system/app/gaming/gaming.nix

    ./../../system/development/docker.nix
    ./../../system/development/postgresql.nix
    ./../../system/development/java.nix
  ];

  networking.hostName = "fineos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # enable proprietary nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };


  # add kernel param for nvidia 
  boot.kernelParams = [ 
    "nvidia_drm.modeset=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  boot.loader = {
    timeout = 20;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # system specific packages
  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    egl-wayland
    jetbrains-toolbox
  ];
}
