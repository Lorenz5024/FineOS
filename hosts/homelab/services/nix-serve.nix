# Reuqirements:
# nginx configuration

{ ... }:

{
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/var/lib/nix-serve/cache-priv-key.pem";
  };

  networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.settings.trusted-users = [ "root" ];

}
