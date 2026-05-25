{ userSettings, ... }:

{
  services.samba = {
    enable = true;

    nmbd.enbale = true;

    settings = {
      global = {
        security = "user";

        workgroup = "WORKGROUP";
        "server string" = "homelab Samba Server";

        "netbios name" = "HOMELAB";

        "name resolve order" = "bcast host";

        "map to guest" = "Bad User";
      };

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
    "d /mnt/storage0 0775 root users -"
    "d /mnt/storage1 0775 root users -"
  ];

  networking.firewall.allowedTCPPorts = [ 139 445];
  networking.firewall.allowedUDPPorts = [ 137 138];

  # make smb share discoverable
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.avahi = {
    enable = true;

    publish.enable = true;
    publish.userServices = true;

    nssmdns4 = true;
    openFirewall = true;
  };
}
