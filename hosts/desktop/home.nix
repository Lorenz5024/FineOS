{ hostSettings, ... }:

{
  imports = [ 
    ./../common-home.nix
    ./packages.nix 
  ] ++ map (e: ./. + "/../../user/desktop/${e}/desktop.nix") hostSettings.desktops;

}
