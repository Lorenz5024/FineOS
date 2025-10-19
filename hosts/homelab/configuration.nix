{ lib, hostSettings, userSettings, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./../minimal-config.nix
      ./../../system/style/stylix.nix

      ./../../system/app/nixvim/nixvim.nix

      ./samba/samba.nix
      ./jellyfin/jellyfin.nix
      # ./firefly-iii/firefly-iii.nix
      # ./nginx/nginx.nix
      ./tailscale.nix
      ./agenix/agenix.nix

      ./../../system/services/ssh/ssh.nix
      # ./../../system/services/docker/docker.nix
      ./../../system/services/actual-server/actual-server.nix
      ./openvpn.nix
      ./qbittorrent.nix
    ];

  # enable auto login
  services.getty.autologinUser = "lorenz";

  # enable zsh
  programs.zsh.enable = lib.mkForce true;

  # disable obsidian.nvim 
  programs.nixvim.plugins.obsidian.enable = lib.mkForce false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.zsh;
    initialHashedPassword = "$y$j9T$vSKWjVc5lnizFNZtUA.f70$xHFMLKZPp47CdoKezuWz69DW41avT9WVlaRwPmF9Mg4";
  };

  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;

    loader = {
      timeout = 20;
      efi.canTouchEfiVariables = true;

      systemd-boot = { 
        enable = true;
        configurationLimit = 16;
      };

    };

    kernelParams = [ 
      "quiet" 
      "splash"
      "rd.systemd.show_status=false" 
      "udev.log_level=3"
    ];	

  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";    # Added for VS Code in Wayland
    NH_FLAKE = userSettings.flakeDir;
  };

  networking.hostName = hostSettings.host; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  system.stateVersion = "24.11"; # Did you read the comment?
}
