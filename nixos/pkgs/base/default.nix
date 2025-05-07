{ pkgs, ... }:

{
  home.packages = with pkgs; [
    file
    tree
    jq
    zip
    wget
    fastfetch
  ];
}
