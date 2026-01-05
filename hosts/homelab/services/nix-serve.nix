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

  # Keep store up to date
  systemd.services.prefetch-store = {
    description = "Prefetch all store paths for FineOS Personal";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "${userSettings.username}";
      ExecStart = "${pkgs.writeShellScript "prefetch-store.sh" ''
        set -xeuf -o pipefail
        PATH="$PATH:${pkgs.git}/bin:${pkgs.nix}/bin:${pkgs.openssh}/bin"
        export PATH

        cd ${userSettings.flakeDir}

        git pull
        nix flake update
        git add -A
        git commit -m "Auto update from homelab"
        git push

        nix build .\#nixosConfigurations.fineos.config.system.build.toplevel --out-link /var/lib/nix/prefetch-roots/fineos
      ''}";
    };
  };

  systemd.timers.prefetch-store = {
    description = "Run prefetch-store service nightly";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 03:00:00"; # Every day at 03:00
      Persistent = true;
    };
  };
}
