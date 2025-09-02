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
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:westhide/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
      nixpkgs,
      nixos-hardware,
      home-manager,
      ...
  }:
  let
    libs = import ./shared/helper.nix { };
    opts = import ./shared/option.nix { };
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
          home-manager.users.${opts.username} = import ./shared/osuser.nix;
          home-manager.extraSpecialArgs = { inherit inputs libs opts; };
        }
      ];
      specialArgs = { inherit inputs libs opts; };
    };
  };
}
