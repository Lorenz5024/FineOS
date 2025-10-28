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
    https = false;
    database.createLocally = true;
    maxUploadSize = "8G";

    config = {
      adminpassFile = config.age.secrets.nextcloud.path;
      adminuser = "admin";
      dbtype = "pgsql";
    };

    settings = {
      trusted_domains = [
        "homelab.tailf073f1.ts.net"
        "nextcloud.homelab.com"
      ];
    };

    # extraAppsEnable = true;
    appstoreEnable = false;

  };

  systemd.tmpfiles.rules = [
    "d /var/lib/nextcloud 0750 nextcloud nextcloud -"
    "d /var/lib/nextcloud/apps 0750 nextcloud nextcloud -"
    "d /var/lib/nextcloud/config 0750 nextcloud nextcloud -"
    "d /var/lib/nextcloud/data 0750 nextcloud nextcloud -"
    "d /var/lib/nextcloud/extra-apps 0750 nextcloud nextcloud -"
    "d /mnt/storage1/nextcloud/data 0750 nextcloud nextcloud -"
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
