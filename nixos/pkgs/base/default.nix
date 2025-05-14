{ pkgs, ... }:

{
  home.packages = with pkgs; [
    file
    tree
    lsof
    jq
    zip
    wget
    inetutils
    fastfetch
  ];
}
