{ userSettings, ... }:

{
  imports = [ 
    ./packages.nix 

    ./../../user/app/yazi/yazi.nix
    ./../../user/app/lazygit/lazygit.nix

    ./../../user/shell/zsh/zsh.nix

    ./../../user/style/stylix.nix

  ];

}
