{ ...  }:

{
  services.tailscale.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ]; # trust traffic from Tailscale
  };
}
