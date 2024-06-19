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
      lib = nixpkgs.lib;
    in 
    {
      nixosConfigurations."fineos" = 
      let 
        systemSettings = import ./hosts/personal/systemSettings.nix;
        userSettings = import ./hosts/personal/userSettings.nix;
      in 
      lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit hyprland;
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
              inherit systemSettings;
              inherit userSettings;
              inherit ags;
            };
          }

        ];

      };
        
      nixosConfigurations."fineos-laptop" =
      let 
        systemSettings = import ./hosts/laptop/systemSettings.nix;
        userSettings = import ./hosts/personal/userSettings.nix;
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import ./hosts/laptop/home.nix;

            home-manager.extraSpecialArgs = {
              inherit systemSettings;
              inherit userSettings;
              inherit ags;
            };
          }

        ];

      };
    };
}
