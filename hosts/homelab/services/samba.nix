{ userSettings, ... }:

{
  services.samba = {
    enable = true;

    settings = {
      global.security = "user";

      Shows = { 
        path = "/mnt/storage0/Jellyfin/Shows";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };

      Music = { 
        path = "/mnt/storage0/Jellyfin/Music";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };

      Videos = { 
        path = "/mnt/storage0/Media/Videos";
        browsable = true;
        writable = true;
        "guest ok" = false;
        "read only" = false;
        "valid users" = [ userSettings.username ];
      };

      Pictures = { 
        path = "/mnt/storage0/Media/Pictures";
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
