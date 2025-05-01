{
  description = "NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { 
    self,
    nixpkgs, nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    ...
  } : let
    h = import ./helper.nix {};
    opts = import ./options.nix {};
  in {
    nixosConfigurations.${opts.hostname} = nixpkgs.lib.nixosSystem {
      system = opts.system;
      modules = [
        ./configuration.nix
	nixos-hardware.nixosModules.${opts.hardware}

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${opts.username} = import ./users/${opts.username};
          home-manager.extraSpecialArgs = { inherit inputs h opts; };
        }
      ];
      specialArgs = { inherit inputs h opts; };
    };
  };
}
