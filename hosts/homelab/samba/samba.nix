{ userSettings, ... }:

{
  services.samba = {
    enable = true;

    securityType = "user";

    shares = {
      Shows = { 
        path = "/mnt/storage0/Jellyfin/Shows";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };
    };
  };

  systemd.tmpfiles.rules = [
    "d /mnt/storage0 0775 lorenz users -"
    "d /mnt/storage1 0775 lorenz users -"
  ];

  networking.firewall.allowedTCPPorts = [ 139 445];
  networking.firewall.allowedUDPPorts = [ 137 138];
}
