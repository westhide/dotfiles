{ opts, ... }:

{
  imports = [
    ./v2raya.nix
  ];

  nix.enable = false;
  services.userborn.enable = false;
  nixpkgs.hostPlatform = opts.system;
}
