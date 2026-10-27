{ pkgs, ext, ... }:

{
  xdg.configFile.trippy.source = ext.mklink "config";

  home.packages = with pkgs; [
    trippy
  ];
}
