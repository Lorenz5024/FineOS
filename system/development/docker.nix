{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  extraGroups = [ "docker" ];
}
