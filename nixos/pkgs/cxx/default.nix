{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #clang
    pkg-config
    autoconf
    automake
    cmake
    gnumake
    gcc
    gdb
    swig
    bison
  ];
}
