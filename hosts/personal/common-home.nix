{ userSettings, ... }:

{
  imports = [ 
    ./common-packages.nix

    ./../../user/desktop/desktop.nix

    ./../../user/app/kitty/kitty.nix 
    ./../../user/app/yazi/yazi.nix
    ./../../user/app/zathura/zathura.nix
    ./../../user/app/lazygit/lazygit.nix
    # ./../../user/app/vscode/vscode.nix
    ./../../user/app/rofi/rofi.nix
    ./../../user/app/qutebrowser/qutebrowser.nix

    ./../../user/shell/zsh/zsh.nix 

    ./../../user/style/stylix.nix

    ./../../user/config/config.nix
  ] ++ (if userSettings.useNextcloud then [./../../user/app/nextcloud/nextcloud.nix] else []);

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
