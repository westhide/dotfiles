{ pkgs, ... }:

{
  home.packages = with pkgs; [
    maven
  ];

  programs.java = {
    enable = true;
  };
}
