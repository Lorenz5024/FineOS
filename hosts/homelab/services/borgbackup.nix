{ hostSettings, ... }:

{
  services.borgbackup.jobs.borgbackup-nextcloud = {
    user = "lorenz";
    paths = hostSettings.nextcloud_storage;

    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /run/secrets/borg-passphrase";
    };

    environment.BORG_RSH = "ssh -i /home/lorenz/.ssh/id_ed25519";
    repo = "ssh://u592092@u592092.your-storagebox.de:23/home/nextcloud-backup";
    compression = "auto,zstd";
    startAt = "*-*-* 04:00:00";
  };
}
