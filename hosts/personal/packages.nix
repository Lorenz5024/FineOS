###########################################
# Packages installed without configuration
###########################################

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    streamcontroller
    # modrinth-app
    calibre
    koboldcpp
    sillytavern
    veracrypt

    blender 
    kritat 
    chromium
  ];

}
