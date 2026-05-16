{ ... }:

{

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts = {
      # "${host}" = {
      #   # root = "/var/lib/nextcloud";
      #   enableACME = false;
      #
      #   forceSSL = true;
      #   sslCertificate = certPath;
      #   sslCertificateKey = keyPath;
      #
      #   locations."/" = {
      #     proxyPass = "http://127.0.0.1:8080"; # Nextcloud internal server
      #     proxyWebsockets = true;
      #   };
      # };

      "nix-cache.lan" = {
        locations."/" = {
          proxyPass = "http://127.0.0.1:5000";
        };
      };
    };
  };

}

