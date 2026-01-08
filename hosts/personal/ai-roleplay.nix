{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    koboldcpp
    sillytavern
  ];

  services.sillytavern = {
    listen = true;
  };

  networking.firewall.allowedUDPPorts = [ 8000 ];
  networking.firewall.allowedTCPPorts = [ 8000 ];
}
