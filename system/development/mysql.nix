{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

    settings = {
      mysqld.bind-address = "127.0.0.1,172.17.0.1";
    };
  };
}
