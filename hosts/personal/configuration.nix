{ pkgs, config, hostSettings, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./common-configuration.nix
    ./openvpn.nix

    ./../../system/boot.nix

    ./../../system/app/gaming/gaming.nix
    ./../../system/app/hledger/hledger.nix

    ./../../system/services/tailscale.nix

    ./../../system/development/rust.nix

  ] ++ map (e: ./. + "/../../system/desktop/${e}/desktop.nix") hostSettings.desktops;

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

  # enable flatpak
  services.flatpak.enable = true;
    systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  hardware.bluetooth.enable = true;

  # add kernel param for nvidia 
  boot.kernelParams = [ 
    "nvidia_drm.modeset=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  # system specific packages
  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    egl-wayland
  ];

  environment.sessionVariables = {
    WLR_RENDERER_ALLOW_HDR = "1";
  };
}
