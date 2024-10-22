{ pkgs, ... }:

{
  environment.systemPackage = with pkgs; [
    maven
    jdk
  ];
}
