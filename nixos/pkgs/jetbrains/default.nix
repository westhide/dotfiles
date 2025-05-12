{ pkgs, ... }:

{
  home.packages = with pkgs.jetbrains; [
    rust-rover
    idea-community
    pycharm-community
  ];
}
