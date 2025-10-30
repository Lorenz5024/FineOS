{ pkgs, config, ... }:

{
  users.users.nextcloud = {
    isSystemUser = true;
    description = "Nextcloud service user";
    group = "nextcloud";
    # home = "/mnt/storage1/nextcloud";
  };

  users.groups.nextcloud = { };

  services.nextcloud = {
    enable = false; 
    package = pkgs.nextcloud32;
    hostName = "homelab.tailf073f1.ts.net";
    datadir = "/mnt/storage1/nextcloud";
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
      # apps_directory = "/var/lib/nextcloud/apps";
    };

    extraAppsEnable = false;
    # extraApps = {
    #   inherit (config.services.nextcloud.package.packages.apps) news contacts calendar;
    # };
    appstoreEnable = true;

    # extraOptions = {
    #   apps_path = [
    #     {
    #       path = "/var/lib/nextcloud/apps";
    #       url = "/apps";
    #       writable = true;
    #     }
    #     {
    #       path = "${config.services.nextcloud.package}/apps";
    #       url = "/core-apps";
    #       writable = false;
    #     }
    #   ];
    # };

  };

  # systemd.tmpfiles.rules = [
  #   "d /var/lib/nextcloud 0750 nextcloud nextcloud -"
  #   "d /mnt/storage1/nextcloud 0750 nextcloud nextcloud -"
  #   "d /mnt/storage1/nextcloud/config 0750 nextcloud nextcloud -"
  # ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
