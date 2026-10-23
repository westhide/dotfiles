{ pkgs, ... }:

{
  home.packages = with pkgs; [
    esptool
    popsicle
  ];
}
