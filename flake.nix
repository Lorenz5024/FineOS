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
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    # ags.url = "github:Aylur/ags";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, stylix, hyprland, nixos-wsl, ... }:
    let
      lib = nixpkgs.lib;
      userSettings = import ./hosts/personal/userSettings.nix;
    in
    {
      nixosConfigurations."fineos" =
        let
          hostSettings = import ./hosts/personal/hostSettings.nix;
        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
          inherit hostSettings;
          inherit userSettings;
          inherit inputs;
        };

        modules = [
          ./hosts/personal/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/personal/home.nix;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit hostSettings;
              inherit userSettings;
              inherit inputs;
            };
          }

        ];

      };

      nixosConfigurations."fineos-laptop" =
        let
          hostSettings = import ./hosts/laptop/hostSettings.nix;
        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          inherit hostSettings;
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
              inherit inputs;
              inherit hostSettings;
              inherit userSettings;
            };
          }

        ];

      };

      nixosConfigurations."homelab" =
        let
          hostSettings = import ./hosts/homelab/hostSettings.nix;

        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hostSettings;
          inherit userSettings;
          inherit inputs;
        };

        modules = [
          ./hosts/homelab/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/homelab/home.nix;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit hostSettings;
              inherit userSettings;
              inherit inputs;
            };
          }

        ];

      };

      nixosConfigurations."wsl" =
      let
        hostSettings = import ./hosts/personal/hostSettings.nix;
      in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit userSettings;
          inherit hostSettings;
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
