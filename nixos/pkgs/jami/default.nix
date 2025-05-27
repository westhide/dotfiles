{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jami
  ];
}
