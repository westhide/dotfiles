{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wechat
  ];
}
