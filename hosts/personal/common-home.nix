{ userSettings, lib, ... }:

let 
  browser = if userSettings.browser == "vivaldi" then "vivaldi-stable"
            else userSettings.browser;
in
{
  imports = [
    ./common-packages.nix

    ./../../user/app/kitty/kitty.nix
    ./../../user/app/yazi/yazi.nix
    ./../../user/app/zathura/zathura.nix
    ./../../user/app/lazygit/lazygit.nix
    ./../../user/app/qutebrowser/qutebrowser.nix
    ./../../user/app/spotify-player/spotify-player.nix

    ./../../user/shell/zsh/zsh.nix

    ./../../user/style/stylix.nix

    ./../../user/config/config.nix
    ./../../user/app/nextcloud/nextcloud.nix
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = userSettings.name;
        email = userSettings.email;
      };
      init.defaultBranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
    "electron-25.9.0"
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    BROWSER = userSettings.browser;
    FILEMANAGER = userSettings.fileManager;
    TERMINAL = userSettings.terminal;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # !!! Check the documentation on this before changing !!!
  home.stateVersion = "23.11";

  # default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "${browser}.desktop";
      "x-scheme-handler/https" = "${browser}.desktop";
      "x-scheme-handler/about" = "${browser}.desktop";
      "x-scheme-handler/unknown" = "${browser}.desktop";
    };
  };

  # prevent home-manager backup collisions 
  home.file."/home/${userSettings.username}/.gtkrc-2.0".force = lib.mkForce true;

}
