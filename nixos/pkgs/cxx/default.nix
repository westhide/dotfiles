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
      lld
      lldb
      swig
      bison
      clang
      cmake
      ccache
      gnumake
      autoconf
      automake
      pkg-config
      clang-tools
    ];
  };
}
