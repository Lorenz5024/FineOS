{ userSettings, ... }:

{
  imports = [
    ./../../system/style/stylix.nix
    ./../../system/app/nixvim/nixvim.nix
  ];

  wsl.defaultUser = userSettings.username;
}
