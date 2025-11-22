{ hostSettings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./../personal/common-configuration.nix

      ./../../system/desktop/hyprland/desktop.nix
      ./../../system/desktop/kde/desktop.nix

      ./../../system/services/ssh/ssh.nix
      ./../../system/services/tailscale.nix
    ];

  networking.hostName = "fineos-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Additional kernel parameter required for brightness keys to work on framework laptop
  boot.kernelParams = [ "module_blacklist=hid_sensor_hub" ];

  # Disable short press of power button (does not work)
  services.logind.settings.Login.HandlePowerKey = "ignore";

  # Keep laptop awake when lid is closed and power is connected
  # Used for server functionality
  services.logind.settings.Login.HandlelidSwitchExternalPower = "ignore";
}
