{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    zip
    file
    wget
    tree
    lsof
    nmap
    unzip
    inetutils
    fastfetch
  ];
}
