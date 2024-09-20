{ pkgs, userSettings, ... }:

{
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  users.users.${userSettings.username} = {
    extraGroups = [ "docker" ];
  };
}
