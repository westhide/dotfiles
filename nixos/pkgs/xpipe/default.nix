{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xpipe
  ];
}
