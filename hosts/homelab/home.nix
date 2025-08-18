{ userSettings, ... }:

{
  imports = [ 
    ./../../user/app/lazygit/lazygit.nix

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

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };

  programs.home-manager.enable = true;

  # !!! Check the documentation on this before changing !!!
  home.stateVersion = "24.05";
}
