{ lib, ... }:

let
  dir = ./.;
in
{
  imports = lib.flatten (
    lib.pipe dir [
      builtins.readDir
      (lib.filterAttrs (name: _: name != "default.nix"))
      (lib.mapAttrsToList (name: type: "${dir}/${name}"))
    ]
  );
}
