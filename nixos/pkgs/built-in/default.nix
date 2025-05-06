{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #clang
    gcc
    gnumake
    file
    nixfmt-rfc-style
    nixd
  ];
}
