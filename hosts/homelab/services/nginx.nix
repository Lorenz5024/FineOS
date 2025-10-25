{ config, ... }:

{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."homelab.tailf073f1.ts.net".useACMEHost = "homelab.tailf073f1.ts.net";
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = config.age.secrets.email.path;
  };
}

