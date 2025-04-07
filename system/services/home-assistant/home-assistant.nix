{ ... }:

{
  # open port for home-assistant
  networking.firewall.allowedTCPPorts = [ 8123 ];

  virtualisation.oci-containers = {
    backend = "docker";
    containers.homeassistant = {
      volumes = [ "home-assistant:/config"];
      environment.TZ = "Europe/Vienna";
      image = "ghcr.io/home-assistant/home-assistant:stable";
      extraOptions = [
        "--network-host"
      ];
    };
  };
}
