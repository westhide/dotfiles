{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #clang
    gcc
    gnumake
    file
    jq
    nixfmt-rfc-style
    nixd
  ];
}
