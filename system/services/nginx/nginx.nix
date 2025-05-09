{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."actual.fineos-laptop.tailf073f1.ts.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:5006";
        extraConfig = ''
          proxy_set_header Host $host;
          add_header Cross-Origin-Opener-Policy same-origin;
          add_header Cross-Origin-Embedder-Policy require-corp;
        '';
      };
    };
  };

  # Automatically get Let's Encrypt certificate
  security.acme = {
    acceptTerms = true;
    email = "lorenzfeiner@proton.me";
  };
}

