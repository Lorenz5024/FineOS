{ pkgs, hostSettings, userSettings, ... }:

{

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = hostSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = hostSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = hostSettings.locale;
    LC_IDENTIFICATION = hostSettings.locale;
    LC_MEASUREMENT = hostSettings.locale;
    LC_MONETARY = hostSettings.locale;
    LC_NAME = hostSettings.locale;
    LC_NUMERIC = hostSettings.locale;
    LC_PAPER = hostSettings.locale;
    LC_TELEPHONE = hostSettings.locale;
    LC_TIME = hostSettings.locale;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allowe user for home manger
  nix.settings.allowed-users = [ userSettings.username ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    unzip
    gnutar
    fd
    cifs-utils
    ffmpeg
    ripgrep
    btop
    zoxide
    tlrc
    pcre2    # grep with more functionality
    home-manager
    nethogs
    htop
    bat
    nh
    p7zip

    (import ./../scripts/fineos-rebuild.nix { inherit pkgs; })
    (import ./../scripts/fineos-update.nix { inherit pkgs; })
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
