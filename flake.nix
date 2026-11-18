{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    nixpkgs,
    home-manager,
    ...
  }:
  let
    opts = import ./shared/option.nix { };
  in
  {
    homeConfigurations.${opts.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = opts.system;
      };
      modules = [ ./shared/osuser.nix ];
      extraSpecialArgs = { inherit inputs opts; };
    };
  };
}
