{ pkgs, config, hostSettings, ... }:

{
  users.users.nextcloud = {
    isSystemUser = true;
    description = "Nextcloud service user";
    group = "nextcloud";
  };

  users.groups.nextcloud = { };

  services.nextcloud = {
    enable = true; 
    package = pkgs.nextcloud32;
    hostName = "homelab.tailf073f1.ts.net";
    datadir = hostSettings.nextcloud_storage;
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

    appstoreEnable = true;


  };

  systemd.tmpfiles.rules = [
    # "d /var/lib/nextcloud 0750 nextcloud nextcloud -"
    "d ${hostSettings.nextcloud_storage} 0750 nextcloud nextcloud -"
    "d ${hostSettings.nextcloud_storage}/config 0750 nextcloud nextcloud -"
    # "d /mnt/storage1 0750 root root -"
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  environment.systemPackages = [ pkgs.nodejs ];
}
