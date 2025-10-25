{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."fineos-laptop.tailf073f1.ts.net" = {
      enableSSL = true;
      sslCertificate = "/etc/ssl/certs/fineos-laptop.tailf073f1.ts.net.crt";
      sslCertificateKey = "/etc/ssl/certs/fineos-laptop.tailf073f1.ts.net.key";
      extraConfig = ''
        add_header Cross-Origin-Opener-Policy require-corp;
        add_header Cross-Origin-Embedder-Policy same-origin;
        add_header Access-Control-Allow-Origin "https://fineos-laptop.tailf073f1.ts.net" always;
        add_header Access-Control-Allow-Methods "GET, POST, OPTIONS" always;
        add_header Access-Control-Allow-Headers "Content-Type, Authorization" always;
        add_header Access-Control-Allow-Credentials true always;
      '';
      locations."/" = {
        proxyPass = "http://localhost:3000";
      };
    };
  };
}

