{ pkgs, ext, ... }:

{
  xdg.configFile.niri.source = ext.mklink "config";

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}
