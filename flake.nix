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
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix.url = "github:danth/stylix";
    stylix.url = "github:nix-community/stylix/pull/2337/head";

    # ags.url = "github:Aylur/ags";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    agenix.url = "github:ryantm/agenix";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, stylix, hyprland, agenix, ... }:
    let
      lib = nixpkgs.lib;
      userSettings = import ./hosts/desktop/userSettings.nix;
    in
    {
      nixosConfigurations."fineos-desktop" =
        let
          hostSettings = import ./hosts/desktop/hostSettings.nix;
        in
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          hostName = "fineos-desktop";

          inherit hyprland;
          inherit hostSettings;
          inherit userSettings;
          inherit inputs;
        };

        modules = [
          ./hosts/desktop/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/desktop/home.nix;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

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
          hostName = "fineos-laptop";

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
            home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

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
          hostName = "homelab";

          inherit hostSettings;
          inherit userSettings;
          inherit inputs;
        };

        modules = [
          ./hosts/homelab/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
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

      # nixosConfigurations."wsl" =
      # let
      #   hostSettings = import ./hosts/desktop/hostSettings.nix;
      # in
      # lib.nixosSystem {
      #   system = "x86_64-linux";
      #
      #   specialArgs = {
      #     inherit userSettings;
      #     inherit hostSettings;
      #   };
      #
      #   modules = [
      #     ./hosts/wsl/configuration.nix
      #
      #     nixos-wsl.nixosModules.default {
      #       system.stateVersion = "24.05";
      #       wsl.enable = true;
      #     }
      #
      #     nixvim.nixosModules.nixvim
      #     stylix.nixosModules.stylix
      #     home-manager.nixosModules.home-manager
      #     {
      #       home-manager.useUserPackages = true;
      #       home-manager.users.${userSettings.username} = import ./hosts/wsl/home.nix;
      #       home-manager.backupFileExtension = "backup";
      #
      #       home-manager.extraSpecialArgs = {
      #         inherit userSettings;
      #       };
      #     }
      #   ];
      # };
    };
}
