{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    koboldcpp
  ];

  services.sillytavern = {
    enable = true;
    listen = true;
  };

  networking.firewall.allowedUDPPorts = [ 8000 ];
  networking.firewall.allowedTCPPorts = [ 8000 ];
}
