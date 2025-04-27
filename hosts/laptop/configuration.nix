{ hostSettings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./../personal/common-configuration.nix

      ./../../system/desktop/${hostSettings.desktop}/desktop.nix

      ./../../system/services/jellyfin/jellyfin.nix
      ./../../system/services/ssh/ssh.nix
      ./../../system/services/docker/docker.nix
      ./../../system/services/actual-server/actual-server.nix
    ];

  networking.hostName = "fineos-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Additional kernel parameter required for brightness keys to work on framework laptop
  boot.kernelParams = [ "module_blacklist=hid_sensor_hub" ];

  # Disable short press of power button (does not work)
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  # Keep laptop awake when lid is closed and power is connected
  # Used for server functionality
  services.logind.lidSwitchExternalPower = "ignore";
}
