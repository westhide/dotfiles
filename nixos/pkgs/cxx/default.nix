{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      CC = "clang";
      CXX = "clang++";
    };
    packages = with pkgs; [
      #gcc
      gdb
      lldb
      swig
      bison
      clang
      cmake
      gnumake
      autoconf
      automake
      clang-tools
    ];
  };
}
