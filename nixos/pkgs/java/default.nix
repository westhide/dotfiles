{ pkgs, ... }:

{
  home.packages = with pkgs; [
    maven
    gradle
    jetbrains.idea-community
  ];

  programs.java = {
    enable = true;
  };
}
