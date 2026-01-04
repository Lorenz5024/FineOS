{ userSettings, ... }:

{
  imports = [ 
    ./quickmarks.nix
  ];

  programs.qutebrowser = {
    enable = true;

    settings = {
      auto_save.session = true;
      downloads.location.directory = "/home/" + userSettings.username + "/Downloads";
    };

  };
}
