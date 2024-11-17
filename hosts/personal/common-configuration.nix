{ pkgs, lib, hyprland, userSettings, ... }:

{
  imports = [ 
    ./../minimal-config.nix

    ./../../system/boot.nix
    ./../../system/greetd.nix
    ./../../system/keyring.nix
    ./../../system/bluetooth.nix
    ./../../system/sound.nix

    ./../../system/packages.nix
    ./../../system/style/stylix.nix
    ./../../system/app/thunar.nix
    ./../../system/app/nixvim/nixvim.nix
    
    ./../../system/development/android.nix
    ./../../system/development/rust.nix
  ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # for dual booting
  time.hardwareClockInLocalTime = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Added because steam could not set new storage locations
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # enable zsh
  programs.zsh.enable = true;


  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome.gvfs;
  };

  # Open ports in firewall
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
      { from = 3306; to = 3306; }
      { from = 20000; to = 20000; } # University project
      { from = 3000; to = 3000; } # Summit backend
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1464; } # KDE Connect
      { from = 3306; to = 3306; }
      { from = 3000; to = 3000; } # Summit backend
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.zsh;
  };

  # Added for VS Code in Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    FLAKE = userSettings.flakeDir;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
