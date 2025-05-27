{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sniffnet
  ];
}
