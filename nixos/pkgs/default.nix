{ config, lib, ... }:

let
  dir = ./.;
  pkgsDir = "${config.home.homeDirectory}/dotfiles/nixos/pkgs";
in
{
  imports = lib.flatten (
    lib.pipe dir [
      builtins.readDir
      (lib.filterAttrs (name: _: name != "default.nix"))
      (lib.mapAttrsToList (
        name: type:
        let
          baseDir = "${dir}/${name}";
          prelude = import baseDir;
        in
        lib.setFunctionArgs (args: {
          _file = "${baseDir}/default.nix";
          imports = [
            (prelude (
              args
              // {
                ext = {
                  mklink = path: config.lib.file.mkOutOfStoreSymlink "${pkgsDir}/${name}/${path}";
                };
              }
            ))
          ];
        }) (removeAttrs (lib.functionArgs prelude) [ "ext" ])
      ))
    ]
  );
}
