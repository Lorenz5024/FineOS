{ config, pkgs, lib, ... }:

let 
  host = "homelab.tailf073f1.ts.net";
  certPath = "/var/lib/tailscale/${host}.crt";
  keyPath = "/var/lib/tailscale/${host}.key";
in
{

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts = {
      "${host}" = {
        enable = true;
        # root = "/var/lib/nextcloud";
        enableACME = false;

        forceSSL = true;
        sslCertificate = certPath;
        sslCertificateKey = keyPath;

        locations."/" = {
          proxyPass = "http://127.0.0.1:8080"; # Nextcloud internal server
          proxyWebsockets = true;
          proxyHeaders = {
            "Host" = "$host";
            "X-Forwarded-For" = "$remote_addr";
            "X-Forwarded-Proto" = "https";
          };
        };
      };

      "nix-cache.lan" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:5000";
        };
      };
    };
  };

}

