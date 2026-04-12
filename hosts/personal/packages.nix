###########################################
# Packages installed without configuration
###########################################

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    streamcontroller
    calibre
    veracrypt
    r2modman  # mod manager
    solaar
  ];

}
