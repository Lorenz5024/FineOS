{ pkgs, lib, systemSettings, userSettings, ... }:

{
  imports = [ 
    ./../../system/boot.nix
    ./../../system/greetd.nix
    ./../../system/keyring.nix
    ./../../system/blueman.nix
    ./../../system/sound.nix

    ./../../system/packages.nix
    ./../../system/style/stylix.nix
    ./../../system/app/thunar.nix
    ./../../system/app/nixvim/nixvim.nix
  ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Hyprland
  programs.hyprland.enable = true;

  # Added because steam could not set new storage locations
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # enable zsh
  programs.zsh.enable = true;


  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome3.gvfs;
  };

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # docker
  virtualisation.docker.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in firewall
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1464; } # KDE Connect
    ];
  };

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
    shell = pkgs.zsh;
  };

  # Allowe user for home manger
  nix.settings.allowed-users = [ userSettings.username ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Added for VS Code in Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    FLAKE = userSettings.flakeDir;
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
