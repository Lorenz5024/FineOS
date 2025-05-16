{ userSettings, ... }:

{
  services.samba = {
    enable = true;

    securityType = "user";

    shares = {
      storage0 = { 
        path = "/mnt/storage0";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };
      storage1 = { 
        path = "/mnt/storage0";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 139 445];
  networking.firewall.allowedUDPPorts = [ 137 138];
}
