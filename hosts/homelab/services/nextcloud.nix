{ pkgs, config, ... }:

{
  users.users.nextcloud = {
    isSystemUser = true;
    description = "Nextcloud service user";
    group = "nextcloud";
    home = "/var/lib/nextcloud";
  };

  users.groups.nextcloud = { };

  services.nextcloud = {
    enable = true; 
    package = pkgs.nextcloud32;
    hostName = "homelab.tailf073f1.ts.net";
    datadir = "/mnt/storage1/nextcloud/data";
    https = true;
    database.createLocally = true;
    maxUploadSize = "8G";

    config = {
      adminpassFile = config.age.secrets.nextcloud.path;
      adminuser = "admin";
      dbtype = "pgsql";
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  systemd.tmpfiles.rules = [
    "d /mnt/storage1/nextcloud/data 0750 nextcloud nextcloud -"
  ];
}
