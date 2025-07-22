{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ qbittorrent-nox ];

  users.users.qbittorrent = {
    isSystemUser = true;
    group = "qbittorrent";
    home = "/var/lib/qbittorrent";
    createHome = true;
  };

  users.groups.qbittorrent = {};

  systemd.services.qbittorrent-nox = {
    description = "qBittorrent-nox service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "qbittorrent";
      Group = "qbittorrent";
      ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox";
      WorkingDirectory = "/var/lib/qbittorrent";
      Restart = "always";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8081 ]; # Web UI port

}
