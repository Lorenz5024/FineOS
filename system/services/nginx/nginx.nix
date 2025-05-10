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
        add_header Cross-Origin-Opener-Policy same-origin always;
        add_header Cross-Origin-Embedder-Policy require-corp always;
      '';
      locations."/" = {
        proxyPass = "http://localhost:5006";
      };
    };
  };
}

