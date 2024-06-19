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

    ags.url = "github:Aylur/ags";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, stylix, ags, hyprland, ... }:
    let
      systemSettingsPC = import ./hosts/personal/systemSettings.nix;
      userSettingsPC = import ./hosts/personal/userSettings.nix;

      systemSettingsLaptop = import ./hosts/laptop/systemSettings.nix;
      userSettingsLaptop = import ./hosts/laptop/userSettings.nix;

      lib = nixpkgs.lib;
    in 
    {
      nixosConfigurations."fineos" = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
          systemSettings = systemSettingsPC;
          userSettings = userSettingsPC;
        };

        modules = [ 
          ./hosts/personal/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettingsPC.username} = import ./hosts/personal/home.nix;

            home-manager.extraSpecialArgs = {
              systemSettings = systemSettingsPC;
              userSettings = userSettingsPC;
              inherit ags;
            };
          }

        ];

      };
        
      nixosConfigurations."fineos-laptop" = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
          systemSettings = systemSettingsLaptop;
          userSettings = userSettingsLaptop;
        };

        modules = [ 
          ./hosts/laptop/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettingsLaptop.username} = import ./hosts/laptop/home.nix;

            home-manager.extraSpecialArgs = {
              systemSettings = systemSettingsLaptop;
              userSettings = userSettingsLaptop;
              inherit ags;
            };
          }

        ];

      };
    };
}
