{ pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "lorenz";
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
