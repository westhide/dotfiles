{ pkgs, ... }:

{

  home.file = {
    ".jdks/openjdk8".source = pkgs.jdk8;
  };

  home.packages = with pkgs; [
    maven
    gradle
  ];

  programs.java = {
    enable = true;
  };
}
