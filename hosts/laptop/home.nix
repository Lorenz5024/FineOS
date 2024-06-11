{ userSettings, ... }:

{
  imports = [ 
    ./packages.nix 
    ./../personal/common-packages.nix
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
      # dekstop setup
      # "DP-4, 2560x1440@75, 0x0, 1"
      # "DP-2, 2560x1440@60, 2560x0, 1" 
      # "eDP-1, 2256x1504, 5120x0, 1.333333"

      # just laptop
      "eDP-1, 2256x1504, 0x0, 1.333333"
    ];
  };

  home.stateVersion = "23.11"; # Please read the comment before changing.

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
}
