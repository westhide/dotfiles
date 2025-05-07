{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #clang
    cmake
    gnumake
    gcc
    gdb
  ];
}
