{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gotools
    gopls
  ];
}
