{ pkgs, userSettings, ... }:

{
  imports = [
    ./../minimal-config.nix

    ./../../system/packages.nix
    ./../../system/style/stylix.nix
    ./../../system/app/nixvim/nixvim.nix
  ];

  wsl.defaultUser = userSettings.username;

  # enable zsh
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.zsh;
    initialHashedPassword = "$y$j9T$vSKWjVc5lnizFNZtUA.f70$xHFMLKZPp47CdoKezuWz69DW41avT9WVlaRwPmF9Mg4";
  };

  users.users.root = {
    initialHashedPassword = "$y$j9T$vSKWjVc5lnizFNZtUA.f70$xHFMLKZPp47CdoKezuWz69DW41avT9WVlaRwPmF9Mg4";
  };
}
