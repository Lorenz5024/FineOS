{ pkgs, ... }:

{ 
  environment.systemPackages = [ pkgs.actual-server ];

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 5006; to = 5006; }
    ];
    allowedUDPPortRanges = [
      { from = 5006; to = 5006; }
    ];
  };

}
