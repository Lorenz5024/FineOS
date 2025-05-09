{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."localhost" = {
      enableSSL = true;
      sslCertificate = "/home/lorenz/.certificates/fineos-laptop.tailf073f1.ts.net.crt";
      sslCertificateKey = "/home/lorenz/.certificates/fineos-laptop.tailf073f1.ts.net.key";
      locations."/" = {
      proxyPass = "http://localhost:5006";
      extraConfig = ''
        add_header Cross-Origin-Opener-Policy same-origin;
        add_header Cross-Origin-Embedder-Policy require-corp;
      '';
    };
    };
  };
}

