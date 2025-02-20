{ pkgs, userSettings, lib, ... }:

{
  imports = [
    ./../minimal-config.nix

    ./../../system/packages.nix
    ./../../system/style/stylix.nix
    ./../../system/app/nixvim/nixvim.nix
  ];

  wsl = {
    defaultUser = userSettings.username;
  };

  # enable zsh
  programs.zsh.enable = lib.mkForce true;

  # disable obsidian.nvim 
  programs.nixvim.plugins.obsidian.enable = lib.mkForce false;

  # fix sudo not working
  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.systemd}/bin/systemctl";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }
    ];
    extraConfig = ''
      Defaults secure_path="${pkgs.coreutils}/bin:/run/current-system/sw/bin"
    '';
  };

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
