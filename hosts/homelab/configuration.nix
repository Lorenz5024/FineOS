{ hostSettings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./../minimal-config.nix

      ./jellyfin/jellyfin.nix
      ./nginx/nginx.nix
      ./tailscale/tailscale.nix

      ./../../system/services/ssh/ssh.nix
      ./../../system/services/docker/docker.nix
    ];

  networking.hostName = hostSettings.host; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  system.stateVersion = "23.11"; # Did you read the comment?
}
