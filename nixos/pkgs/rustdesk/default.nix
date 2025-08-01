{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustdesk
    rustdesk-server
  ];
}
