{ pkgs, lib, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "lorenz";

    dataDir = "/mnt/Jellyfin/data";
    cacheDir = "/mnt/Jellyfin/cache";
    configDir = "/mnt/Jellyfin/config";
    logDir = "/mnt/Jellyfin/logs";
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver # previously vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
      vpl-gpu-rt # QSV on 11th gen or newer
    ];
  };
}
