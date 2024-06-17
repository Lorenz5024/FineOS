{ userSettings, ... }:

{
  imports = [ 
    ./common-packages.nix
    ./packages.nix 
    ./../../user/desktop/desktop.nix

    ./../../user/app/kitty/kitty.nix 
    ./../../user/app/yazi/yazi.nix
    ./../../user/app/zathura/zathura.nix
    ./../../user/app/lazygit/lazygit.nix
    ./../../user/app/vscode/vscode.nix
    ./../../user/app/rofi/rofi.nix
    ./../../user/app/nextcloud/nextcloud.nix

    ./../../user/shell/zsh/zsh.nix 

    ./../../user/style/stylix.nix
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Set up monitors for hyprland
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 2560x1440@144, 2560x0, 1, vrr, 1"
      #"HDMI-A-1, 3840x2160@60, 0x0, 1"
      "DP-2, 2560x1440@75, 0x0, 1"
      ", preferred, auto, 1, mirror, DP-1"
    ];

    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "NVD_BACKEND,direct"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
    "electron-25.9.0"
  ]; 

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # !!! Check the documentation on this before changing !!!
  home.stateVersion = "23.11";
}
