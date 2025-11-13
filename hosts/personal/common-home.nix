{ userSettings, ... }:

{
  imports = [
    ./common-packages.nix

    ./../../user/app/kitty/kitty.nix
    ./../../user/app/yazi/yazi.nix
    ./../../user/app/zathura/zathura.nix
    ./../../user/app/lazygit/lazygit.nix
    # ./../../user/app/vscode/vscode.nix
    ./../../user/app/zed-editor/zed-editor.nix
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
    userName = userSettings.name;
    userEmail = userSettings.email;
    extraConfig = {
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
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # !!! Check the documentation on this before changing !!!
  home.stateVersion = "23.11";

  # default applications
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "${userSettings.browser}.desktop";
    "x-scheme-handler/https" = "${userSettings.browser}.desktop";
    "x-scheme-handler/about" = "${userSettings.browser}.desktop";
    "x-scheme-handler/unknown" = "${userSettings.browser}.desktop";
  };

}
