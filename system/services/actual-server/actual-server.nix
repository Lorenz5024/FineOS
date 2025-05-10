{ 
  services.actual = {
    enable =  true;
    settings = { 
      port = 5006;
    };
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 443 ];
}
