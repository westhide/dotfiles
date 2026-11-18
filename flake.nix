{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    nixpkgs,
    home-manager,
    system-manager,
    ...
  }:
  let
    opts = import ./shared/option.nix { };
  in
  {
    packages.${opts.system}.system-manager = system-manager.packages.${opts.system}.default;

    systemConfigs.default = system-manager.lib.makeSystemConfig {
      modules = [ ./system ];
      specialArgs = { inherit opts; };
    };

    homeConfigurations.${opts.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = opts.system;
        config.allowUnfree = true;
      };
      modules = [ ./shared/osuser.nix ];
      extraSpecialArgs = { inherit inputs opts; };
    };
  };
}
