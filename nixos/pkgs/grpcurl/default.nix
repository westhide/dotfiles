{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grpcurl
  ];
}
