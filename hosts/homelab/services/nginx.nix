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
        forceSSL = true;
        sslCertificate = certPath;
        sslCertificateKey = keyPath;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = config.age.secrets.email.path;
  };
}

