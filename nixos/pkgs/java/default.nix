{ pkgs, ... }:

{
  home.file = {
    ".jdks/openjdk8".source = pkgs.jdk8;
  };

  home.packages = with pkgs; [
    maven
    gradle
    jetbrains.idea
  ];

  programs.java = with pkgs; {
    enable = true;
    package = jdk25;
  };
}
