{ config, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "CommitMonoFont" ];
      sansSerif = [ "CommitMonoFont" ];
      monospace = [ "CommitMonoFont" ];
    };
  };
}
