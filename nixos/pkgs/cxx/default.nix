{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      CC = "gcc";
      CXX = "g++";
    };
    packages = with pkgs; [
      gcc
      gdb
      swig
      bison
      #clang
      cmake
      gnumake
      autoconf
      automake
    ];
  };
}
