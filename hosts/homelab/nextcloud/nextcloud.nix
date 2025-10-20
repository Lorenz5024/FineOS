{
  users.users.nextcloud = {
    isSystemUser = true;
    description = "Nextcloud service user";
    group = "nextcloud";
    home = "/var/lib/nextcloud";
  };

  users.groups.nextcloud = { };
}
