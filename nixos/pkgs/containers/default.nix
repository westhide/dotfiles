{ pkgs, ext, ... }:

{
  xdg.configFile.containers.source = ext.mklink "config";

  home.packages = with pkgs; [
  ];
}
