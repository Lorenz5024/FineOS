# Reuqirements:
# nginx configuration

{ pkgs, userSettings, ... }:

{
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/var/lib/nix-serve/cache-priv-key.pem";
  };

  networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.settings.trusted-users = [ "root" ];


  # Keep flake up to date
  systemd.services.update-flake = {
    description = "Update flake and push to repository";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "lorenz";
      ExecStart = "${pkgs.writeShellScript "update-flake.sh" ''
        set -xeuf -o pipefail
        PATH="$PATH:${pkgs.git}/bin:${pkgs.nix}/bin:${pkgs.openssh}/bin"
        export PATH

        cd ${userSettings.flakeDir}

        git pull
        nix flake update
        git add -A
        git commit -m "Auto update from homelab"
        git push
      ''}";
    };
  };

  # Keep store up to date
  systemd.services.update-store = {
    description = "Prefetch all store paths for FineOS Personal";
    wantedBy = [ "multi-user.target" ];
    requires = [ "update-flake.service" ];
    after = [ "update-flake.service" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "${pkgs.writeShellScript "update-flake.sh" ''
        set -xeuf -o pipefail
        PATH="$PATH:${pkgs.nix}/bin:"
        export PATH

        cd ${userSettings.flakeDir}

        nix build .\#nixosConfigurations.fineos.config.system.build.toplevel --out-link /var/lib/nix/prefetch-roots/fineos
      ''}";
    };
  };


  systemd.timers.update-flake = {
    description = "Run update-flake service nightly";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 03:00:00"; # Every day at 03:00
      Persistent = true;
    };
  };
}
