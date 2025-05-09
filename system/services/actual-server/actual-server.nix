{ pkgs, ... }:

{ 
  services.actual = {
    enable =  true;
    settings = { 
      port = 5006;
      # https.key = "/home/lorenz/.certificates/fineos-laptop.tailf073f1.ts.net.key";
      # https.cert = "/home/lorenz/.certificates/fineos-laptop.tailf073f1.ts.net.crt";
    };
    openFirewall = true;
  };
}
