{
  description = "NixOS flake";

  inputs = {
    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      ...
  }:
  let
    opts = import ./options.nix { };
    h = import ./common/helper.nix { };
  in
  {
    nixosConfigurations.${opts.hostname} = nixpkgs.lib.nixosSystem {
      system = opts.system;
      modules = [
        ./modules
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
