{ pkgs, config, ...  }:

let 
  host = "homelab.tailf073f1.ts.net";
  certPath = "/var/lib/tailscale/${host}.crt";
  keyPath = "/var/lib/tailscale/${host}.key";
in
{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  # Ensure tailscale package exists in the closure
  environment.systemPackages = [ pkgs.tailscale ];

  # Ensure cert dir exists with safe perms
  systemd.tmpfiles.rules = [
    # create dir with root owner
    "d /var/lib/tailscale 0750 root root -"
  ];

   # One-shot service to fetch (or refresh) the Tailscale cert
  systemd.services."tailscale-cert-${host}" = {
    description = "Fetch/renew Tailscale certificate for ${host}";
    wants = [ "tailscaled.service" "network-online.target" ];
    after = [ "tailscaled.service" "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      # use the tailscale binary from pkgs
      ExecStart = "${pkgs.tailscale}/bin/tailscale cert --cert-file ${certPath} --key-file ${keyPath} ${host}";
      # make sure files are created with safe perms
      ExecStartPost = ''
        /bin/sh -c '${pkgs.coreutils}/bin/chown root:root ${certPath} ${keyPath} || true'
        /bin/sh -c '${pkgs.coreutils}/bin/chmod 0640 ${certPath} ${keyPath} || true'
      '';
      ExecStartPre = ''
        ${pkgs.coreutils}/bin/mkdir -p /var/lib/tailscale
        ${pkgs.coreutils}/bin/chown root:root /var/lib/tailscale
        ${pkgs.coreutils}/bin/chmod 0750 /var/lib/tailscale
      '';

    };

    # run at boot to ensure cert is present before nginx
    wantedBy = [ "multi-user.target" ];
  };

    # Timer to refresh daily (adjust frequency as you like)
  systemd.timers."tailscale-cert-${host}" = {
    description = "Daily renew Tailscale certificate for ${host}";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };


  # Reload nginx automatically after cert is fetched (so new cert takes effect)
  systemd.paths."tailscale-cert-${host}-watch" = {
    description = "Watch Tailscale cert file and reload nginx when updated";
    pathConfig = {
      PathExistsGlob = [ certPath ];
      Unit = "nginx.service";
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 80 443 ];
    trustedInterfaces = [ "tailscale0" ]; # trust traffic from Tailscale

  };
}
