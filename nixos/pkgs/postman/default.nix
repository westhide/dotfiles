{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.postman
  ];
}
