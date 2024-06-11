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
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, stylix, ags, ... }:
    let
      systemSettings = import ./systemSettings.nix;
      userSettings = import ./userSettings.nix;
      lib = nixpkgs.lib;
    in 
    {
      nixosConfigurations."fineos" = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };

        modules = [ 
          ./hosts/personal/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/personal/home.nix;

            home-manager.extraSpecialArgs = {
              inherit userSettings;
              inherit ags;
            };
          }

        ];

      };
        
      nixosConfigurations."fineos-laptop" = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };

        modules = [ 
          ./hosts/laptop/configuration.nix

          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/laptop/home.nix;

            home-manager.extraSpecialArgs = {
              inherit userSettings;
              inherit ags;
            };
          }

        ];

      };
    };
}
