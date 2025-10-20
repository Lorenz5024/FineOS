{ ...  }:

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 41641 ];
    trustedInterfaces = [ "tailscale0" ]; # trust traffic from Tailscale

  };
}
