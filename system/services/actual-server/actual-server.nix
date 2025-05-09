{ pkgs, ... }:

{ 
  services.actual = {
    enable =  true;
    settings = { 
      port = 5006;
      https.key = "~/.certificates/fineos-laptop.tailf073f1.ts.net.key";
      https.cert = "~/.certificates/fineos-laptop.tailf073f1.ts.net.crt";
    };
    openFirewall = true;
  };
}
