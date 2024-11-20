{

  description = "System and home user configuration for fineos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    # ags.url = "github:Aylur/ags";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, stylix, hyprland, nixos-wsl, ... }:
    let
      lib = nixpkgs.lib;
      userSettings = import ./hosts/personal/userSettings.nix;
    in 
    {
      nixosConfigurations."fineos" = 
        let
          systemSettings = import ./hosts/personal/systemSettings.nix;
        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };

        modules = [ 
          ./hosts/personal/configuration.nix

          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/personal/home.nix;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit systemSettings;
              inherit userSettings;
              inherit inputs;
            };
          }

        ];

      };
        
      nixosConfigurations."fineos-laptop" =
        let
          systemSettings = import ./hosts/laptop/systemSettings.nix;
        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
          inherit systemSettings;
          inherit userSettings;
        };

        modules = [ 
          ./hosts/laptop/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/laptop/home.nix;
            home-manager.backupFileExtension = "hm-backup";

            home-manager.extraSpecialArgs = {
              inherit systemSettings;
              inherit userSettings;
              inherit inputs;
            };
          }

        ];

      };

      nixosConfigurations."wsl" = 
      let
        userSettings = import ./hosts/personal/userSettings.nix;
        systemSettings = import ./hosts/personal/systemSettings.nix;
      in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit userSettings;
          inherit systemSettings;
        };

        modules = [
          ./hosts/wsl/configuration.nix

          nixos-wsl.nixosModules.default {
            system.stateVersion = "24.05";
            wsl.enable = true;
          }

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/wsl/home.nix;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit userSettings;
            };
          }
        ];
      };
    };
}
