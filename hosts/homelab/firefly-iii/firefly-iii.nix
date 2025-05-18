{ ... }:

{
  services.firefly-iii = {
    enable = true;

    dataDir = "/mnt/storage0/Firefly-III/data";

    settings = {
      APP_KEY_FILE = "/mnt/storage0/Firefly-III/key-file";
    };
  };
}
