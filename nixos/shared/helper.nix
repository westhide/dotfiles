{ ... }:

{
  mkXdgConfigLink = config : path : config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nixos/pkgs/${path}";
}
