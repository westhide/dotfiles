{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # haskellPackages.ghcup
    ghc
    stack
    haskell-language-server
  ];
}
