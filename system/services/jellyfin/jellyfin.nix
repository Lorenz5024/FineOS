{ pkgs, lib, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "lorenz";
  };

  # disable autostart
  systemd.services.jellyfin.wantedBy = lib.mkForce [];

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
      intel-media-sdk # QSV up to 11th gen
    ];
  };

  fileSystems."/mnt/sda1" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  # open smb share
  services = {
    samba = {
      enable = true;
      securityType = "user";
      openFirewall = true;
      settings = {
        "jellyfin" = {
          path = "/mnt/sda1";
          browsable = "yes";
          "read only" = "no";
        };
      };
    };
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

  
}
