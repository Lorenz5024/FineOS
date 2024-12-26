{ pkgs, lib, hostSettings, userSettings, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix

      ./../personal/common-configuration.nix

      ./../../system/desktop/gnome/desktop.nix
    ];

  networking.hostName = "fineos-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Additional kernel parameter required for brightness keys to work on framework laptop
  boot.kernelParams = [ "module_blacklist=hid_sensor_hub" ];

  # Disable short press of power button (does not work)
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';
}
